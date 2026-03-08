"""
FastFWD V3 - Module 2: FE Scheduler (Corrected)
FE 调度器 - 修正版，正确处理时序约束

关键理解:
- lat=0: 1 cycle 延迟 (Cycle N 输入, Cycle N+1 输出)
- lat=1: 2 cycles 延迟 (Cycle N 输入, Cycle N+2 输出)
- lat=2: 3 cycles 延迟 (Cycle N 输入, Cycle N+3 输出)
- lat=3: 4 cycles 延迟 (Cycle N 输入, Cycle N+4 输出)

约束: 如果 Cycle N 输入 lat=X，则 Cycle N+1 不能输入 lat < X-1
原因: 避免两个报文在同一个 cycle 从 FE 输出

示例冲突:
- Cycle 1: 输入 lat=1 (2 cycles, 输出在 Cycle 3)
- Cycle 2: 输入 lat=0 (1 cycle, 输出在 Cycle 3)  <- 冲突！都在 Cycle 3 输出
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_FE = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16


@module
def fe_scheduler(m: Circuit) -> None:
    """
    FE 调度器模块 (修正版)
    
    时序关键设计:
    - 每个 FE 有独立的定时器
    - 定时器 = lat + 1 (lat=0 时定时器=1)
    - 每 cycle 定时器减 1，到 0 时输出
    - 检查约束: 新输入的 lat 必须 >= 上一输入的 lat - 1
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口
    in_vld = [m.input(f"in{i}_vld", width=1) for i in range(N_FE)]
    in_data = [m.input(f"in{i}_data", width=DATA_WIDTH) for i in range(N_FE)]
    in_ctrl = [m.input(f"in{i}_ctrl", width=CTRL_WIDTH) for i in range(N_FE)]
    in_seq = [m.input(f"in{i}_seq", width=SEQ_WIDTH) for i in range(N_FE)]
    
    # FE 状态 (寄存器)
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    
    # 上一 cycle 的 lat (用于约束检查)
    last_lat = m.out("last_lat", clk=clk, rst=rst, width=2, init=u(2, 0))
    last_lat_valid = m.out("last_lat_valid", clk=clk, rst=rst, width=1, init=u(1, 0))
    
    # FE 输出 (寄存器)
    fe_out_vld = [m.out(f"fe{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fe{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fe{i}_out_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    
    # 计算当前输入的 lat
    current_lats = []
    for i in range(N_FE):
        lat = in_ctrl[i] & u(CTRL_WIDTH, 0x3)
        current_lats.append(lat)
    
    # 找到第一个有效的输入及其 lat
    first_vld_idx = 0
    first_vld_lat = current_lats[0]
    
    # 简化的约束检查: 如果上一 cycle 有输入，检查约束
    # 约束: 当前 lat >= 上一 lat - 1
    # 即: 当前输出 cycle > 上一输出 cycle
    # lat=0 -> 1 cycle, lat=1 -> 2 cycles, ...
    
    for i in range(N_FE):
        # 检查约束: 新 lat 必须 >= 上一 lat
        # 避免两个报文在同一个 cycle 从 FE 输出
        if last_lat_valid.out():
            # 约束: 当前 lat >= 上一 lat
            constraint_violation = current_lats[i] < last_lat.out()
            can_schedule = (~fe_busy[i].out()) & in_vld[i] & (~constraint_violation)
        else:
            can_schedule = (~fe_busy[i].out()) & in_vld[i]
        
        # 设置输出
        fe_out_vld[i].set(can_schedule)
        fe_out_data[i].set(in_data[i] if can_schedule else u(DATA_WIDTH, 0))
        fe_out_lat[i].set(current_lats[i] if can_schedule else u(2, 0))
        
        # 更新 FE 状态
        new_busy = can_schedule | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 1)))
        fe_busy[i].set(new_busy)
        
        # 更新定时器
        # 新输入: 定时器 = lat + 1
        # 正在处理: 定时器 - 1
        new_timer = (current_lats[i] + u(3, 1)) if can_schedule else \
                    (fe_timer[i].out() - u(3, 1)) if fe_busy[i].out() else u(3, 0)
        fe_timer[i].set(new_timer)
    
    # 更新 last_lat (记录第一个有效的输入)
    any_vld = in_vld[0] | in_vld[1] | in_vld[2] | in_vld[3]
    
    # 找到第一个有效的 lat
    first_valid_lat = u(2, 0)
    for i in range(N_FE):
        if i == 0:
            first_valid_lat = current_lats[i] if in_vld[i] else u(2, 0)
        else:
            first_valid_lat = current_lats[i] if in_vld[i] else first_valid_lat
    
    last_lat.set(first_valid_lat if any_vld else last_lat.out())
    last_lat_valid.set(any_vld)
    
    # 输出端口
    for i in range(N_FE):
        m.output(f"fe{i}_vld", fe_out_vld[i])
        m.output(f"fe{i}_data", fe_out_data[i])
        m.output(f"fe{i}_lat", fe_out_lat[i])


fe_scheduler.__pycircuit_name__ = "fe_scheduler_v2"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fe_scheduler, name="fe_scheduler_v2")
    print(circuit.emit_mlir())
