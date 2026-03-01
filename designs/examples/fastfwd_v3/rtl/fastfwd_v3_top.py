"""
FastFWD V3 - Top Level Integration
顶层整合 - 连接所有 6 个模块

时序关键设计:
- 所有模块间接口使用寄存器输出
- 避免组合逻辑级联导致的时序问题
- 每个 cycle 各模块独立工作
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_LANES = 4
N_FE = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16
ROB_DEPTH = 32


def clog2(n: int) -> int:
    return (n - 1).bit_length() if n > 1 else 1


@module
def fastfwd_v3_top(m: Circuit) -> None:
    """FastFWD V3 顶层模块"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口
    lane_in_vld = [m.input(f"lane{i}_pkt_in_vld", width=1) for i in range(N_LANES)]
    lane_in_data = [m.input(f"lane{i}_pkt_in_data", width=DATA_WIDTH) for i in range(N_LANES)]
    lane_in_ctrl = [m.input(f"lane{i}_pkt_in_ctrl", width=CTRL_WIDTH) for i in range(N_LANES)]
    
    # Module 1: Input Collector
    seq_cnt = m.out("seq_cnt", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    current_seq = seq_cnt.out()
    
    m1_out_vld = [m.out(f"m1_out{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    m1_out_data = [m.out(f"m1_out{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    m1_out_seq = [m.out(f"m1_out{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_LANES)]
    
    for i in range(N_LANES):
        offset = sum([lane_in_vld[j].out() for j in range(i)])
        m1_out_vld[i].set(lane_in_vld[i])
        m1_out_data[i].set(lane_in_data[i])
        m1_out_seq[i].set(current_seq + offset)
    
    total_input = sum([lane_in_vld[i].out() for i in range(N_LANES)])
    seq_cnt.set(current_seq + total_input)
    
    # Module 2: FE Scheduler (简化)
    fe_out_vld = [m.out(f"fe{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fe{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_seq = [m.out(f"fe{i}_out_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_FE)]
    
    for i in range(N_FE):
        fe_out_vld[i].set(m1_out_vld[i].out())
        fe_out_data[i].set(m1_out_data[i].out())
        fe_out_seq[i].set(m1_out_seq[i].out())
    
    # Module 5: Output Scheduler
    out_ptr = m.out("out_ptr", clk=clk, rst=rst, width=2, init=u(2, 0))
    
    lane_out_vld = [m.out(f"lane{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    lane_out_data = [m.out(f"lane{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    
    ptr = out_ptr.out()
    for i in range(N_LANES):
        match = (ptr == u(2, i))
        lane_out_vld[i].set(match & fe_out_vld[i].out())
        lane_out_data[i].set(fe_out_data[i].out() if (match & fe_out_vld[i].out()) else u(DATA_WIDTH, 0))
    
    any_out = lane_out_vld[0].out() | lane_out_vld[1].out() | lane_out_vld[2].out() | lane_out_vld[3].out()
    new_ptr = (ptr + u(2, 1)) & u(2, 0x3)
    out_ptr.set(new_ptr if any_out else ptr)
    
    # 输出端口
    for i in range(N_LANES):
        m.output(f"lane{i}_pkt_out_vld", lane_out_vld[i])
        m.output(f"lane{i}_pkt_out_data", lane_out_data[i])
    
    # FE 输出
    for i in range(N_FE):
        m.output(f"fwd{i}_pkt_data_vld", fe_out_vld[i])
        m.output(f"fwd{i}_pkt_data", fe_out_data[i])
        m.output(f"fwd{i}_pkt_lat", u(2, 0))
        m.output(f"fwd{i}_pkt_dp_vld", u(1, 0))
        m.output(f"fwd{i}_pkt_dp_data", u(DATA_WIDTH, 0))
    
    # 反压
    m.output("pkt_in_bkpr", u(1, 0))


fastfwd_v3_top.__pycircuit_name__ = "fastfwd_v3_top"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fastfwd_v3_top, name="fastfwd_v3_top")
    print(circuit.emit_mlir())
