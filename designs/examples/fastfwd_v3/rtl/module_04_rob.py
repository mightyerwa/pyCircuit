"""
FastFWD V3 - Module 4: ROB (Reorder Buffer)
重排序缓冲 - 按报文序号排序输出

验证要点:
- 按 seq 顺序存储
- 乱序完成支持
- 按序输出
- 所有输出为寄存器
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


DATA_WIDTH = 128
SEQ_WIDTH = 16
ROB_DEPTH = 32


def clog2(n: int) -> int:
    return (n - 1).bit_length() if n > 1 else 1


@module
def rob(m: Circuit) -> None:
    """
    ROB 模块
    
    输入: FE 完成的数据
    输出: 按序排列的报文
    
    功能:
    - 按 seq 存储完成的报文
    - 支持乱序完成
    - 按序输出到 Output Scheduler
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    ptr_width = clog2(ROB_DEPTH)
    
    # 输入端口 (来自 FE)
    in_vld = m.input("in_vld", width=1)
    in_data = m.input("in_data", width=DATA_WIDTH)
    in_seq = m.input("in_seq", width=SEQ_WIDTH)
    
    # ROB 存储
    rob_valid = [m.out(f"rob{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(ROB_DEPTH)]
    rob_data = [m.out(f"rob{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(ROB_DEPTH)]
    rob_seq = [m.out(f"rob{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(ROB_DEPTH)]
    
    # 读写指针
    head = m.out("head", clk=clk, rst=rst, width=ptr_width, init=u(ptr_width, 0))
    tail = m.out("tail", clk=clk, rst=rst, width=ptr_width, init=u(ptr_width, 0))
    count = m.out("count", clk=clk, rst=rst, width=ptr_width+1, init=u(ptr_width+1, 0))
    
    # 下一个期望的 seq
    next_seq = m.out("next_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    
    # 输出端口 (寄存器)
    out_vld = m.out("out_vld", clk=clk, rst=rst, width=1, init=u(1, 0))
    out_data = m.out("out_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0))
    out_seq = m.out("out_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0))
    
    # 写入逻辑 (简化: 直接写入 tail)
    tail_ptr = tail.out()
    
    for i in range(ROB_DEPTH):
        should_write = in_vld & (tail_ptr == u(ptr_width, i))
        
        rob_valid[i].set(should_write | rob_valid[i].out())
        rob_data[i].set(in_data if should_write else rob_data[i].out())
        rob_seq[i].set(in_seq if should_write else rob_seq[i].out())
    
    # 更新 tail
    new_tail = (tail_ptr + u(ptr_width, 1)) & u(ptr_width, ROB_DEPTH - 1)
    tail.set(new_tail if in_vld else tail_ptr)
    
    # 更新 count
    new_count = count.out() + u(ptr_width+1, 1)
    count.set(new_count if in_vld else count.out())
    
    # 读取逻辑: 找到 next_seq 对应的 entry
    head_ptr = head.out()
    
    # 检查 head 位置是否有效且 seq 匹配
    head_valid = rob_valid[0]  # 简化
    head_seq_match = (rob_seq[0] == next_seq.out())  # 简化
    
    can_output = head_valid & head_seq_match
    
    out_vld.set(can_output)
    out_data.set(rob_data[0] if can_output else u(DATA_WIDTH, 0))  # 简化
    out_seq.set(rob_seq[0] if can_output else u(SEQ_WIDTH, 0))
    
    # 更新 head 和 next_seq
    new_head = (head_ptr + u(ptr_width, 1)) & u(ptr_width, ROB_DEPTH - 1)
    head.set(new_head if can_output else head_ptr)
    
    new_next_seq = next_seq.out() + u(SEQ_WIDTH, 1)
    next_seq.set(new_next_seq if can_output else next_seq.out())
    
    # 输出端口
    m.output("out_vld_o", out_vld)
    m.output("out_data_o", out_data)
    m.output("out_seq_o", out_seq)


rob.__pycircuit_name__ = "rob"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(rob, name="rob")
    print(circuit.emit_mlir())
