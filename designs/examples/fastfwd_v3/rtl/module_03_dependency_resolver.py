"""
FastFWD V3 - Module 3: Dependency Resolver
依赖解析器 - 处理报文间的依赖关系

验证要点:
- dep=0: 无依赖
- dep=1~7: 依赖前 1~7 个报文
- 依赖数据 = 被依赖报文的处理结果
- 所有输出为寄存器
"""
from __future__ import annotations

from pycircuit import Circuit, module, u


N_FE = 4
DATA_WIDTH = 128
SEQ_WIDTH = 16
MAX_DEP = 7


@module
def dependency_resolver(m: Circuit) -> None:
    """
    依赖解析器模块
    
    输入: 4 个报文 (来自 FE Scheduler)
    输出: 4 个 FE 的 dp_vld 和 dp_data
    
    功能:
    - 检查每个报文的 dep
    - 在依赖表中查找被依赖报文的结果
    - 输出 dp_vld 和 dp_data
    """
    
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 输入端口
    in_vld = [m.input(f"in{i}_vld", width=1) for i in range(N_FE)]
    in_data = [m.input(f"in{i}_data", width=DATA_WIDTH) for i in range(N_FE)]
    in_seq = [m.input(f"in{i}_seq", width=SEQ_WIDTH) for i in range(N_FE)]
    in_dep = [m.input(f"in{i}_dep", width=3) for i in range(N_FE)]
    
    # 依赖查找表 (存储最近完成的报文结果)
    # 简化: 只存储 8 个最近的 (seq % 8)
    dep_mem_valid = [m.out(f"dep{i}_valid", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(MAX_DEP + 1)]
    dep_mem_data = [m.out(f"dep{i}_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    dep_mem_seq = [m.out(f"dep{i}_seq", clk=clk, rst=rst, width=SEQ_WIDTH, init=u(SEQ_WIDTH, 0)) for i in range(MAX_DEP + 1)]
    
    # 输出端口 (寄存器)
    out_dp_vld = [m.out(f"out{i}_dp_vld", clk=clk, rst=rst, width=1, init=u(1, 0)) for i in range(N_FE)]
    out_dp_data = [m.out(f"out{i}_dp_data", clk=clk, rst=rst, width=DATA_WIDTH, init=u(DATA_WIDTH, 0)) for i in range(N_FE)]
    
    # 组合逻辑: 检查依赖
    for i in range(N_FE):
        has_dep = in_dep[i] != u(3, 0)
        
        # 计算被依赖报文的 seq
        dep_seq = in_seq[i] - in_dep[i]
        
        # 在依赖表中查找 (简化: 直接比较)
        found = u(1, 0)
        found_data = u(DATA_WIDTH, 0)
        
        for j in range(MAX_DEP + 1):
            match = dep_mem_valid[j] & (dep_mem_seq[j] == dep_seq)
            found = found | match
            found_data = found_data if (~match).out() else dep_mem_data[j]
        
        # 输出
        out_dp_vld[i].set(has_dep & found)
        out_dp_data[i].set(found_data)
    
    # 更新依赖表 (当输入有效时)
    # 简化: 循环写入
    write_ptr = m.out("write_ptr", clk=clk, rst=rst, width=3, init=u(3, 0))
    
    any_vld = in_vld[0] | in_vld[1] | in_vld[2] | in_vld[3]
    
    # 找到第一个有效的输入写入依赖表
    for i in range(N_FE):
        should_write = in_vld[i] & (write_ptr == u(3, i))
        
        dep_mem_valid[i].set(should_write | dep_mem_valid[i].out())
        dep_mem_data[i].set(in_data[i] if should_write else dep_mem_data[i].out())
        dep_mem_seq[i].set(in_seq[i] if should_write else dep_mem_seq[i].out())
    
    # 更新写指针
    new_ptr = (write_ptr.out() + u(3, 1)) & u(3, 0x7)
    write_ptr.set(new_ptr if any_vld else write_ptr.out())
    
    # 输出端口
    for i in range(N_FE):
        m.output(f"out{i}_dp_vld", out_dp_vld[i])
        m.output(f"out{i}_dp_data", out_dp_data[i])


dependency_resolver.__pycircuit_name__ = "dependency_resolver"


if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(dependency_resolver, name="dependency_resolver")
    print(circuit.emit_mlir())
