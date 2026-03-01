"""
FastFWD V3 - Module 6: Backpressure Generator
反压生成器 - 时序关键模块

时序要求:
- 组合逻辑检测 ROB 水位
- 寄存器输出反压信号 (下一 cycle 生效)
- 反压生效后，下一 cycle 输入必须为 0
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


ROB_DEPTH = 32
ROB_PTR_WIDTH = 5  # log2(32)


@module
def backpressure_generator(m: Circuit) -> None:
    """
    反压生成器
    
    输入: ROB 当前水位 (count)
    输出: pkt_in_bkpr (寄存器输出)
    
    时序:
    Cycle N:   检测 ROB 快满
    Cycle N+1: bkpr=1 (寄存器输出)
    Cycle N+2: 外部响应，input vld=0
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入: ROB 当前计数 (来自 ROB 模块，组合逻辑)
    rob_count = m.input("rob_count", width=ROB_PTR_WIDTH+1)
    
    # 反压阈值 (可配置)
    # 当 ROB 剩余空间 <= 4 时产生反压
    threshold = u(ROB_PTR_WIDTH+1, ROB_DEPTH - 4)
    
    # 组合逻辑: 检测是否需要反压
    need_bkpr = rob_count >= threshold
    
    # 寄存器输出 (关键时序: 下一 cycle 生效)
    bkpr = m.out("pkt_in_bkpr", clk=clk, rst=rst, width=1, init=u(1, 0))
    bkpr.set(need_bkpr)
    
    # 输出
    m.output("bkpr_o", bkpr)


backpressure_generator.__pycircuit_name__ = "backpressure_generator"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(backpressure_generator, name="backpressure_generator")
    print(circuit.emit_mlir())
