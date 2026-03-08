"""
FastFWD V3.3 - Modular Design
严格遵循pyCircuit规范，模块清晰分离
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


# ============================================================================
# 配置参数
# ============================================================================
N_LANES = 4
N_FE = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16
MAX_DEP = 7
ROB_DEPTH = 8


# ============================================================================
# Module 1: Input Collector
# 收集4个lane输入，分配全局序号
# ============================================================================
@module
def input_collector(m: Circuit) -> None:
    """输入收集器 - 按lane0→3顺序收集，分配seq"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入
    lane_vld = [m.input(f"lane{i}_vld", width=1) for i in range(N_LANES)]
    lane_data = [m.input(f"lane{i}_data", width=DATA_WIDTH) for i in range(N_LANES)]
    lane_ctrl = [m.input(f"lane{i}_ctrl", width=CTRL_WIDTH) for i in range(N_LANES)]
    seq_base = m.input("seq_base", width=SEQ_WIDTH)
    
    # 输出寄存器
    out_vld = [m.out(f"out{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    out_data = [m.out(f"out{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    out_ctrl = [m.out(f"out{i}_ctrl", clk=clk, rst=rst, width=CTRL_WIDTH, init=u(CTRL_WIDTH, 0)) for i in range(N_LANES)]
    out_seq = [m.out(f"out{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_LANES)]
    
    # 计算seq偏移
    offset_0 = u(SEQ_WIDTH, 0)
    offset_1 = lane_vld[0].out()
    offset_2 = offset_1 + lane_vld[1].out()
    offset_3 = offset_2 + lane_vld[2].out()
    offsets = [offset_0, offset_1, offset_2, offset_3]
    
    # 输出赋值
    for i in range(N_LANES):
        out_vld[i].set(lane_vld[i])
        out_data[i].set(lane_data[i])
        out_ctrl[i].set(lane_ctrl[i])
        out_seq[i].set(seq_base + offsets[i])
    
    # 输出端口
    for i in range(N_LANES):
        m.output(f"vld{i}", out_vld[i])
        m.output(f"data{i}", out_data[i])
        m.output(f"ctrl{i}", out_ctrl[i])
        m.output(f"seq{i}", out_seq[i])
    
    # 返回总输入数
    total = lane_vld[0].out() + lane_vld[1].out() + lane_vld[2].out() + lane_vld[3].out()
    m.output("total", total)


input_collector.__pycircuit_name__ = "input_collector"


# ============================================================================
# Module 2: Dependency Resolver
# 根据dep值查找依赖数据
# ============================================================================
@module
def dependency_resolver(m: Circuit) -> None:
    """依赖解析器 - CAM结构查找依赖"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 查询输入
    query_seq = m.input("query_seq", width=SEQ_WIDTH)
    query_dep = m.input("query_dep", width=3)
    
    # 依赖表输入 (来自外部写入)
    for i in range(MAX_DEP + 1):
        m.input(f"dep{i}_valid", width=1)
        m.input(f"dep{i}_data", width=DATA_WIDTH)
        m.input(f"dep{i}_seq", width=SEQ_WIDTH)
    
    # 计算目标seq
    target_seq = query_seq - query_dep
    
    # CAM查找
    dep_found = u(1, 0)
    dep_value = u(DATA_WIDTH, 0)
    
    for i in range(MAX_DEP + 1):
        dep_i_valid = m.input(f"dep{i}_valid", width=1)
        dep_i_data = m.input(f"dep{i}_data", width=DATA_WIDTH)
        dep_i_seq = m.input(f"dep{i}_seq", width=SEQ_WIDTH)
        
        match = dep_i_valid & (dep_i_seq == target_seq)
        dep_found = dep_found | match
        dep_value = dep_value if (~match).out() else dep_i_data
    
    has_dep = query_dep != u(3, 0)
    
    # 输出寄存器
    out_found = m.out("out_found", clk=clk, rst=rst, width=1, init=u(1, 0))
    out_value = m.out("out_value", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0))
    out_has_dep = m.out("out_has_dep", clk=clk, rst=rst, width=1, init=u(1, 0))
    
    out_found.set(dep_found)
    out_value.set(dep_value)
    out_has_dep.set(has_dep)
    
    m.output("found", out_found)
    m.output("value", out_value)
    m.output("has_dep", out_has_dep)


dependency_resolver.__pycircuit_name__ = "dependency_resolver"


# ============================================================================
# Module 3: FE Scheduler
# 调度报文到FE，处理约束和依赖
# ============================================================================
@module
def fe_scheduler(m: Circuit) -> None:
    """FE调度器 - 带约束检查和依赖处理"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入
    in_vld = [m.input(f"in{i}_vld", width=1) for i in range(N_FE)]
    in_data = [m.input(f"in{i}_data", width=DATA_WIDTH) for i in range(N_FE)]
    in_ctrl = [m.input(f"in{i}_ctrl", width=CTRL_WIDTH) for i in range(N_FE)]
    in_seq = [m.input(f"in{i}_seq", width=SEQ_WIDTH) for i in range(N_FE)]
    
    # 依赖状态输入
    dep_ready = [m.input(f"dep{i}_ready", width=1) for i in range(N_FE)]
    dep_value = [m.input(f"dep{i}_value", width=DATA_WIDTH) for i in range(N_FE)]
    dep_has = [m.input(f"dep{i}_has", width=1) for i in range(N_FE)]
    
    # 全局cycle计数
    cycle_cnt = m.out("cycle_cnt", clk=clk, rst=rst, width=16, init=u(16, 0))
    cycle_cnt.set(cycle_cnt.out() + u(16, 1))
    current_cycle = cycle_cnt.out()
    
    # FE状态寄存器
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    fe_last_finish = [m.out(f"fe{i}_last_finish", clk=clk, rst=rst, width=6, init=u(6, 0)) for i in range(N_FE)]
    fe_pkt_seq = [m.out(f"fe{i}_pkt_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_FE)]
    
    # FE输出寄存器
    fe_out_vld = [m.out(f"fe{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fe{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fe{i}_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    fe_out_dp_vld = [m.out(f"fe{i}_dp_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_dp_data = [m.out(f"fe{i}_dp_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    
    for i in range(N_FE):
        # 解析ctrl
        lat = in_ctrl[i] & u(CTRL_WIDTH, 0x3)
        dep = (in_ctrl[i] >> u(CTRL_WIDTH, 2)) & u(CTRL_WIDTH, 0x7)
        
        # 约束检查: finish_cycle > last_finish
        finish_cycle = current_cycle + u(6, 2) + lat
        constraint_ok = finish_cycle > fe_last_finish[i].out()
        
        # 依赖就绪检查
        dep_ok = (~dep_has[i]) | dep_ready[i]
        
        # 调度条件
        can_schedule = (~fe_busy[i].out()) & in_vld[i] & constraint_ok & dep_ok
        
        # 更新FE状态
        new_busy = can_schedule | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 1)))
        fe_busy[i].set(new_busy)
        
        new_timer = (lat + u(3, 1)) if can_schedule else \
                    (fe_timer[i].out() - u(3, 1)) if fe_busy[i].out() else u(3, 0)
        fe_timer[i].set(new_timer)
        
        fe_last_finish[i].set(finish_cycle if can_schedule else fe_last_finish[i].out())
        fe_pkt_seq[i].set(in_seq[i] if can_schedule else fe_pkt_seq[i].out())
        
        # 输出
        fe_out_vld[i].set(can_schedule)
        fe_out_data[i].set(in_data[i] if can_schedule else u(DATA_WIDTH, 0))
        fe_out_lat[i].set(lat if can_schedule else u(2, 0))
        fe_out_dp_vld[i].set(dep_has[i] & can_schedule)
        fe_out_dp_data[i].set(dep_value[i] if (dep_has[i] & can_schedule) else u(DATA_WIDTH, 0))
    
    # 输出端口
    for i in range(N_FE):
        m.output(f"vld{i}", fe_out_vld[i])
        m.output(f"data{i}", fe_out_data[i])
        m.output(f"lat{i}", fe_out_lat[i])
        m.output(f"dp_vld{i}", fe_out_dp_vld[i])
        m.output(f"dp_data{i}", fe_out_dp_data[i])
        m.output(f"busy{i}", fe_busy[i])
        m.output(f"pkt_seq{i}", fe_pkt_seq[i])


fe_scheduler.__pycircuit_name__ = "fe_scheduler"


# ============================================================================
# Module 4: Dependency Table
# 存储已完成报文，供依赖查询
# ============================================================================
@module
def dependency_table(m: Circuit) -> None:
    """依赖表 - 8-entry循环缓冲区"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 写入输入 (来自FE完成)
    write_vld = m.input("write_vld", width=1)
    write_data = m.input("write_data", width=DATA_WIDTH)
    write_seq = m.input("write_seq", width=SEQ_WIDTH)
    
    # 依赖表寄存器
    dep_valid = [m.out(f"dep{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(MAX_DEP + 1)]
    dep_data = [m.out(f"dep{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    dep_seq = [m.out(f"dep{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    write_ptr = m.out("write_ptr", clk=clk, rst=rst, width=3, init=u(3, 0))
    
    # 写入逻辑
    for i in range(MAX_DEP + 1):
        should_write = write_vld & (write_ptr.out() == u(3, i))
        dep_valid[i].set(should_write | dep_valid[i].out())
        dep_data[i].set(write_data if should_write else dep_data[i].out())
        dep_seq[i].set(write_seq if should_write else dep_seq[i].out())
    
    # 更新写指针
    new_ptr = (write_ptr.out() + u(3, 1)) & u(3, 0x7)
    write_ptr.set(new_ptr if write_vld else write_ptr.out())
    
    # 输出端口
    for i in range(MAX_DEP + 1):
        m.output(f"valid{i}", dep_valid[i])
        m.output(f"data{i}", dep_data[i])
        m.output(f"seq{i}", dep_seq[i])


dependency_table.__pycircuit_name__ = "dependency_table"


# ============================================================================
# Module 5: ROB (Reorder Buffer)
# 按序存储FE完成结果
# ============================================================================
@module
def rob(m: Circuit) -> None:
    """重排序缓冲区 - 8-entry循环缓冲区"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 写入输入
    write_vld = m.input("write_vld", width=1)
    write_data = m.input("write_data", width=DATA_WIDTH)
    write_seq = m.input("write_seq", width=SEQ_WIDTH)
    
    # 读取控制
    read_req = m.input("read_req", width=1)
    read_seq = m.input("read_seq", width=SEQ_WIDTH)
    
    # ROB寄存器
    rob_valid = [m.out(f"entry{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(ROB_DEPTH)]
    rob_data = [m.out(f"entry{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(ROB_DEPTH)]
    rob_seq = [m.out(f"entry{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(ROB_DEPTH)]
    
    tail_ptr = m.out("tail_ptr", clk=clk, rst=rst, width=3, init=u(3, 0))
    
    # 写入逻辑
    for i in range(ROB_DEPTH):
        should_write = write_vld & (tail_ptr.out() == u(3, i))
        rob_valid[i].set(should_write | rob_valid[i].out())
        rob_data[i].set(write_data if should_write else rob_data[i].out())
        rob_seq[i].set(write_seq if should_write else rob_seq[i].out())
    
    # 更新tail
    new_tail = (tail_ptr.out() + u(3, 1)) & u(3, 0x7)
    tail_ptr.set(new_tail if write_vld else tail_ptr.out())
    
    # 读取逻辑 (CAM查找)
    found = u(1, 0)
    found_data = u(DATA_WIDTH, 0)
    
    for i in range(ROB_DEPTH):
        match = rob_valid[i] & (rob_seq[i] == read_seq)
        found = found | match
        found_data = found_data if (~match).out() else rob_data[i]
    
    # 输出寄存器
    out_vld = m.out("out_vld", clk=clk, rst=rst, width=1, init=u(1, 0))
    out_data = m.out("out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0))
    
    out_vld.set(read_req & found)
    out_data.set(found_data)
    
    # 清除已读条目
    for i in range(ROB_DEPTH):
        should_clear = read_req & (rob_seq[i] == read_seq)
        rob_valid[i].set(u(1, 0) if should_clear else rob_valid[i].out())
    
    m.output("vld", out_vld)
    m.output("data", out_data)


rob.__pycircuit_name__ = "rob"


# ============================================================================
# Module 6: Output Scheduler
# 从ROB按序输出到4个lane
# ============================================================================
@module
def output_scheduler(m: Circuit) -> None:
    """输出调度器 - 支持warp around"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # ROB状态输入
    rob_valid = [m.input(f"rob{i}_valid", width=1) for i in range(ROB_DEPTH)]
    rob_data = [m.input(f"rob{i}_data", width=DATA_WIDTH) for i in range(ROB_DEPTH)]
    rob_seq = [m.input(f"rob{i}_seq", width=SEQ_WIDTH) for i in range(ROB_DEPTH)]
    
    # 状态寄存器
    next_seq = m.out("next_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    out_ptr = m.out("out_ptr", clk=clk, rst=rst, width=2, init=u(2, 0))
    
    # 查找下一个seq
    has_next = u(1, 0)
    next_data = u(DATA_WIDTH, 0)
    
    for i in range(ROB_DEPTH):
        match = rob_valid[i] & (rob_seq[i] == next_seq.out())
        has_next = has_next | match
        next_data = next_data if (~match).out() else rob_data[i]
    
    # 输出寄存器
    lane_vld = [m.out(f"lane{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    lane_data = [m.out(f"lane{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    
    ptr = out_ptr.out()
    
    for i in range(N_LANES):
        this_lane = (ptr == u(2, i))
        should_out = this_lane & has_next
        lane_vld[i].set(should_out)
        lane_data[i].set(next_data if should_out else u(DATA_WIDTH, 0))
    
    # 更新状态
    any_out = lane_vld[0].out() | lane_vld[1].out() | lane_vld[2].out() | lane_vld[3].out()
    out_ptr.set((ptr + u(2, 1)) & u(2, 0x3) if any_out else ptr)
    next_seq.set(next_seq.out() + u(SEQ_WIDTH, 1) if any_out else next_seq.out())
    
    # 输出端口
    for i in range(N_LANES):
        m.output(f"vld{i}", lane_vld[i])
        m.output(f"data{i}", lane_data[i])
    
    m.output("read_req", any_out)
    m.output("read_seq", next_seq.out())


output_scheduler.__pycircuit_name__ = "output_scheduler"


# ============================================================================
# Top Module: FastFWD V3.3
# 整合所有子模块
# ============================================================================
@module
def fastfwd_v3(m: Circuit) -> None:
    """FastFWD V3.3 - 模块化设计"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # ========== 输入端口 ==========
    lane_in_vld = [m.input(f"lane{i}_pkt_in_vld", width=1) for i in range(N_LANES)]
    lane_in_data = [m.input(f"lane{i}_pkt_in_data", width=DATA_WIDTH) for i in range(N_LANES)]
    lane_in_ctrl = [m.input(f"lane{i}_pkt_in_ctrl", width=CTRL_WIDTH) for i in range(N_LANES)]
    
    fwded_vld = [m.input(f"fwded{i}_pkt_data_vld", width=1) for i in range(N_FE)]
    fwded_data = [m.input(f"fwded{i}_pkt_data", width=DATA_WIDTH) for i in range(N_FE)]
    
    # ========== 全局状态 ==========
    seq_cnt = m.out("seq_cnt", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    cycle_cnt = m.out("cycle_cnt", clk=clk, rst=rst, width=16, init=u(16, 0))
    cycle_cnt.set(cycle_cnt.out() + u(16, 1))
    
    # ========== Input Collector ==========
    # 实例化逻辑 (组合部分)
    current_seq = seq_cnt.out()
    
    # 计算seq偏移
    offset_0 = u(SEQ_WIDTH, 0)
    offset_1 = lane_in_vld[0].out()
    offset_2 = offset_1 + lane_in_vld[1].out()
    offset_3 = offset_2 + lane_in_vld[2].out()
    offsets = [offset_0, offset_1, offset_2, offset_3]
    
    # IC输出寄存器
    ic_vld = [m.out(f"ic_vld{i}", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    ic_data = [m.out(f"ic_data{i}", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    ic_ctrl = [m.out(f"ic_ctrl{i}", clk=clk, rst=rst, width=CTRL_WIDTH, init=u(CTRL_WIDTH, 0)) for i in range(N_LANES)]
    ic_seq = [m.out(f"ic_seq{i}", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_LANES)]
    
    for i in range(N_LANES):
        ic_vld[i].set(lane_in_vld[i])
        ic_data[i].set(lane_in_data[i])
        ic_ctrl[i].set(lane_in_ctrl[i])
        ic_seq[i].set(current_seq + offsets[i])
    
    total_input = lane_in_vld[0].out() + lane_in_vld[1].out() + lane_in_vld[2].out() + lane_in_vld[3].out()
    seq_cnt.set(current_seq + total_input)
    
    # ========== Dependency Table ==========
    dep_valid = [m.out(f"dep{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(MAX_DEP + 1)]
    dep_data = [m.out(f"dep{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    dep_seq_r = [m.out(f"dep{i}_seq_r", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    dep_write_ptr = m.out("dep_write_ptr", clk=clk, rst=rst, width=3, init=u(3, 0))
    
    # 多FE完成 - 优先级编码
    fe_done = u(1, 0)
    fe_done_data = u(DATA_WIDTH, 0)
    fe_done_seq = u(SEQ_WIDTH, 0)
    
    # FE状态寄存器
    fe_pkt_seq = [m.out(f"fe{i}_pkt_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_FE)]
    
    for i in range(N_FE):
        is_done = fwded_vld[i]
        fe_done = fe_done | is_done
        fe_done_data = fe_done_data if (~is_done).out() else fwded_data[i]
        fe_done_seq = fe_done_seq if (~is_done).out() else fe_pkt_seq[i].out()
    
    # 写入依赖表
    for i in range(MAX_DEP + 1):
        should_write = fe_done & (dep_write_ptr.out() == u(3, i))
        dep_valid[i].set(should_write | dep_valid[i].out())
        dep_data[i].set(fe_done_data if should_write else dep_data[i].out())
        dep_seq_r[i].set(fe_done_seq if should_write else dep_seq_r[i].out())
    
    new_dep_ptr = (dep_write_ptr.out() + u(3, 1)) & u(3, 0x7)
    dep_write_ptr.set(new_dep_ptr if fe_done else dep_write_ptr.out())
    
    # ========== FE Scheduler ==========
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    fe_last_finish = [m.out(f"fe{i}_last_finish", clk=clk, rst=rst, width=6, init=u(6, 0)) for i in range(N_FE)]
    
    fe_out_vld = [m.out(f"fwd{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fwd{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fwd{i}_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    fe_out_dp_vld = [m.out(f"fwd{i}_dp_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_dp_data = [m.out(f"fwd{i}_dp_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    
    current_cycle = cycle_cnt.out()
    
    for i in range(N_FE):
        # 解析ctrl
        lat = ic_ctrl[i].out() & u(CTRL_WIDTH, 0x3)
        dep = (ic_ctrl[i].out() >> u(CTRL_WIDTH, 2)) & u(CTRL_WIDTH, 0x7)
        
        # 约束检查
        finish_cycle = current_cycle + u(6, 2) + lat
        constraint_ok = finish_cycle > fe_last_finish[i].out()
        
        # 依赖查找 (内联CAM)
        target_seq = ic_seq[i].out() - dep
        dep_found = u(1, 0)
        dep_value = u(DATA_WIDTH, 0)
        
        for j in range(MAX_DEP + 1):
            match = dep_valid[j] & (dep_seq_r[j] == target_seq)
            dep_found = dep_found | match
            dep_value = dep_value if (~match).out() else dep_data[j]
        
        has_dep = dep != u(3, 0)
        dep_ready = has_dep & dep_found
        
        # 调度条件
        can_schedule = (~fe_busy[i].out()) & ic_vld[i].out() & constraint_ok & (~has_dep | dep_ready)
        
        # 更新FE状态
        fe_busy[i].set(can_schedule | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 1))))
        
        new_timer = (lat + u(3, 1)) if can_schedule else \
                    (fe_timer[i].out() - u(3, 1)) if fe_busy[i].out() else u(3, 0)
        fe_timer[i].set(new_timer)
        
        fe_last_finish[i].set(finish_cycle if can_schedule else fe_last_finish[i].out())
        fe_pkt_seq[i].set(ic_seq[i].out() if can_schedule else fe_pkt_seq[i].out())
        
        # FE输出
        fe_out_vld[i].set(can_schedule)
        fe_out_data[i].set(ic_data[i].out() if can_schedule else u(DATA_WIDTH, 0))
        fe_out_lat[i].set(lat if can_schedule else u(2, 0))
        fe_out_dp_vld[i].set(has_dep & can_schedule)
        fe_out_dp_data[i].set(dep_value if (has_dep & can_schedule) else u(DATA_WIDTH, 0))
    
    # ========== ROB ==========
    rob_valid = [m.out(f"rob{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(ROB_DEPTH)]
    rob_data = [m.out(f"rob{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(ROB_DEPTH)]
    rob_seq = [m.out(f"rob{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(ROB_DEPTH)]
    rob_tail = m.out("rob_tail", clk=clk, rst=rst, width=3, init=u(3, 0))
    
    # 写入ROB
    for i in range(ROB_DEPTH):
        should_write = fe_done & (rob_tail.out() == u(3, i))
        rob_valid[i].set(should_write | rob_valid[i].out())
        rob_data[i].set(fe_done_data if should_write else rob_data[i].out())
        rob_seq[i].set(fe_done_seq if should_write else rob_seq[i].out())
    
    rob_tail.set((rob_tail.out() + u(3, 1)) & u(3, 0x7) if fe_done else rob_tail.out())
    
    # ========== Output Scheduler ==========
    next_output_seq = m.out("next_output_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    out_ptr = m.out("out_ptr", clk=clk, rst=rst, width=2, init=u(2, 0))
    
    lane_out_vld = [m.out(f"lane{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_LANES)]
    lane_out_data = [m.out(f"lane{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_LANES)]
    
    ptr = out_ptr.out()
    next_seq_val = next_output_seq.out()
    
    # 查找下一个seq
    has_next = u(1, 0)
    next_data_val = u(DATA_WIDTH, 0)
    
    for i in range(ROB_DEPTH):
        match = rob_valid[i] & (rob_seq[i] == next_seq_val)
        has_next = has_next | match
        next_data_val = next_data_val if (~match).out() else rob_data[i]
    
    for i in range(N_LANES):
        this_lane = (ptr == u(2, i))
        should_out = this_lane & has_next
        lane_out_vld[i].set(should_out)
        lane_out_data[i].set(next_data_val if should_out else u(DATA_WIDTH, 0))
    
    any_out = lane_out_vld[0].out() | lane_out_vld[1].out() | lane_out_vld[2].out() | lane_out_vld[3].out()
    out_ptr.set((ptr + u(2, 1)) & u(2, 0x3) if any_out else ptr)
    next_output_seq.set(next_seq_val + u(SEQ_WIDTH, 1) if any_out else next_seq_val)
    
    # 清除已读ROB条目
    for i in range(ROB_DEPTH):
        should_clear = any_out & (rob_seq[i] == next_seq_val)
        rob_valid[i].set(u(1, 0) if should_clear else rob_valid[i].out())
    
    # ========== Backpressure ==========
    pending_cnt = ic_vld[0].out() + ic_vld[1].out() + ic_vld[2].out() + ic_vld[3].out()
    bkpr = m.out("bkpr_reg", clk=clk, rst=rst, width=1, init=u(1, 0))
    bkpr.set(pending_cnt >= u(4, 10))
    
    # ========== 输出端口 ==========
    for i in range(N_LANES):
        m.output(f"lane{i}_pkt_out_vld", lane_out_vld[i])
        m.output(f"lane{i}_pkt_out_data", lane_out_data[i])
    
    for i in range(N_FE):
        m.output(f"fwd{i}_pkt_data_vld", fe_out_vld[i])
        m.output(f"fwd{i}_pkt_data", fe_out_data[i])
        m.output(f"fwd{i}_pkt_lat", fe_out_lat[i])
        m.output(f"fwd{i}_pkt_dp_vld", fe_out_dp_vld[i])
        m.output(f"fwd{i}_pkt_dp_data", fe_out_dp_data[i])
    
    m.output("pkt_in_bkpr", bkpr)


fastfwd_v3.__pycircuit_name__ = "fastfwd_v3"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fastfwd_v3, name="fastfwd_v3")
    print(circuit.emit_mlir())
