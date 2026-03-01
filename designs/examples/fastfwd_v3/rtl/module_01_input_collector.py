"""
FastFWD V3 - Module 1: Input Collector
输入收集器 - 按 lane0→lane3 顺序收集并分配序号

验证要点:
- 同一 cycle 内按 lane0→lane3 分配序号
- 不同 cycle 按时间顺序
- 所有输出为寄存器输出
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_LANES = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16


@module
def input_collector(m: Circuit) -> None:
    """
    输入收集器模块
    
    输入: 4个lane的 vld, data, ctrl
    输出: 按顺序分配的 seq, 以及收集到的报文信息
    
    时序:
    - 输入是组合逻辑 (直接透传)
    - 输出是寄存器 (下一 cycle 生效)
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口
    lane_in_vld = [m.input(f"lane{i}_vld", width=1) for i in range(N_LANES)]
    lane_in_data = [m.input(f"lane{i}_data", width=DATA_WIDTH) for i in range(N_LANES)]
    lane_in_ctrl = [m.input(f"lane{i}_ctrl", width=CTRL_WIDTH) for i in range(N_LANES)]
    
    # 内部状态: 序号计数器
    seq_cnt = m.out("seq_cnt", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    
    # 输出端口 (寄存器输出)
    # 每 lane 的输出
    out_vld = [m.out(f"out{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    out_data = [m.out(f"out{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    out_ctrl = [m.out(f"out{i}_ctrl", clk=clk, rst=rst, width=CTRL_WIDTH, init=u(CTRL_WIDTH, 0)) for i in range(N_LANES)]
    out_seq = [m.out(f"out{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_LANES)]
    
    # 组合逻辑: 计算当前 cycle 的序号分配
    current_seq = seq_cnt.out()
    
    # Lane 0: 序号 = current_seq (如果有效)
    # Lane 1: 序号 = current_seq + lane0_vld
    # Lane 2: 序号 = current_seq + lane0_vld + lane1_vld
    # Lane 3: 序号 = current_seq + lane0_vld + lane1_vld + lane2_vld
    
    # 计算每个 lane 的序号偏移
    offset_0 = u(SEQ_WIDTH, 0)
    offset_1 = lane_in_vld[0].out()
    offset_2 = offset_1 + lane_in_vld[1].out()
    offset_3 = offset_2 + lane_in_vld[2].out()
    
    offsets = [offset_0, offset_1, offset_2, offset_3]
    
    # 寄存器赋值 (下一 cycle 生效)
    for i in range(N_LANES):
        out_vld[i].set(lane_in_vld[i])
        out_data[i].set(lane_in_data[i])
        out_ctrl[i].set(lane_in_ctrl[i])
        out_seq[i].set(current_seq + offsets[i])
    
    # 更新序号计数器 (下一 cycle 生效)
    total_input = lane_in_vld[0].out() + lane_in_vld[1].out() + lane_in_vld[2].out() + lane_in_vld[3].out()
    seq_cnt.set(current_seq + total_input)
    
    # 输出端口连接
    for i in range(N_LANES):
        m.output(f"lane{i}_vld", out_vld[i])
        m.output(f"lane{i}_data", out_data[i])
        m.output(f"lane{i}_ctrl", out_ctrl[i])
        m.output(f"lane{i}_seq", out_seq[i])


input_collector.__pycircuit_name__ = "input_collector"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(input_collector, name="input_collector")
    print(circuit.emit_mlir())
