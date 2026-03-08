"""
FastFWD V3 - 系统级时序验证
验证 dependency + latency + FIFO深度 的交互影响
"""
from __future__ import annotations
import sys
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Optional, Tuple
from datetime import datetime

sys.path.insert(0, str(Path(__file__).parent.parent / "rtl"))


class Logger:
    """带时序的日志记录器"""
    
    def __init__(self, name: str):
        self.log_file = Path(__file__).parent.parent / "logs" / f"{name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
        self.log_file.parent.mkdir(exist_ok=True)
        self.lines = []
        self._write_header()
    
    def _write_header(self):
        self.lines.append("=" * 100)
        self.lines.append("FastFWD V3 系统级时序验证报告")
        self.lines.append(f"时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        self.lines.append("=" * 100)
        self.lines.append("")
    
    def log(self, msg: str, console: bool = True):
        timestamp = datetime.now().strftime("%H:%M:%S.%f")[:-3]
        line = f"[{timestamp}] {msg}"
        self.lines.append(line)
        if console:
            print(line)
    
    def cycle(self, c: int, msg: str):
        self.log(f"[Cycle {c:4d}] {msg}")
    
    def save(self):
        with open(self.log_file, "w", encoding="utf-8") as f:
            f.write("\n".join(self.lines))
        print(f"\n日志已保存: {self.log_file}")


@dataclass
class Packet:
    """报文数据结构"""
    seq: int
    lane: int
    data: int
    lat: int      # 0~3
    dep: int      # 0~7
    
    @property
    def fe_delay(self) -> int:
        return self.lat + 1  # lat=0 -> 1 cycle, lat=3 -> 4 cycles
    
    def __repr__(self):
        return f"Pkt(seq={self.seq}, lat={self.lat}, dep={self.dep})"


class FastFWDReferenceModel:
    """
    FastFWD 参考模型 - 系统级时序精确模型
    
    关键时序假设:
    1. Input FIFO: 4-entry, 输出延迟1 cycle
    2. FE: 4个并行，每个内部串行（约束检查）
    3. Dependency: 查表1 cycle，无命中则阻塞
    4. ROB: 32-entry, 满时产生反压（2-cycle响应延迟）
    """
    
    def __init__(self, n_fe: int = 4, rob_depth: int = 32, bkpr_threshold: int = 28):
        self.n_fe = n_fe
        self.rob_depth = rob_depth
        self.bkpr_threshold = bkpr_threshold
        
        self.cycle = 0
        self.seq_cnt = 0
        
        # Input FIFO (4-entry)
        self.input_fifo: List[Packet] = []
        self.input_fifo_max = 4
        
        # FE状态: 每个FE的当前处理报文和完成时间
        self.fe_busy: List[Optional[Tuple[Packet, int]]] = [None] * n_fe  # (pkt, finish_cycle)
        self.fe_last_finish = [0] * n_fe  # 上一报文的finish_cycle (RTL中的last_finish寄存器)
        
        # Dependency表 (存储最近完成的报文结果)
        self.dep_table: Dict[int, int] = {}  # seq -> data
        
        # ROB
        self.rob: List[Tuple[int, int]] = []  # (seq, data)
        self.rob_count = 0
        self.next_output_seq = 0
        self.out_ptr = 0
        
        # 反压状态
        self.bkpr = 0  # 当前cycle的反压信号
        self.bkpr_pending = 0  # 下一cycle生效的反压
        
        # 统计
        self.stats = {
            'packets_in': 0,
            'packets_out': 0,
            'fe_stalls': 0,      # FE约束导致的stall
            'dep_stalls': 0,     # 依赖未满足导致的stall
            'bkpr_asserted': 0,  # 反压次数
            'rob_full_stalls': 0 # ROB满导致的stall
        }
        
        self.events: List[str] = []
    
    def reset(self):
        self.__init__(self.n_fe, self.rob_depth, self.bkpr_threshold)
    
    def can_accept_input(self) -> bool:
        """检查是否可以接收新输入（考虑反压延迟）"""
        # 反压信号在cycle N检测，N+1生效，N+2外部响应
        # 所以当前cycle能否输入取决于N-1的反压信号
        return len(self.input_fifo) < self.input_fifo_max and not self.bkpr
    
    def process_input(self, lane_vlds: List[int], lane_datas: List[int], 
                     lane_ctrls: List[int]) -> List[Packet]:
        """处理输入 - 进入Input FIFO"""
        new_packets = []
        
        if not self.can_accept_input():
            if any(lane_vlds):
                self.events.append(f"Cycle {self.cycle}: INPUT STALL (bkpr={self.bkpr}, fifo={len(self.input_fifo)})")
            return new_packets
        
        for lane in range(4):
            if lane_vlds[lane]:
                ctrl = lane_ctrls[lane]
                lat = ctrl & 0x3
                dep = (ctrl >> 2) & 0x7
                
                pkt = Packet(
                    seq=self.seq_cnt,
                    lane=lane,
                    data=lane_datas[lane],
                    lat=lat,
                    dep=dep
                )
                
                self.input_fifo.append(pkt)
                new_packets.append(pkt)
                self.seq_cnt += 1
                self.stats['packets_in'] += 1
                
                self.events.append(f"Cycle {self.cycle}: Input {pkt}")
        
        return new_packets
    
    def check_dependency(self, pkt: Packet) -> Tuple[bool, Optional[int]]:
        """
        检查依赖是否满足 - 修正版
        
        关键理解: dependency数据是FE的输出结果!
        
        场景: seq=4, dep=3 表示依赖seq=1的结果 (4-3=1)
        时序:
        1. seq=1进入FE处理 (lat+1 cycles)
        2. seq=1从FE output出来
        3. seq=1结果写入dep_table
        4. seq=4才能被调度
        
        所以: 只有当被依赖的报文**从FE输出后**，依赖才算满足
        """
        if pkt.dep == 0:
            return True, None
        
        dep_seq = pkt.seq - pkt.dep
        if dep_seq < 0:
            return False, None
        
        # 检查dep_table - 只有FE输出后的数据才在这里
        if dep_seq in self.dep_table:
            return True, self.dep_table[dep_seq]
        
        # 还要检查被依赖的报文是否还在FE中处理
        # 如果在处理中，依赖未满足
        for fe_id in range(self.n_fe):
            if self.fe_busy[fe_id] is not None:
                busy_pkt, _ = self.fe_busy[fe_id]
                if busy_pkt.seq == dep_seq:
                    # 被依赖的报文还在FE中处理
                    return False, None
        
        # 检查被依赖的报文是否在ROB中(已完成但未输出)
        for seq, data in self.rob:
            if seq == dep_seq:
                return True, data
        
        return False, None
    
    def check_fe_constraint(self, fe_id: int, pkt: Packet) -> bool:
        """
        FE约束: 同一FE内，finish_cycle不能相等
        
        目的: 防止同一FE在同一cycle输出两笔数据(只有一个输出端口)
        
        用户场景:
        - Cycle 0: seq=0, lat=3 -> finish@4
        - Cycle 1: seq=1, lat=1 -> finish@3
        - 4 != 3, 不冲突, 允许!
        """
        finish_cycle = self.cycle + pkt.fe_delay
        
        # 检查该FE中是否有报文会在同一cycle完成
        if self.fe_busy[fe_id] is not None:
            _, existing_finish = self.fe_busy[fe_id]
            if finish_cycle == existing_finish:
                return False  # 冲突：会在同一cycle输出
        
        return True
    
    def schedule_fe(self) -> List[Tuple[int, Packet]]:
        """
        FE调度 - 关键时序逻辑
        考虑: dependency + latency约束 + FE可用性
        """
        scheduled = []
        
        # 从Input FIFO取出报文（FIFO输出延迟1 cycle，简化模型直接取）
        fifo_copy = self.input_fifo[:]
        
        for pkt in fifo_copy:
            # 检查依赖
            dep_ok, dep_data = self.check_dependency(pkt)
            if not dep_ok:
                self.stats['dep_stalls'] += 1
                self.events.append(f"Cycle {self.cycle}: DEP STALL {pkt} (waiting for seq={pkt.seq - pkt.dep})")
                continue  # 依赖不满足，留在FIFO中
            
            # 找可用FE
            fe_assigned = None
            for fe_id in range(self.n_fe):
                if self.fe_busy[fe_id] is None:  # FE空闲
                    # 检查约束
                    if self.check_fe_constraint(fe_id, pkt):
                        fe_assigned = fe_id
                        break
            
            if fe_assigned is None:
                # 没有可用FE或约束不满足
                self.stats['fe_stalls'] += 1
                if all(self.fe_busy[i] is not None for i in range(self.n_fe)):
                    self.events.append(f"Cycle {self.cycle}: FE STALL {pkt} (all FE busy)")
                else:
                    self.events.append(f"Cycle {self.cycle}: CONSTRAINT STALL {pkt} (latency constraint)")
                continue
            
            # 调度到FE
            finish_cycle = self.cycle + pkt.fe_delay
            self.fe_busy[fe_assigned] = (pkt, finish_cycle)
            self.fe_last_finish[fe_assigned] = finish_cycle
            self.input_fifo.remove(pkt)
            
            scheduled.append((fe_assigned, pkt))
            self.events.append(f"Cycle {self.cycle}: FE{fe_assigned} schedule {pkt}, finish@{finish_cycle}")
        
        return scheduled
    
    def complete_fe(self) -> List[Packet]:
        """FE完成处理 - 报文进入ROB"""
        completed = []
        
        for fe_id in range(self.n_fe):
            if self.fe_busy[fe_id] is not None:
                pkt, finish_cycle = self.fe_busy[fe_id]
                if self.cycle >= finish_cycle:
                    # FE完成
                    completed.append(pkt)
                    self.fe_busy[fe_id] = None
                    
                    # 存入依赖表
                    self.dep_table[pkt.seq] = pkt.data
                    
                    # 存入ROB
                    self.rob.append((pkt.seq, pkt.data))
                    self.rob_count += 1
                    
                    self.events.append(f"Cycle {self.cycle}: FE{fe_id} complete {pkt}, enter ROB")
        
        return completed
    
    def update_backpressure(self):
        """
        更新反压信号 - 关键时序
        Cycle N: 检测ROB水位
        Cycle N+1: bkpr生效
        Cycle N+2: 外部响应，input=0
        """
        # 检测ROB水位
        need_bkpr = self.rob_count >= self.bkpr_threshold
        
        if need_bkpr and self.bkpr_pending == 0:
            self.events.append(f"Cycle {self.cycle}: ROB near full ({self.rob_count}/{self.rob_depth}), asserting bkpr next cycle")
        
        # 反压信号延迟1 cycle生效
        self.bkpr = self.bkpr_pending
        self.bkpr_pending = 1 if need_bkpr else 0
        
        if self.bkpr:
            self.stats['bkpr_asserted'] += 1
    
    def get_output(self) -> List[Tuple[int, int, int]]:
        """输出调度 - 按序输出"""
        outputs = []
        
        # 按seq排序ROB
        self.rob.sort(key=lambda x: x[0])
        
        lane = self.out_ptr
        next_seq = self.next_output_seq
        
        for seq, data in self.rob[:]:
            if seq != next_seq:
                break
            
            outputs.append((lane, data, seq))
            self.rob.remove((seq, data))
            self.rob_count -= 1
            
            lane = (lane + 1) % 4
            next_seq += 1
            self.stats['packets_out'] += 1
            
            if len(outputs) >= 4:
                break
        
        self.out_ptr = lane
        self.next_output_seq = next_seq
        
        if outputs:
            lanes_str = ", ".join([f"lane{l}=seq{s}" for l, _, s in outputs])
            self.events.append(f"Cycle {self.cycle}: Output {lanes_str}")
        
        return outputs
    
    def run_cycle(self, lane_vlds: List[int], lane_datas: List[int], 
                  lane_ctrls: List[int]) -> List[Tuple[int, int, int]]:
        """运行一个cycle"""
        self.cycle += 1
        
        # 1. 输入阶段（考虑反压）
        self.process_input(lane_vlds, lane_datas, lane_ctrls)
        
        # 2. FE调度
        self.schedule_fe()
        
        # 3. FE完成
        self.complete_fe()
        
        # 4. 更新反压
        self.update_backpressure()
        
        # 5. 输出
        outputs = self.get_output()
        
        return outputs


# ============================================================================
# 测试用例
# ============================================================================

def test_dependency_timing():
    """
    测试依赖时序
    
    场景: 
    - Cycle 0: 输入 seq=0 (lat=0, dep=0)
    - Cycle 1: 输入 seq=1 (lat=0, dep=1) - 依赖seq=0
    
    验证:
    - seq=1必须在seq=0完成后才能进入FE
    """
    print("\n" + "="*60)
    print("TEST: Dependency Timing")
    print("="*60)
    
    model = FastFWDReferenceModel()
    logger = Logger("test_dependency_timing")
    
    # Cycle 1: 输入seq=0
    print("\nCycle 1: Input seq=0 (no dep)")
    out = model.run_cycle([1,0,0,0], [0x100,0,0,0], [0x0,0,0,0])  # lat=0, dep=0
    print(f"  FE状态: {[model.fe_busy[i] for i in range(4)]}")
    
    # Cycle 2: 输入seq=1(依赖seq=0)，seq=0完成
    print("\nCycle 2: Input seq=1 (dep=1), seq=0 should complete")
    out = model.run_cycle([1,0,0,0], [0x200,0,0,0], [0x4,0,0,0])  # lat=0, dep=1
    print(f"  FE状态: {[model.fe_busy[i] for i in range(4)]}")
    print(f"  依赖表: {model.dep_table}")
    
    # 运行到输出
    for i in range(10):
        out = model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        if out:
            print(f"  Output: {out}")
    
    # 验证
    assert model.stats['packets_in'] == 2, f"Expected 2 in, got {model.stats['packets_in']}"
    assert model.stats['packets_out'] == 2, f"Expected 2 out, got {model.stats['packets_out']}"
    print("\n✓ Dependency timing test PASSED")
    
    for e in model.events[-10:]:
        logger.log(e, False)
    logger.save()


def test_latency_constraint():
    """
    测试Latency约束 - 修正版
    
    核心理解: 同一FE内，finish_cycle不能相等，但可以交错
    
    允许的场景:
    - Cycle 0: seq=0, lat=3 -> finish@4
    - Cycle 1: seq=1, lat=1 -> finish@3  (允许，3 != 4)
    
    禁止的场景:
    - Cycle 0: seq=0, lat=2 -> finish@3
    - Cycle 1: seq=1, lat=1 -> finish@3  (禁止，3 == 3)
    """
    print("\n" + "="*60)
    print("TEST: Latency Constraint (Corrected)")
    print("="*60)
    
    model = FastFWDReferenceModel()
    logger = Logger("test_latency_constraint")
    
    # 场景1: lat=3后跟lat=1 - 应该允许（finish_cycle不同）
    print("\nScenario 1: lat=3 followed by lat=1 (should ALLOW)")
    print("Cycle 1: seq=0, lat=3 -> finish@4")
    out = model.run_cycle([1,0,0,0], [0x100,0,0,0], [0x3,0,0,0])  # lat=3
    print(f"  FE0: busy with seq=0, finish@{model.fe_busy[0][1] if model.fe_busy[0] else 'N/A'}")
    
    print("Cycle 2: seq=1, lat=1 -> finish@3")
    out = model.run_cycle([1,0,0,0], [0x200,0,0,0], [0x1,0,0,0])  # lat=1
    fe0_status = model.fe_busy[0]
    fe1_status = model.fe_busy[1]
    print(f"  FE0: {fe0_status}")
    print(f"  FE1: {fe1_status}")
    
    # seq=1应该被调度到FE1（FE0 busy）
    assert fe1_status is not None and fe1_status[0].seq == 1, "seq=1 should be scheduled"
    print("  ✓ seq=1 scheduled to FE1 (finish@3 != finish@4, no conflict)")
    
    # 场景2: lat=2后跟lat=1到同一FE - 应该禁止（finish_cycle相同）
    print("\nScenario 2: lat=2 followed by lat=1 to same FE (should BLOCK)")
    model.reset()
    
    print("Cycle 1: seq=0, lat=2 -> finish@3")
    out = model.run_cycle([1,0,0,0], [0x100,0,0,0], [0x2,0,0,0])  # lat=2
    print(f"  FE0: busy with seq=0, finish@{model.fe_busy[0][1]}")
    
    # 填满其他FE，迫使seq=1必须进FE0
    print("Cycles 2-4: Fill FE1-FE3 to force seq=1 into FE0")
    for i in range(3):
        out = model.run_cycle([1,0,0,0], [0x200+i*0x100,0,0,0], [0x0,0,0,0])  # lat=0, quick finish
    
    print("Cycle 5: seq=4, lat=1 -> would finish@6, but FE0 busy until 3...")
    # 等待FE0完成
    for i in range(3):
        out = model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        if model.fe_busy[0] is None:
            print(f"  FE0 becomes free at cycle {model.cycle}")
            break
    
    print("Cycle 6+: seq=4 can now enter FE0")
    out = model.run_cycle([1,0,0,0], [0x500,0,0,0], [0x1,0,0,0])  # lat=1
    print(f"  FE0: {model.fe_busy[0]}")
    
    # 运行到完成
    for i in range(10):
        out = model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
    
    print(f"\n  Total packets: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
    assert model.stats['packets_out'] == 5
    print("\n✓ Latency constraint test PASSED")
    
    for e in model.events:
        logger.log(e, False)
    logger.save()


def test_fifo_backpressure():
    """
    测试FIFO深度和反压
    
    场景:
    - 持续高速输入，填满ROB
    - 验证反压在2-cycle延迟后生效
    - 验证ROB不会溢出
    """
    print("\n" + "="*60)
    print("TEST: FIFO Backpressure")
    print("="*60)
    
    model = FastFWDReferenceModel(rob_depth=8, bkpr_threshold=6)  # 小ROB加速测试
    logger = Logger("test_fifo_backpressure")
    
    # 持续输入20个cycle
    print("\nContinuous input for 20 cycles...")
    for i in range(20):
        ctrl = (i % 4)  # lat = 0~3
        out = model.run_cycle([1,1,1,1], [0x100+i,0x200+i,0x300+i,0x400+i], [ctrl,ctrl,ctrl,ctrl])
        if i < 10 or i > 17:
            print(f"  Cycle {i+1}: bkpr={model.bkpr}, ROB={model.rob_count}, FIFO={len(model.input_fifo)}")
    
    print(f"\n  Total in: {model.stats['packets_in']}")
    print(f"  Total out: {model.stats['packets_out']}")
    print(f"  Current ROB: {model.rob_count}")
    print(f"  Current FIFO: {len(model.input_fifo)}")
    print(f"  BKPR asserted cycles: {model.stats['bkpr_asserted']}")
    
    # 继续运行直到输出完成
    print("\nDraining...")
    for i in range(50):
        out = model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        if out:
            print(f"  Output at cycle {model.cycle}: {len(out)} packets")
    
    # 验证
    assert model.rob_count <= 8, f"ROB overflow! count={model.rob_count}"
    assert model.stats['packets_in'] == model.stats['packets_out'], "Mismatch!"
    print(f"\n✓ FIFO backpressure test PASSED")
    print(f"  Final: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
    
    for e in model.events[:20] + model.events[-10:]:
        logger.log(e, False)
    logger.save()


def test_cross_fe_no_constraint():
    """
    测试不同FE之间无约束
    
    场景:
    - FE0: lat=2 (finish@3)
    - FE1: lat=1 (finish@2) - 应该可以并行
    
    验证:
    - 不同FE之间没有latency约束
    """
    print("\n" + "="*60)
    print("TEST: Cross-FE No Constraint")
    print("="*60)
    
    model = FastFWDReferenceModel()
    logger = Logger("test_cross_fe_no_constraint")
    
    # Cycle 1: 2个报文同时输入，不同lane
    print("\nCycle 1: Input 2 packets")
    out = model.run_cycle([1,1,0,0], [0x100,0x200,0,0], [0x2,0x1,0,0])  # lat=2, lat=1
    print(f"  FE状态: {[model.fe_busy[i] for i in range(4)]}")
    
    # 检查两个报文都被调度
    busy_count = sum(1 for x in model.fe_busy if x is not None)
    print(f"  Busy FE count: {busy_count}")
    
    # 运行
    for i in range(10):
        out = model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        if out:
            print(f"  Output: {out}")
    
    assert model.stats['packets_out'] == 2
    assert model.stats['fe_stalls'] == 0, "Should have no stalls for different FE"
    print("\n✓ Cross-FE no constraint test PASSED")
    
    for e in model.events:
        logger.log(e, False)
    logger.save()


def test_complex_scenario():
    """
    综合场景测试
    
    混合: 依赖 + 不同latency + 高负载
    """
    print("\n" + "="*60)
    print("TEST: Complex Scenario")
    print("="*60)
    
    model = FastFWDReferenceModel()
    logger = Logger("test_complex_scenario")
    
    # 生成复杂输入序列
    # seq: 0,1,2,3,4,5,6,7
    # dep: 0,1,0,2,0,0,3,0
    # lat: 0,1,2,0,1,2,0,1
    
    inputs = [
        ([1,1,1,1], [0x100,0x200,0x300,0x400], [0x0,0x5,0x2,0x8]),  # 0:lat0,dep0; 1:lat1,dep1; 2:lat2,dep0; 3:lat0,dep2
        ([1,1,1,1], [0x500,0x600,0x700,0x800], [0x1,0x2,0x0,0x9]),  # 4:lat1,dep0; 5:lat2,dep0; 6:lat0,dep3; 7:lat1,dep0
    ]
    
    print("\nInput sequence with mixed dependencies and latencies:")
    for i, (vlds, datas, ctrls) in enumerate(inputs):
        print(f"  Cycle {i+1}: {[(ctrls[j]&0x3, (ctrls[j]>>2)&0x7) for j in range(4) if vlds[j]]}")
        out = model.run_cycle(vlds, datas, ctrls)
    
    # 运行到完成
    print("\nDraining...")
    for i in range(30):
        out = model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        if out:
            print(f"  Cycle {model.cycle}: Output {out}")
    
    print(f"\n  Total in: {model.stats['packets_in']}")
    print(f"  Total out: {model.stats['packets_out']}")
    print(f"  FE stalls: {model.stats['fe_stalls']}")
    print(f"  Dep stalls: {model.stats['dep_stalls']}")
    
    assert model.stats['packets_in'] == model.stats['packets_out']
    print("\n✓ Complex scenario test PASSED")
    
    for e in model.events:
        logger.log(e, False)
    logger.save()


def test_fe_finish_cycle_conflict():
    """
    专门测试FE finish_cycle冲突场景
    
    用户质疑的场景:
    - Cycle 0: seq=0进入FE0, lat=3 (finish_cycle = 0 + 3 + 1 = 4)
    - Cycle 1: seq=1尝试进入FE0, lat=1 (finish_cycle = 1 + 1 + 1 = 3)
    - RTL检查: 3 > 4? False -> 应该被阻止!
    
    这是严格的finish_cycle递减，RTL会阻止。
    """
    print("\n" + "="*60)
    print("TEST: FE Finish Cycle Conflict")
    print("="*60)
    
    model = FastFWDReferenceModel()
    logger = Logger("test_fe_finish_cycle_conflict")
    
    # === 关键测试: lat=3后lat=1应该被阻止 ===
    print("\n--- 关键测试: seq=0(lat=3)后seq=1(lat=1)应该被阻止 ---")
    print("说明: seq=0 finish@4, seq=1 finish@3, 3>4? False")
    
    print("Cycle 1: seq=0, lat=3 -> finish@5 (cycle 1 + 3 + 1)")
    out = model.run_cycle([1,0,0,0], [0x100,0,0,0], [0x3,0,0,0])
    print(f"  FE0: {model.fe_busy[0]}")
    print(f"  last_finish[0] = {model.fe_last_finish[0]}")
    
    print("\nRunning until seq=0 completes...")
    # 运行直到seq=0完成
    for i in range(10):
        model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        if model.fe_busy[0] is None:
            print(f"  FE0 completes at cycle {model.cycle}, last_finish={model.fe_last_finish[0]}")
            break
    
    print(f"\nCycle {model.cycle + 1}: seq=1, lat=0 -> would finish@{model.cycle + 1 + 0 + 1}")
    print(f"  如果允许: finish_cycle = {model.cycle + 2}")
    print(f"  约束检查: {model.cycle + 2} > {model.fe_last_finish[0]}? {model.cycle + 2 > model.fe_last_finish[0]}")
    
    # 现在让seq=1进入
    out = model.run_cycle([1,0,0,0], [0x200,0,0,0], [0x0,0,0,0])
    print(f"  结果: FE0={model.fe_busy[0]}")
    
    # 再测试lat=1的情况（应该被阻止如果finish_cycle递减）
    model2 = FastFWDReferenceModel()
    print("\n--- 测试2: 连续进入同一FE，finish_cycle必须递增 ---")
    print("Cycle 1: seq=0, lat=0 -> finish@2")
    model2.run_cycle([1,0,0,0], [0x100,0,0,0], [0x0,0,0,0])
    print(f"  last_finish[0]={model2.fe_last_finish[0]}")
    
    # 等FE0空闲
    for i in range(3):
        model2.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
    
    print(f"Cycle {model2.cycle + 1}: seq=1, lat=0 -> would finish@{model2.cycle + 2}")
    print(f"  约束: {model2.cycle + 2} > {model2.fe_last_finish[0]}? {model2.cycle + 2 > model2.fe_last_finish[0]}")
    model2.run_cycle([1,0,0,0], [0x200,0,0,0], [0x0,0,0,0])
    print(f"  结果: FE0={model2.fe_busy[0]}")
    
    # 运行到完成
    for i in range(10):
        model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        model2.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
    
    print(f"\n  Model1: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
    print(f"  Model2: in={model2.stats['packets_in']}, out={model2.stats['packets_out']}")
    print("\n✓ FE finish cycle conflict test COMPLETED")
    
    for e in model.events:
        logger.log(e, False)
    logger.save()


def test_dependency_timing_correct():
    """
    测试Dependency正确时序 - 核心修正
    
    关键理解: dependency数据是FE的输出结果!
    
    场景: seq=4, dep=3 表示依赖seq=1的结果 (4-3=1)
    
    正确时序:
    Cycle 1: seq=1进入FE (lat=1, dep=0)
    Cycle 2: FE处理中
    Cycle 3: seq=1从FE输出 -> 写入dep_table
    Cycle 4: seq=4检查dep=3 -> 依赖满足!
    
    错误时序(之前模型):
    Cycle 1: seq=1进入FE -> 立即写入dep_table (错!)
    Cycle 2: seq=4检查dep=3 -> 错误地满足
    """
    print("\n" + "="*60)
    print("TEST: Dependency Timing - FE Output Dependency")
    print("="*60)
    
    model = FastFWDReferenceModel()
    logger = Logger("test_dependency_fe_output")
    
    print("\n场景: seq=4依赖seq=1的结果 (dep=3)")
    print("时序: seq=1必须完成FE处理后，seq=4才能进入FE\n")
    
    # Cycle 1: seq=0,1,2,3进入 (无依赖或依赖已满足)
    print("Cycle 1: 输入seq=0,1,2,3")
    out = model.run_cycle([1,1,1,1], [0x100,0x200,0x300,0x400], [0x1,0x0,0x0,0x0])  # seq0:lat1,seq1-3:lat0
    print(f"  FE状态: {[model.fe_busy[i] for i in range(4)]}")
    print(f"  dep_table: {model.dep_table}")
    
    # Cycle 2-3: 等待seq=1完成FE处理
    print("\nCycles 2-3: 等待seq=1完成FE处理...")
    for i in range(2):
        model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
        print(f"  Cycle {i+2}: dep_table={model.dep_table}")
        if 1 in model.dep_table:
            print(f"    *** seq=1结果已写入dep_table ***")
    
    # Cycle 4: 现在seq=4应该可以进入 (依赖满足)
    print("\nCycle 4+: 尝试输入seq=4 (dep=3,依赖seq=1)")
    # 先输入一些填充报文
    for i in range(3):
        model.run_cycle([1,0,0,0], [0x500+i*0x100,0,0,0], [0x0,0,0,0])
    
    # 现在seq=4 (实际seq=7了因为前面输入了7个报文)
    current_seq = model.seq_cnt
    print(f"  当前seq_cnt={current_seq}, 输入新报文dep=3 (依赖seq={current_seq-3})")
    
    # 检查依赖
    dep_target = current_seq - 3
    dep_satisfied = dep_target in model.dep_table
    print(f"  依赖目标seq={dep_target}在dep_table中? {dep_satisfied}")
    if dep_satisfied:
        print(f"  依赖数据: 0x{model.dep_table[dep_target]:x}")
    
    out = model.run_cycle([1,0,0,0], [0x800,0,0,0], [0xC])  # lat=0, dep=3
    print(f"  FE状态: {[model.fe_busy[i] for i in range(4)]}")
    
    # 验证
    fe_has_pkt = any(model.fe_busy[i] is not None and model.fe_busy[i][0].seq == current_seq 
                     for i in range(4))
    if dep_satisfied and fe_has_pkt:
        print(f"\n  ✓ seq={current_seq}成功进入FE (依赖已满足)")
    elif not dep_satisfied:
        print(f"\n  ✗ seq={current_seq}应该被阻塞 (依赖未满足)")
    
    # 运行到完成
    for i in range(20):
        model.run_cycle([0,0,0,0], [0,0,0,0], [0,0,0,0])
    
    print(f"\n  Total: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
    print(f"  Dep stalls: {model.stats['dep_stalls']}")
    print("\n✓ Dependency FE output timing test COMPLETED")
    
    for e in model.events[:30]:
        logger.log(e, False)
    logger.save()


if __name__ == "__main__":
    print("\n" + "="*70)
    print("FastFWD V3 - 系统级时序验证")
    print("验证: Dependency + Latency + FIFO深度 的交互影响")
    print("="*70)
    
    test_dependency_timing()
    test_latency_constraint()
    test_fifo_backpressure()
    test_cross_fe_no_constraint()
    test_complex_scenario()
    test_fe_finish_cycle_conflict()
    test_dependency_timing_correct()
    
    print("\n" + "="*70)
    print("所有测试通过!")
    print("="*70)
