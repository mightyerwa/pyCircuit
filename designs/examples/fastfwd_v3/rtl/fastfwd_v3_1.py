"""
FastFWD V3.1 - Improved Version
改进版本 - 完整依赖解析
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_LANES = 4
N_FE = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16
MAX_DEP = 7


@module
def fastfwd_v3_1(m: Circuit) -> None:
    """FastFWD V3.1 - 完整依赖解析"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口
    lane_in_vld = [m.input(f"lane{i}_pkt_in_vld", width=1) for i in range(N_LANES)]
    lane_in_data = [m.input(f"lane{i}_pkt_in_data", width=DATA_WIDTH) for i in range(N_LANES)]
    lane_in_ctrl = [m.input(f"lane{i}_pkt_in_ctrl", width=CTRL_WIDTH) for i in range(N_LANES)]
    fwded_vld = [m.input(f"fwded{i}_pkt_data_vld", width=1) for i in range(N_FE)]
    fwded_data = [m.input(f"fwded{i}_pkt_data", width=DATA_WIDTH) for i in range(N_FE)]
    
    # 全局状态
    seq_cnt = m.out("seq_cnt", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    out_ptr = m.out("out_ptr", clk=clk, rst=rst, width=2, init=u(2, 0))
    cycle_cnt = m.out("cycle_cnt", clk=clk, rst=rst, width=16, init=u(16, 0))
    cycle_cnt.set(cycle_cnt.out() + u(16, 1))
    current_cycle = cycle_cnt.out()
    
    # Input Collector
    current_seq = seq_cnt.out()
    offset_0 = u(SEQ_WIDTH, 0)
    offset_1 = lane_in_vld[0].out()
    offset_2 = offset_1 + lane_in_vld[1].out()
    offset_3 = offset_2 + lane_in_vld[2].out()
    offsets = [offset_0, offset_1, offset_2, offset_3]
    
    ic_vld = [m.out(f"ic_vld{i}", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    ic_data = [m.out(f"ic_data{i}", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    ic_ctrl = [m.out(f"ic_ctrl{i}", clk=clk, rst=rst, width=CTRL_WIDTH, init=u(CTRL_WIDTH, 0)) for i in range(N_LANES)]
    ic_seq = [m.out(f"ic_seq{i}", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_LANES)]
    
    for i in range(N_LANES):
        ic_vld[i].set(lane_in_vld[i])
        ic_data[i].set(lane_in_data[i])
        ic_ctrl[i].set(lane_in_ctrl[i])
        ic_seq[i].set(current_seq + offsets[i])
    
    total_input = sum([lane_in_vld[i].out() for i in range(N_LANES)])
    seq_cnt.set(current_seq + total_input)
    
    # 依赖查找表
    dep_valid = [m.out(f"dep{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(MAX_DEP + 1)]
    dep_data = [m.out(f"dep{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    dep_seq = [m.out(f"dep{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    dep_write_ptr = m.out("dep_write_ptr", clk=clk, rst=rst, width=3, init=u(3, 0))
    
    for i in range(MAX_DEP + 1):
        should_write = fwded_vld[0] & (dep_write_ptr.out() == u(3, i))
        dep_valid[i].set(should_write | dep_valid[i].out())
        dep_data[i].set(fwded_data[0] if should_write else dep_data[i].out())
        dep_seq[i].set(ic_seq[0].out() if should_write else dep_seq[i].out())
    
    new_dep_ptr = (dep_write_ptr.out() + u(3, 1)) & u(3, 0x7)
    dep_write_ptr.set(new_dep_ptr if fwded_vld[0] else dep_write_ptr.out())
    
    # FE Scheduler + 依赖解析
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    fe_last_finish = [m.out(f"fe{i}_last_finish", clk=clk, rst=rst, width=6, init=u(6, 0)) for i in range(N_FE)]
    
    fe_out_vld = [m.out(f"fwd{i}_pkt_data_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fwd{i}_pkt_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fwd{i}_pkt_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    fe_out_dp_vld = [m.out(f"fwd{i}_pkt_dp_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_dp_data = [m.out(f"fwd{i}_pkt_dp_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    
    for i in range(N_FE):
        lat = ic_ctrl[i].out() & u(CTRL_WIDTH, 0x3)
        dep = (ic_ctrl[i].out() >> u(CTRL_WIDTH, 2)) & u(CTRL_WIDTH, 0x7)
        finish_cycle = current_cycle + u(6, 2) + lat
        constraint_ok = finish_cycle > fe_last_finish[i].out()
        can_schedule = (~fe_busy[i].out()) & ic_vld[i].out() & constraint_ok
        
        # 依赖查找
        target_seq = ic_seq[i].out() - dep
        dep_found = u(1, 0)
        dep_value = u(DATA_WIDTH, 0)
        for j in range(MAX_DEP + 1):
            match = dep_valid[j] & (dep_seq[j] == target_seq)
            dep_found = dep_found | match
            dep_value = dep_value if (~match).out() else dep_data[j]
        
        has_dep = dep != u(3, 0)
        dep_ready = has_dep & dep_found
        can_schedule = can_schedule & (~has_dep | dep_ready)
        
        fe_busy[i].set(can_schedule | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 1))))
        new_timer = (lat + u(3, 1)) if can_schedule else (fe_timer[i].out() - u(3, 1) if fe_busy[i].out() else u(3, 0))
        fe_timer[i].set(new_timer)
        fe_last_finish[i].set(finish_cycle if can_schedule else fe_last_finish[i].out())
        
        fe_out_vld[i].set(can_schedule)
        fe_out_data[i].set(ic_data[i].out() if can_schedule else u(DATA_WIDTH, 0))
        fe_out_lat[i].set(lat if can_schedule else u(2, 0))
        fe_out_dp_vld[i].set(has_dep & can_schedule)
        fe_out_dp_data[i].set(dep_value if (has_dep & can_schedule) else u(DATA_WIDTH, 0))
    
    # ROB
    rob_valid = [m.out(f"rob{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(8)]
    rob_data = [m.out(f"rob{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(8)]
    rob_seq = [m.out(f"rob{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(8)]
    rob_tail = m.out("rob_tail", clk=clk, rst=rst, width=3, init=u(3, 0))
    next_output_seq = m.out("next_output_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    
    tail_ptr = rob_tail.out()
    for i in range(8):
        should_write = fwded_vld[0] & (tail_ptr == u(3, i))
        rob_valid[i].set(should_write | rob_valid[i].out())
        rob_data[i].set(fwded_data[0] if should_write else rob_data[i].out())
        rob_seq[i].set(ic_seq[0].out() if should_write else rob_seq[i].out())
    
    rob_tail.set((tail_ptr + u(3, 1)) & u(3, 0x7) if fwded_vld[0] else tail_ptr)
    
    # Output Scheduler
    lane_out_vld = [m.out(f"lane{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    lane_out_data = [m.out(f"lane{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    
    ptr = out_ptr.out()
    next_seq = next_output_seq.out()
    
    has_next_seq = u(1, 0)
    next_seq_data = u(DATA_WIDTH, 0)
    for i in range(8):
        match = rob_valid[i] & (rob_seq[i] == next_seq)
        has_next_seq = has_next_seq | match
        next_seq_data = next_seq_data if (~match).out() else rob_data[i]
    
    for i in range(N_LANES):
        this_lane = (ptr == u(2, i))
        should_output = this_lane & has_next_seq
        lane_out_vld[i].set(should_output)
        lane_out_data[i].set(next_seq_data if should_output else u(DATA_WIDTH, 0))
    
    any_output = lane_out_vld[0].out() | lane_out_vld[1].out() | lane_out_vld[2].out() | lane_out_vld[3].out()
    out_ptr.set((ptr + u(2, 1)) & u(2, 0x3) if any_output else ptr)
    next_output_seq.set(next_seq + u(SEQ_WIDTH, 1) if any_output else next_seq)
    
    for i in range(8):
        should_clear = any_output & (rob_seq[i] == next_seq)
        rob_valid[i].set(u(1, 0) if should_clear else rob_valid[i].out())
    
    # Backpressure
    pending_cnt = sum([ic_vld[i].out() for i in range(N_LANES)])
    bkpr = m.out("bkpr_reg", clk=clk, rst=rst, width=1, init=u(1, 0))
    bkpr.set(pending_cnt >= u(4, 10))
    
    # 输出
    for i in range(N_LANES):
        m.output(f"lane{i}_pkt_out_vld", lane_out_vld[i])
        m.output(f"lane{i}_pkt_out_data", lane_out_data[i])
    m.output("pkt_in_bkpr", bkpr)


fastfwd_v3_1.__pycircuit_name__ = "fastfwd_v3_1"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fastfwd_v3_1, name="fastfwd_v3_1")
    print(circuit.emit_mlir())
