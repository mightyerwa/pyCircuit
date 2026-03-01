"""
FastFWD V3 - Module 2: FE Scheduler
FE 调度器 - 管理 4 个 FE 实例，处理延迟和约束

验证要点:
- 4 个 FE 并行处理
- lat=0~3 对应 1~4 cycles 延迟
- FE 约束: lat=2 后不能接 lat=1
- 所有输出为寄存器
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
    FE 调度器模块
    
    输入: 4 个报文 (来自 Input Collector)
    输出: 4 个 FE 的控制信号
    
    功能:
    - 轮询分配报文到 FE
    - 记录每个 FE 的忙闲状态
    - 检查调度约束
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口 (来自 Input Collector)
    in_vld = [m.input(f"in{i}_vld", width=1) for i in range(N_FE)]
    in_data = [m.input(f"in{i}_data", width=DATA_WIDTH) for i in range(N_FE)]
    in_ctrl = [m.input(f"in{i}_ctrl", width=CTRL_WIDTH) for i in range(N_FE)]
    in_seq = [m.input(f"in{i}_seq", width=SEQ_WIDTH) for i in range(N_FE)]
    
    # FE 状态寄存器
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    fe_seq = [m.out(f"fe{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(N_FE)]
    
    # 上一个 lat (用于约束检查)
    last_lat = m.out("last_lat", clk=clk, rst=rst, width=2, init=u(2, 0))
    
    # FE 控制输出 (寄存器)
    fe_out_vld = [m.out(f"fe{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fe{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fe{i}_out_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    
    # 组合逻辑: 计算当前 lat
    current_lats = []
    for i in range(N_FE):
        lat = in_ctrl[i] & u(CTRL_WIDTH, 0x3)
        current_lats.append(lat)
    
    # 简化的调度: 每个 FE 处理对应位置的输入
    # (实际应该做轮询和约束检查)
    for i in range(N_FE):
        # 如果 FE 不忙且有输入，开始处理
        can_start = (~fe_busy[i].out()) & in_vld[i]
        
        # 设置输出
        fe_out_vld[i].set(can_start)
        fe_out_data[i].set(in_data[i])
        fe_out_lat[i].set(current_lats[i])
        
        # 更新 FE 状态
        new_busy = can_start | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 0)))
        fe_busy[i].set(new_busy)
        
        # 设置定时器 (lat + 1)
        new_timer = (current_lats[i] + u(3, 1)) if can_start else (fe_timer[i].out() - u(3, 1))
        fe_timer[i].set(new_timer)
        
        # 记录 seq
        fe_seq[i].set(in_seq[i] if can_start else fe_seq[i].out())
    
    # 更新 last_lat
    any_vld = in_vld[0] | in_vld[1] | in_vld[2] | in_vld[3]
    new_last_lat = (current_lats[0] if in_vld[0] else 
                    current_lats[1] if in_vld[1] else
                    current_lats[2] if in_vld[2] else
                    current_lats[3] if in_vld[3] else last_lat.out())
    last_lat.set(new_last_lat if any_vld else last_lat.out())
    
    # 输出端口
    for i in range(N_FE):
        m.output(f"fe{i}_vld", fe_out_vld[i])
        m.output(f"fe{i}_data", fe_out_data[i])
        m.output(f"fe{i}_lat", fe_out_lat[i])


fe_scheduler.__pycircuit_name__ = "fe_scheduler"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fe_scheduler, name="fe_scheduler")
    print(circuit.emit_mlir())
