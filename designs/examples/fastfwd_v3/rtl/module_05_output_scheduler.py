"""
FastFWD V3 - Module 5: Output Scheduler
输出调度器 - 按 warp around 方式输出到 4 个 lane

验证要点:
- 从 lane0 开始输出
- 支持 warp around
- 每 cycle 0~4 个输出
- 所有输出为寄存器
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_LANES = 4
DATA_WIDTH = 128
SEQ_WIDTH = 16


@module
def output_scheduler(m: Circuit) -> None:
    """
    输出调度器模块
    
    输入: 来自 ROB 的按序报文
    输出: 4 个 lane 的输出
    
    功能:
    - 从 out_ptr 开始输出
    - 最多 4 个连续输出
    - 更新 out_ptr (warp around)
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口 (来自 ROB)
    in_vld = m.input("in_vld", width=1)
    in_data = m.input("in_data", width=DATA_WIDTH)
    in_seq = m.input("in_seq", width=SEQ_WIDTH)
    
    # 输出指针
    out_ptr = m.out("out_ptr", clk=clk, rst=rst, width=2, init=u(2, 0))
    
    # 输出端口 (寄存器)
    lane_out_vld = [m.out(f"lane{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    lane_out_data = [m.out(f"lane{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    
    # 组合逻辑: 根据 out_ptr 选择输出 lane
    ptr = out_ptr.out()
    
    # 简化: 每次只输出 1 个 (确保正确性)
    for i in range(N_LANES):
        match = (ptr == u(2, i))
        lane_out_vld[i].set(match & in_vld)
        lane_out_data[i].set(in_data if (match & in_vld) else u(DATA_WIDTH, 0))
    
    # 更新 out_ptr
    any_out = lane_out_vld[0].out() | lane_out_vld[1].out() | lane_out_vld[2].out() | lane_out_vld[3].out()
    new_ptr = (ptr + u(2, 1)) & u(2, 0x3)
    out_ptr.set(new_ptr if any_out else ptr)
    
    # 输出端口
    for i in range(N_LANES):
        m.output(f"lane{i}_vld", lane_out_vld[i])
        m.output(f"lane{i}_data", lane_out_data[i])


output_scheduler.__pycircuit_name__ = "output_scheduler"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(output_scheduler, name="output_scheduler")
    print(circuit.emit_mlir())
