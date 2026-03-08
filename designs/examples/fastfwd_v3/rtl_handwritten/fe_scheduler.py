"""
FastFWD V3 - Handwritten RTL: FE Scheduler
正确的约束实现: finish_cycle != existing_finish

This is a handwritten RTL-style implementation for PPA comparison.
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_FE = 4
DATA_WIDTH = 128
CTRL_WIDTH = 5
SEQ_WIDTH = 16


@module
def fe_scheduler_handwritten(m: Circuit) -> None:
    """
    FE Scheduler - Handwritten RTL with correct constraint
    
    Constraint: finish_cycle != existing_finish
    Purpose: Prevent two packets outputting from same FE in same cycle
    
    Correct scenario:
    - Cycle 0: pkt0 lat=3 -> finish@4
    - Cycle 1: pkt1 lat=1 -> finish@3  (ALLOWED, 4 != 3)
    
    Blocked scenario:
    - Cycle 0: pkt0 lat=2 -> finish@3
    - Cycle 1: pkt1 lat=1 -> finish@3  (BLOCKED, 3 == 3)
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # Inputs from Input Collector
    in_vld = [m.input(f"in{i}_vld", width=1) for i in range(N_FE)]
    in_data = [m.input(f"in{i}_data", width=DATA_WIDTH) for i in range(N_FE)]
    in_ctrl = [m.input(f"in{i}_ctrl", width=CTRL_WIDTH) for i in range(N_FE)]
    in_seq = [m.input(f"in{i}_seq", width=SEQ_WIDTH) for i in range(N_FE)]
    
    # FE state registers
    fe_busy = [m.out(f"fe{i}_busy", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_timer = [m.out(f"fe{i}_timer", clk=clk, rst=rst, width=3, init=u(3, 0)) for i in range(N_FE)]
    
    # Key: Store finish_cycle for constraint check (not last_finish!)
    fe_finish_cycle = [m.out(f"fe{i}_finish", clk=clk, rst=rst, width=4, init=u(4, 0)) for i in range(N_FE)]
    
    # Outputs to FE
    fe_out_vld = [m.out(f"fe{i}_out_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    fe_out_data = [m.out(f"fe{i}_out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    fe_out_lat = [m.out(f"fe{i}_out_lat", clk=clk, rst=rst, width=2, init=u(2, 0)) for i in range(N_FE)]
    
    # Cycle counter
    cycle_cnt = m.out("cycle_cnt", clk=clk, rst=rst, width=16, init=u(16, 0))
    cycle_cnt.set(cycle_cnt.out() + u(16, 1))
    
    current_cycle = cycle_cnt.out()
    
    # Process each FE slot
    for i in range(N_FE):
        # Extract latency from control
        lat = in_ctrl[i] & u(CTRL_WIDTH, 0x3)
        finish_cycle = current_cycle + lat + u(4, 1)
        
        # === CORRECT CONSTRAINT: finish_cycle != existing_finish ===
        # Check if this FE is busy and would finish at same cycle
        would_conflict = fe_busy[i].out() & (finish_cycle == fe_finish_cycle[i].out())
        
        # Can schedule if: not busy AND no conflict
        can_schedule = (~fe_busy[i].out()) & in_vld[i] & (~would_conflict)
        
        # Output assignment
        fe_out_vld[i].set(can_schedule)
        fe_out_data[i].set(in_data[i] if can_schedule else u(DATA_WIDTH, 0))
        fe_out_lat[i].set(lat if can_schedule else u(2, 0))
        
        # Update FE state
        new_busy = can_schedule | (fe_busy[i].out() & (fe_timer[i].out() > u(3, 1)))
        fe_busy[i].set(new_busy)
        
        new_timer = (lat + u(3, 1)) if can_schedule else \
                    (fe_timer[i].out() - u(3, 1)) if fe_busy[i].out() else u(3, 0)
        fe_timer[i].set(new_timer)
        
        # Store finish_cycle for next cycle's constraint check
        new_finish = finish_cycle if can_schedule else fe_finish_cycle[i].out()
        fe_finish_cycle[i].set(new_finish)
    
    # Output ports
    for i in range(N_FE):
        m.output(f"fe{i}_vld", fe_out_vld[i])
        m.output(f"fe{i}_data", fe_out_data[i])
        m.output(f"fe{i}_lat", fe_out_lat[i])


fe_scheduler_handwritten.__pycircuit_name__ = "fe_scheduler_handwritten"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(fe_scheduler_handwritten, name="fe_scheduler_handwritten")
    print(circuit.emit_mlir())
    
    # Save to file
    import os
    output_dir = os.path.join(os.path.dirname(__file__), "..", "mlir")
    os.makedirs(output_dir, exist_ok=True)
    
    mlir_path = os.path.join(output_dir, "fe_scheduler_handwritten.mlir")
    with open(mlir_path, "w") as f:
        f.write(circuit.emit_mlir())
    print(f"\nMLIR saved to: {mlir_path}")
