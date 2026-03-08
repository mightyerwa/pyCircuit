"""
FastFWD V3 - Handwritten RTL: Input Collector
Simplified but correct implementation
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_LANES = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16


@module
def input_collector_handwritten(m: Circuit) -> None:
    """
    Input Collector - Handwritten RTL
    
    Function:
    - Collect 4 lane inputs
    - Assign sequential sequence numbers (seq)
    - Output to FE Scheduler
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # Input ports
    lane_vld = [m.input(f"lane{i}_vld", width=1) for i in range(N_LANES)]
    lane_data = [m.input(f"lane{i}_data", width=DATA_WIDTH) for i in range(N_LANES)]
    lane_ctrl = [m.input(f"lane{i}_ctrl", width=CTRL_WIDTH) for i in range(N_LANES)]
    
    # seq_base from external counter (simplified)
    seq_base = m.input("seq_base", width=SEQ_WIDTH)
    
    # Internal state
    seq_cnt = m.out("seq_cnt", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    
    # Output registers (registered output)
    out_vld = [m.out(f"out{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    out_data = [m.out(f"out{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    out_ctrl = [m.out(f"out{i}_ctrl", clk=clk, rst=rst, width=CTRL_WIDTH, init=u(CTRL_WIDTH, 0)) for i in range(N_LANES)]
    out_seq = [m.out(f"out{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_LANES)]
    
    # Calculate seq offsets
    current_seq = seq_base
    offset_0 = u(SEQ_WIDTH, 0)
    offset_1 = lane_vld[0].out()
    offset_2 = offset_1 + lane_vld[1].out()
    offset_3 = offset_2 + lane_vld[2].out()
    offsets = [offset_0, offset_1, offset_2, offset_3]
    
    # Registered outputs
    for i in range(N_LANES):
        out_vld[i].set(lane_vld[i])
        out_data[i].set(lane_data[i])
        out_ctrl[i].set(lane_ctrl[i])
        out_seq[i].set(current_seq + offsets[i])
    
    # Update seq counter
    total_input = lane_vld[0].out() + lane_vld[1].out() + lane_vld[2].out() + lane_vld[3].out()
    seq_cnt.set(current_seq + total_input)
    
    # Output ports
    for i in range(N_LANES):
        m.output(f"lane{i}_vld", out_vld[i])
        m.output(f"lane{i}_data", out_data[i])
        m.output(f"lane{i}_ctrl", out_ctrl[i])
        m.output(f"lane{i}_seq", out_seq[i])
    
    m.output("seq_cnt_o", seq_cnt)


input_collector_handwritten.__pycircuit_name__ = "input_collector_handwritten"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(input_collector_handwritten, name="input_collector_handwritten")
    print(circuit.emit_mlir())
