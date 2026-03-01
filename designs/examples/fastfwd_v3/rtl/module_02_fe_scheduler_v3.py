"""
FastFWD V3 - Module 2v3: FE Scheduler (Optimized)
FE 调度器 - 优化版约束

约束理解:
- 同一 FE 内部: 不能有两个数据在同一 cycle 输出
- 不同 FE 之间: 无约束
- 每 cycle: 可以有输入 + 输出，但只能各一个

时序:
- lat=0: 1 cycle (N in, N+1 out)
- lat=1: 2 cycles (N in, N+2 out)
- lat=2: 3 cycles (N in, N+3 out)
- lat=3: 4 cycles (N in, N+4 out)

约束检查:
- 新输入的 finish_cycle = current_cycle + lat + 1
- 必须 > 上一输入的 finish_cycle (不是 >=)
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_FE = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16


@module
def fe_scheduler_v3(m: Circuit) -> None:
    """FE 调度器 - 优化版"""
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入
    in_vld = [m.input(f"in{i}_vld", width=1) for i in range(N_FE)]
    in_data = [m.input(f"in{i}_data", width=DATA_WIDTH) for i in range(N_FE)]
    in_ctrl = [m.input(f"in{i}_ctrl", width=CTRL_WIDTH) for i in range(N_FE)]
    in_seq = [m.input(f"in{i}_seq", width=SEQ_WIDTH) for i in range(N_FE)]
    
    # FE 状态
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    
    # 上一输入的 finish_cycle (用于约束)
    last_finish = [m.out(f"fe{i}_last_finish", clk=clk, rst=rst, width=4, init=u(4, 0)) for i in range(N_FE)]
    
    # 输出
    fe_out_vld = [m.out(f"fe{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fe{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fe{i}_out_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    
    # 当前 cycle (简化，实际应该用全局计数器)
    cycle_cnt = m.out("cycle_cnt", clk=clk, rst=rst, width=16, init=u(16, 0))
    cycle_cnt.set(cycle_cnt.out() + u(16, 1))
    
    current_cycle = cycle_cnt.out()
    
    for i in range(N_FE):
        lat = in_ctrl[i] & u(CTRL_WIDTH, 0x3)
        finish_cycle = current_cycle + lat + u(4, 1)
        
        # 约束: 新 finish_cycle > 上一 finish_cycle
        # 且 FE 不忙
        constraint_ok = finish_cycle > last_finish[i].out()
        can_schedule = (~fe_busy[i].out()) & in_vld[i] & constraint_ok
        
        fe_out_vld[i].set(can_schedule)
        fe_out_data[i].set(in_data[i] if can_schedule else u(DATA_WIDTH, 0))
        fe_out_lat[i].set(lat if can_schedule else u(2, 0))
        
        # 更新 FE 状态
        new_busy = can_schedule | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 1)))
        fe_busy[i].set(new_busy)
        
        new_timer = (lat + u(3, 1)) if can_schedule else \
                    (fe_timer[i].out() - u(3, 1)) if fe_busy[i].out() else u(3, 0)
        fe_timer[i].set(new_timer)
        
        # 更新 last_finish
        new_last_finish = finish_cycle if can_schedule else last_finish[i].out()
        last_finish[i].set(new_last_finish)
    
    # 输出
    for i in range(N_FE):
        m.output(f"fe{i}_vld", fe_out_vld[i])
        m.output(f"fe{i}_data", fe_out_data[i])
        m.output(f"fe{i}_lat", fe_out_lat[i])


fe_scheduler_v3.__pycircuit_name__ = "fe_scheduler_v3"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fe_scheduler_v3, name="fe_scheduler_v3")
    print(circuit.emit_mlir())
