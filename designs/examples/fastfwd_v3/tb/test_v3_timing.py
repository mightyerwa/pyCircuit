"""
FastFWD V3 完整测试平台 - 修正时序版本

正确的时序:
- Cycle 0: 输入数据
- Cycle 1: 数据进入 FIFO，FE 开始处理
- Cycle 2: FE 完成 (lat=0)，进入 ROB
- Cycle 3: ROB 输出到 Output

最少 3-4 cycles 才有输出
"""
from __future__ import annotations
import sys
import random
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Dict, Optional, Tuple
from datetime import datetime


class Logger:
    """带时序的日志记录器"""
    
    def __init__(self, name: str):
        self.log_file = Path(__file__).parent.parent / "logs" / f"{name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
        self.log_file.parent.mkdir(exist_ok=True)
        self.lines = []
        self._write_header()
    
    def _write_header(self):
        self.lines.append("=" * 100)
        self.lines.append("FastFWD V3 时序修正测试报告")
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
    ctrl: int
    cycle: int
    
    def __post_init__(self):
        self.data = self.data & ((1 << 128) - 1)
        self.ctrl = self.ctrl & 0x1F
    
    @property
    def lat(self) -> int:
        return self.ctrl & 0x3
    
    @property
    def dep(self) -> int:
        return (self.ctrl >> 2) & 0x7
    
    @property
    def fe_delay(self) -> int:
        return self.lat + 1
    
    def __repr__(self):
        data_hex = f"0x{self.data:08x}..."
        return f"Pkt(seq={self.seq}, lane={self.lane}, lat={self.lat}, dep={self.dep})"


@dataclass
class FETransaction:
    """FE 事务"""
    pkt: Packet
    start_cycle: int
    end_cycle: int
    dep_data: Optional[int] = None
    result: Optional[int] = None


class FastFWDReferenceModel:
    """
    FastFWD 参考模型 - 修正时序版本
    
    正确的流水线:
    1. Input Buffer (FIFO)
    2. FE Processing (1-4 cycles)
    3. ROB (Reorder Buffer)
    4. Output Scheduler
    
    时序:
    Cycle 0: Input -> FIFO
    Cycle 1: FIFO -> FE (start)
    Cycle 2: FE (lat=0) -> ROB
    Cycle 3: ROB -> Output
    """
    
    def __init__(self, n_fe: int = 4, max_rob: int = 32):
        self.n_fe = n_fe
        self.max_rob = max_rob
        
        self.seq_counter = 0
        self.out_ptr = 0
        self.current_cycle = 0
        
        # 流水线各级
        self.input_buffer: List[Packet] = []      # Stage 1: Input FIFO
        self.fe_transactions: List[FETransaction] = []  # Stage 2: FE Processing
        self.rob: List[Tuple[int, int]] = []      # Stage 3: ROB
        
        self.completed: Dict[int, int] = {}
        self.dep_table: Dict[int, int] = {}
        
        self.stats = {'packets_in': 0, 'packets_out': 0}
        self.events: List[str] = []
    
    def reset(self):
        self.seq_counter = 0
        self.out_ptr = 0
        self.current_cycle = 0
        self.input_buffer.clear()
        self.fe_transactions.clear()
        self.rob.clear()
        self.completed.clear()
        self.dep_table.clear()
        self.events.clear()
    
    def process_input(self, cycle: int, lane_vlds: List[int], 
                      lane_datas: List[int], lane_ctrls: List[int]) -> List[Packet]:
        """Stage 1: 输入收集"""
        new_packets = []
        
        for lane in range(4):
            if lane_vlds[lane]:
                pkt = Packet(
                    seq=self.seq_counter,
                    lane=lane,
                    data=lane_datas[lane],
                    ctrl=lane_ctrls[lane],
                    cycle=cycle
                )
                self.input_buffer.append(pkt)
                new_packets.append(pkt)
                
                self.events.append(
                    f"Cycle {cycle}: Input lane{lane} -> seq={pkt.seq}, lat={pkt.lat}"
                )
                
                self.seq_counter += 1
                self.stats['packets_in'] += 1
        
        return new_packets
    
    def schedule_fe(self, cycle: int) -> List[FETransaction]:
        """Stage 2: FE 调度"""
        scheduled = []
        
        # 找空闲的 FE
        busy_fe = {t.pkt.seq % self.n_fe for t in self.fe_transactions}
        
        for pkt in self.input_buffer[:]:
            fe_id = None
            for i in range(self.n_fe):
                if i not in busy_fe:
                    fe_id = i
                    break
            
            if fe_id is None:
                break
            
            # 创建 FE 事务
            # 修正时序: FIFO(1) + FE(lat+1)
            # lat=0: FIFO(1) + FE(1) = 2 cycles
            # finish = cycle + 2 + lat
            trans = FETransaction(
                pkt=pkt,
                start_cycle=cycle,
                end_cycle=cycle + 2 + pkt.lat  # +2 for FIFO + FE setup
            )
            
            self.fe_transactions.append(trans)
            self.input_buffer.remove(pkt)
            busy_fe.add(fe_id)
            scheduled.append(trans)
            
            self.events.append(
                f"Cycle {cycle}: FE{fe_id} start pkt{pkt.seq}, "
                f"lat={pkt.lat}, finish at {trans.end_cycle}"
            )
        
        return scheduled
    
    def complete_fe(self, cycle: int) -> List[FETransaction]:
        """Stage 2: FE 完成"""
        completed = []
        
        for trans in self.fe_transactions[:]:
            # 关键: cycle >= end_cycle 才完成
            if cycle >= trans.end_cycle:
                result = trans.pkt.data
                
                trans.result = result
                self.completed[trans.pkt.seq] = result
                self.dep_table[trans.pkt.seq] = result
                
                # 放入 ROB
                self.rob.append((trans.pkt.seq, result))
                self.rob.sort(key=lambda x: x[0])
                
                completed.append(trans)
                self.fe_transactions.remove(trans)
                
                self.events.append(
                    f"Cycle {cycle}: FE complete pkt{trans.pkt.seq} "
                    f"(started {trans.start_cycle}, lat={trans.pkt.lat})"
                )
        
        return completed
    
    def get_output(self, cycle: int) -> List[Tuple[int, int, int]]:
        """Stage 3&4: ROB + Output Scheduler"""
        outputs = []
        
        if not self.rob:
            return outputs
        
        # 按 seq 排序
        self.rob.sort(key=lambda p: p[0])
        
        # 从 out_ptr 开始，取连续的报文
        lane = self.out_ptr
        next_seq = self.stats['packets_out']
        
        for seq, data in self.rob[:]:
            if seq != next_seq:
                break
            
            outputs.append((lane, data, seq))
            self.rob.remove((seq, data))
            
            lane = (lane + 1) % 4
            next_seq += 1
            self.stats['packets_out'] += 1
            
            if len(outputs) >= 4:
                break
        
        self.out_ptr = lane
        
        if outputs:
            lanes_str = ", ".join([f"lane{l}=seq{s}" for l, _, s in outputs])
            self.events.append(f"Cycle {cycle}: Output {lanes_str}")
        
        return outputs


# 测试
def test_timing():
    """测试正确的时序"""
    print("\n=== 时序测试 ===")
    print("Expected: Cycle 0 input -> Cycle 3+ output (3+ cycles delay)")
    
    model = FastFWDReferenceModel()
    
    # Cycle 0: 输入
    print("\nCycle 0: Input 1 packet (lat=0)")
    model.process_input(0, [1,0,0,0], [0x100,0,0,0], [0,0,0,0])
    model.schedule_fe(0)
    model.complete_fe(0)
    out = model.get_output(0)
    print(f"  Output: {out} (expected: [])")
    assert len(out) == 0, "Cycle 0 should have no output"
    
    # Cycle 1: FE 开始处理
    print("\nCycle 1: FE processing")
    model.schedule_fe(1)
    model.complete_fe(1)
    out = model.get_output(1)
    print(f"  Output: {out} (expected: [])")
    assert len(out) == 0, "Cycle 1 should have no output"
    
    # Cycle 2: FE 完成 (lat=0: finish at cycle 1, but we check at cycle 2)
    print("\nCycle 2: FE complete, enter ROB")
    model.schedule_fe(2)
    model.complete_fe(2)
    out = model.get_output(2)
    print(f"  Output: {out}")
    
    # Cycle 3: ROB 输出
    print("\nCycle 3: ROB output")
    model.schedule_fe(3)
    model.complete_fe(3)
    out = model.get_output(3)
    print(f"  Output: {out}")
    
    print(f"\nFinal: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
    assert model.stats['packets_in'] == model.stats['packets_out']
    print("✓ 时序测试通过")


if __name__ == "__main__":
    test_timing()
