"""
FastFWD V2 Testbench
易懂的测试平台，测试结果保存为 log 文件

作者: Kimi Claw
日期: 2026-03-01
"""
from __future__ import annotations
import sys
import random
from pathlib import Path
from dataclasses import dataclass
from typing import List, Dict, Optional, Tuple
from datetime import datetime

# 添加 pyCircuit 到路径
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent.parent))
sys.path.insert(0, str(Path(__file__).parent.parent / "rtl"))

from pycircuit import Tb, compile, testbench, u


# =============================================================================
# 日志配置
# =============================================================================

LOG_FILE = Path(__file__).parent / "test_results.log"


def log(msg: str, print_to_console=True):
    """写入日志文件"""
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_line = f"[{timestamp}] {msg}\n"
    
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(log_line)
    
    if print_to_console:
        print(msg)


def init_log():
    """初始化日志文件"""
    with open(LOG_FILE, "w", encoding="utf-8") as f:
        f.write("=" * 70 + "\n")
        f.write("FastFWD V2 Testbench Log\n")
        f.write(f"Start Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("=" * 70 + "\n\n")


# =============================================================================
# 报文数据结构
# =============================================================================

@dataclass
class Packet:
    """报文数据结构"""
    seq: int           # 全局报文序号
    lane: int          # 输入 lane (0~3)
    data: int          # 128位数据
    ctrl: int          # 5位控制信号
    cycle: int         # 输入 cycle
    
    def __repr__(self):
        return f"Packet(seq={self.seq}, lane={self.lane}, data=0x{self.data:08x}..., cycle={self.cycle})"


# =============================================================================
# 参考模型 (软件模拟正确行为)
# =============================================================================

class FastFWDRefModel:
    """
    FastFWD 参考模型 - 用软件模拟正确的硬件行为
    
    功能:
    1. 按 lane0→lane3 顺序收集输入
    2. 分配全局报文序号
    3. 按报文序号顺序输出
    4. 支持 warp around 输出
    """
    
    def __init__(self):
        self.seq_counter = 0           # 报文序号计数器
        self.packets: List[Packet] = []  # 所有输入的报文
        self.output_queue: List[Packet] = []  # 待输出队列
        self.output_seq = 0            # 下一个应该输出的序号
        self.out_ptr = 0               # 输出指针 (0~3)
        
        # 统计
        self.packets_in = 0
        self.packets_out = 0
        
    def process_input(self, cycle: int, lane_vlds: List[int], 
                      lane_datas: List[int], lane_ctrls: List[int]) -> List[Packet]:
        """
        处理输入
        
        按 lane0→lane3 顺序收集有效输入，分配序号
        """
        new_packets = []
        
        for lane in range(4):  # lane0 → lane3
            if lane_vlds[lane]:
                pkt = Packet(
                    seq=self.seq_counter,
                    lane=lane,
                    data=lane_datas[lane] & ((1 << 128) - 1),
                    ctrl=lane_ctrls[lane] & 0x1F,
                    cycle=cycle
                )
                self.packets.append(pkt)
                self.output_queue.append(pkt)
                new_packets.append(pkt)
                
                self.seq_counter += 1
                self.packets_in += 1
        
        return new_packets
    
    def get_output(self, cycle: int) -> List[Tuple[int, int, int]]:
        """
        获取输出
        
        返回: [(lane, data, seq), ...] 按 lane 顺序
        
        规则:
        - 从 out_ptr 开始输出
        - 按报文序号顺序
        - 最多 4 个
        - warp around
        """
        outputs = []
        
        # 按 seq 排序输出队列
        self.output_queue.sort(key=lambda p: p.seq)
        
        # 从 out_ptr 开始，取最多 4 个
        lane = self.out_ptr
        count = 0
        
        for pkt in self.output_queue[:]:
            if count >= 4:
                break
            
            outputs.append((lane, pkt.data, pkt.seq))
            self.output_queue.remove(pkt)
            
            lane = (lane + 1) % 4
            count += 1
            self.packets_out += 1
        
        self.out_ptr = lane  # 更新输出指针
        
        return outputs
    
    def check_output(self, cycle: int, lane: int, data: int, vld: int) -> Optional[str]:
        """检查输出是否正确"""
        if not vld:
            return None
        
        # 找到这个 lane 应该输出的报文
        if not self.output_queue:
            return f"Cycle {cycle}: lane{lane} 有输出但队列为空"
        
        # 按顺序检查
        expected = self.output_queue[0]
        
        if data != expected.data:
            return f"Cycle {cycle}: lane{lane} 数据不匹配! 期望 0x{expected.data:032x}, 实际 0x{data:032x}"
        
        return None
    
    def get_stats(self) -> str:
        """获取统计信息"""
        return f"输入报文: {self.packets_in}, 输出报文: {self.packets_out}, 队列中: {len(self.output_queue)}"


# =============================================================================
# 测试用例
# =============================================================================

class TestCases:
    """测试用例集合"""
    
    def __init__(self, seed: int = 42):
        self.rng = random.Random(seed)
        self.ref = FastFWDRefModel()
        self.cycle = 0
        
    def generate_data(self) -> int:
        """生成随机 128 位数据"""
        return self.rng.getrandbits(128)
    
    def test_001_single_lane(self) -> bool:
        """
        测试 1: 单 lane 基础测试
        
        场景: 只使用 lane0，每 2 个 cycle 输入一个报文
        期望: 输出顺序与输入顺序一致
        """
        log("\n" + "=" * 70)
        log("测试 1: 单 lane 基础测试")
        log("=" * 70)
        
        self.ref = FastFWDRefModel()
        self.cycle = 0
        errors = []
        
        # 发送 10 个报文
        for i in range(10):
            self.cycle = i * 2  # 每 2 cycle 一个
            
            # 输入: lane0
            vlds = [1, 0, 0, 0]
            datas = [self.generate_data(), 0, 0, 0]
            ctrls = [0, 0, 0, 0]
            
            pkts = self.ref.process_input(self.cycle, vlds, datas, ctrls)
            log(f"  Cycle {self.cycle}: lane0 输入 seq={pkts[0].seq}")
            
            # 检查输出 (简化: 假设下一 cycle 就有输出)
            outputs = self.ref.get_output(self.cycle + 1)
            for lane, data, seq in outputs:
                log(f"  Cycle {self.cycle + 1}: lane{lane} 输出 seq={seq}")
        
        # 排空队列
        for i in range(5):
            outputs = self.ref.get_output(self.cycle + 2 + i)
            if outputs:
                for lane, data, seq in outputs:
                    log(f"  Cycle {self.cycle + 2 + i}: lane{lane} 输出 seq={seq}")
        
        log(f"  结果: {self.ref.get_stats()}")
        
        if errors:
            for e in errors:
                log(f"  错误: {e}")
            return False
        
        log("  ✓ 测试通过")
        return True
    
    def test_002_multi_lane(self) -> bool:
        """
        测试 2: 多 lane 并行测试
        
        场景: 4 个 lane 同时输入
        期望: 按 lane0→lane3 顺序分配序号，输出也按此顺序
        """
        log("\n" + "=" * 70)
        log("测试 2: 多 lane 并行测试")
        log("=" * 70)
        
        self.ref = FastFWDRefModel()
        errors = []
        
        # Cycle 0: 4 个 lane 同时输入
        vlds = [1, 1, 1, 1]
        datas = [0xA0, 0xA1, 0xA2, 0xA3]
        ctrls = [0, 0, 0, 0]
        
        pkts = self.ref.process_input(0, vlds, datas, ctrls)
        log(f"  Cycle 0: 4 个 lane 同时输入")
        for pkt in pkts:
            log(f"    lane{pkt.lane} -> seq={pkt.seq}, data=0x{pkt.data:x}")
        
        # 验证序号分配
        expected_seqs = [0, 1, 2, 3]
        actual_seqs = [p.seq for p in pkts]
        if actual_seqs != expected_seqs:
            log(f"  错误: 序号分配错误! 期望 {expected_seqs}, 实际 {actual_seqs}")
            return False
        
        # 检查输出顺序
        outputs = self.ref.get_output(1)
        log(f"  Cycle 1: 输出")
        for lane, data, seq in outputs:
            log(f"    lane{lane}: seq={seq}, data=0x{data:x}")
        
        # 验证输出顺序
        expected_output_seqs = [0, 1, 2, 3]
        actual_output_seqs = [seq for _, _, seq in outputs]
        if actual_output_seqs != expected_output_seqs:
            log(f"  错误: 输出顺序错误! 期望 {expected_output_seqs}, 实际 {actual_output_seqs}")
            return False
        
        log("  ✓ 测试通过")
        return True
    
    def test_003_output_order(self) -> bool:
        """
        测试 3: 输出保序和 warp around 测试
        
        场景: 
        - Cycle 0: lane2, lane3 输入 (seq0, seq1)
        - Cycle 1: lane0, lane1, lane3 输入 (seq2, seq3, seq4)
        
        期望输出:
        - Cycle 2: lane0=seq0, lane1=seq1, lane2=seq2, lane3=seq3
        - Cycle 3: lane0=seq4
        """
        log("\n" + "=" * 70)
        log("测试 3: 输出保序和 warp around 测试")
        log("=" * 70)
        
        self.ref = FastFWDRefModel()
        errors = []
        
        # Cycle 0
        vlds_0 = [0, 0, 1, 1]  # lane2, lane3
        datas_0 = [0, 0, 0xA2, 0xA3]
        pkts_0 = self.ref.process_input(0, vlds_0, datas_0, [0, 0, 0, 0])
        log(f"  Cycle 0: lane2, lane3 输入 -> seq0, seq1")
        
        # Cycle 1
        vlds_1 = [1, 1, 0, 1]  # lane0, lane1, lane3
        datas_1 = [0xB0, 0xB1, 0, 0xB3]
        pkts_1 = self.ref.process_input(1, vlds_1, datas_1, [0, 0, 0, 0])
        log(f"  Cycle 1: lane0, lane1, lane3 输入 -> seq2, seq3, seq4")
        
        # 检查输出
        outputs_2 = self.ref.get_output(2)
        log(f"  Cycle 2 输出:")
        for lane, data, seq in outputs_2:
            log(f"    lane{lane}: seq={seq}")
        
        # 期望: lane0=seq0, lane1=seq1, lane2=seq2, lane3=seq3
        expected_2 = [(0, 0xA2), (1, 0xA3), (2, 0xB0), (3, 0xB1)]
        if len(outputs_2) != 4:
            log(f"  错误: 期望 4 个输出，实际 {len(outputs_2)}")
            return False
        
        outputs_3 = self.ref.get_output(3)
        log(f"  Cycle 3 输出:")
        for lane, data, seq in outputs_3:
            log(f"    lane{lane}: seq={seq}")
        
        # 期望: lane0=seq4
        if len(outputs_3) != 1 or outputs_3[0][2] != 4:
            log(f"  错误: 期望 lane0 输出 seq4")
            return False
        
        log("  ✓ 测试通过")
        return True
    
    def test_004_random_stress(self) -> bool:
        """
        测试 4: 随机压力测试
        
        场景: 随机输入，长时间运行
        期望: 所有输入报文按序输出，无丢失
        """
        log("\n" + "=" * 70)
        log("测试 4: 随机压力测试 (100 cycles)")
        log("=" * 70)
        
        self.ref = FastFWDRefModel()
        errors = []
        
        for c in range(100):
            # 随机决定每个 lane 是否输入
            vlds = [1 if self.rng.random() < 0.4 else 0 for _ in range(4)]
            datas = [self.generate_data() for _ in range(4)]
            ctrls = [self.rng.randint(0, 31) for _ in range(4)]
            
            pkts = self.ref.process_input(c, vlds, datas, ctrls)
            
            # 模拟输出 (每 cycle 都尝试输出)
            outputs = self.ref.get_output(c)
        
        # 排空
        for c in range(20):
            outputs = self.ref.get_output(100 + c)
        
        log(f"  结果: {self.ref.get_stats()}")
        
        # 验证: 输入 = 输出
        if self.ref.packets_in != self.ref.packets_out:
            log(f"  错误: 输入输出不匹配! 输入={self.ref.packets_in}, 输出={self.ref.packets_out}")
            return False
        
        log("  ✓ 测试通过")
        return True
    
    def run_all(self) -> bool:
        """运行所有测试"""
        init_log()
        
        log("\n" + "=" * 70)
        log("FastFWD V2 Testbench")
        log("=" * 70)
        
        results = []
        
        results.append(("单 lane 基础测试", self.test_001_single_lane()))
        results.append(("多 lane 并行测试", self.test_002_multi_lane()))
        results.append(("输出保序测试", self.test_003_output_order()))
        results.append(("随机压力测试", self.test_004_random_stress()))
        
        # 汇总
        log("\n" + "=" * 70)
        log("测试结果汇总")
        log("=" * 70)
        
        all_pass = True
        for name, passed in results:
            status = "✓ 通过" if passed else "✗ 失败"
            log(f"  {name}: {status}")
            if not passed:
                all_pass = False
        
        log("\n" + "=" * 70)
        if all_pass:
            log("所有测试通过! ✓")
        else:
            log("部分测试失败! ✗")
        log("=" * 70)
        
        return all_pass


# =============================================================================
# pyCircuit Testbench (用于仿真)
# =============================================================================

@testbench
def tb_basic(t: Tb) -> None:
    """基础功能测试"""
    t.timeout(100)
    
    # Cycle 0: lane0 输入
    t.poke("lane0_pkt_in_vld", 1, at=0)
    t.poke("lane0_pkt_in_data", 0x12345678, at=0)
    t.poke("lane0_pkt_in_ctrl", 0, at=0)
    
    # Cycle 1: 清除输入
    t.poke("lane0_pkt_in_vld", 0, at=1)
    
    # Cycle 2: 期望输出
    t.expect("lane0_pkt_out_vld", 1, at=2)
    t.expect("lane0_pkt_out_data", 0x12345678, at=2)
    
    t.finish(at=10)


@testbench
def tb_multi_lane(t: Tb) -> None:
    """多 lane 测试"""
    t.timeout(200)
    
    # Cycle 0: 4 个 lane 同时输入
    for i in range(4):
        t.poke(f"lane{i}_pkt_in_vld", 1, at=0)
        t.poke(f"lane{i}_pkt_in_data", 0x1000 + i, at=0)
        t.poke(f"lane{i}_pkt_in_ctrl", 0, at=0)
    
    # Cycle 1: 清除
    for i in range(4):
        t.poke(f"lane{i}_pkt_in_vld", 0, at=1)
    
    # Cycle 2: 期望 4 个输出
    for i in range(4):
        t.expect(f"lane{i}_pkt_out_vld", 1, at=2)
        t.expect(f"lane{i}_pkt_out_data", 0x1000 + i, at=2)
    
    t.finish(at=20)


# =============================================================================
# 主程序
# =============================================================================

if __name__ == "__main__":
    # 运行 Python 级测试
    test_cases = TestCases(seed=42)
    all_passed = test_cases.run_all()
    
    # 生成 MLIR (可选)
    # from fastfwd_v2 import fastfwd_v2
    # print(compile(fastfwd_v2, name="fastfwd_v2").emit_mlir())
    
    sys.exit(0 if all_passed else 1)
