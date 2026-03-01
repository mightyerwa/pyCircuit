# pyCircuit 完整使用教程

**目标**: 让零基础用户理解 pyCircuit 语法、Python 编写规范和 MLIR 概念

**作者**: Kimi Claw  
**日期**: 2026-03-01

---

## 目录

1. [pyCircuit 是什么](#1-pycircuit-是什么)
2. [核心概念](#2-核心概念)
3. [Python 语法详解](#3-python-语法详解)
4. [完整示例拆解](#4-完整示例拆解)
5. [MLIR 简介](#5-mlir-简介)
6. [常用命令](#6-常用命令)
7. [调试技巧](#7-调试技巧)

---

## 1. pyCircuit 是什么

### 1.1 一句话解释

**pyCircuit 让你用 Python 写代码，自动生成硬件电路。**

### 1.2 类比理解

| 软件世界 | 硬件世界 |
|---------|---------|
| Python 代码 | Verilog/VHDL 代码 |
| Python 解释器 | pyCircuit 编译器 |
| 生成可执行文件 | 生成芯片电路 |

### 1.3 工作流程

```
你的 Python 代码
      ↓
pyCircuit 编译器
      ↓
MLIR (中间表示)
      ↓
Verilog/C++ (硬件代码)
      ↓
FPGA/芯片
```

---

## 2. 核心概念

### 2.1 信号 (Signal)

**信号是硬件中的"线"，用来传输数据。**

```python
# 1 位信号 (像开关)
a = m.input("a", width=1)  # 值: 0 或 1

# 8 位信号 (像一个字节)
b = m.input("b", width=8)  # 值: 0 ~ 255

# 128 位信号 (像宽总线)
c = m.input("c", width=128)  # 值: 0 ~ 2^128-1
```

### 2.2 寄存器 (Register)

**寄存器是带记忆的元件，能保存数据到下一个时钟周期。**

```python
# 创建寄存器
reg = m.out("my_reg", clk=clk, rst=rst, width=8, init=u(8, 0))

# 参数解释:
# - "my_reg": 名字
# - clk=clk: 连接时钟
# - rst=rst: 连接复位
# - width=8: 8位宽
# - init=u(8, 0): 初始值为 0
```

### 2.3 时钟 (Clock) 和 复位 (Reset)

```python
clk = m.clock("clk")  # 时钟信号，硬件的心跳
rst = m.reset("rst")  # 复位信号，让电路回到初始状态
```

**时钟的作用**:
```
    ┌──┐   ┌──┐   ┌──┐   ┌──┐
────┘  └───┘  └───┘  └───┘  └───
    ↑      ↑      ↑      ↑
  上升沿  上升沿  上升沿  上升沿

寄存器只在上升沿更新值
```

---

## 3. Python 语法详解

### 3.1 装饰器 @module

```python
from pycircuit import module, Circuit

@module
def my_design(m: Circuit) -> None:
    # 你的电路设计在这里
    pass
```

**作用**:
- 告诉 pyCircuit "这是一个硬件模块"
- 自动处理参数
- 让 compile() 能识别这个函数

### 3.2 Circuit 类

`m: Circuit` 是你的"画布"，所有硬件都在上面创建：

```python
@module
def my_design(m: Circuit) -> None:
    # 创建输入
    a = m.input("a", width=8)
    
    # 创建输出
    m.output("y", a)
```

### 3.3 创建输入/输出

```python
# 输入端口
clk = m.clock("clk")              # 时钟
rst = m.reset("rst")              # 复位
a = m.input("a", width=8)         # 8位数据输入

# 内部信号 (组合逻辑，像电线)
wire = m.wire("wire", width=8)    # 注意: 新版可能不支持

# 寄存器 (带记忆)
reg = m.out("reg", clk=clk, rst=rst, width=8, init=u(8, 0))

# 输出端口
m.output("y", reg)
```

### 3.4 字面量 u() 和 s()

```python
from pycircuit import u, s

# u = unsigned (无符号数)
u(8, 255)       # 8位无符号数，值=255
u(8, 0b1010)    # 8位无符号数，二进制 1010
u(8, 0xFF)      # 8位无符号数，十六进制 FF

# s = signed (有符号数，补码)
s(8, -1)        # 8位有符号数，值=-1
s(8, 127)       # 最大值
```

### 3.5 条件赋值

```python
# 方式 1: if-else
if condition:
    result.set(a)
else:
    result.set(b)

# 方式 2: 三元表达式 (推荐)
result.set(a if condition else b)

# 方式 3: when 参数 (某些版本)
result.set(a, when=condition)
```

### 3.6 位操作

```python
# 位选择 (取一部分位)
low_byte = data[0:8]      # 取第 0-7 位
high_byte = data[24:32]   # 取第 24-31 位
bit_5 = data[5]           # 取第 5 位

# 位拼接
cat(a, b)  # 把 a 和 b 拼起来

# 类型转换
unsigned(a)  # 转无符号
```

---

## 4. 完整示例拆解

### 4.1 8位计数器 (最简单)

```python
from pycircuit import Circuit, module, u

@module
def counter(m: Circuit, width: int = 8) -> None:
    """
    8位计数器
    每当时钟上升沿且 enable=1 时，计数器加1
    """
    # 1. 定义输入
    clk = m.clock("clk")      # 时钟
    rst = m.reset("rst")      # 复位
    en = m.input("enable", width=1)  # 使能信号
    
    # 2. 创建寄存器
    count = m.out(
        "count_q",             # 名字
        clk=clk,               # 连接时钟
        rst=rst,               # 连接复位
        width=width,           # 8位宽
        init=u(width, 0)       # 初始值为0
    )
    
    # 3. 定义逻辑
    # count = count + 1 (当 enable=1 时)
    count.set(count.out() + 1, when=en)
    
    # 4. 定义输出
    m.output("count", count)

# 设置模块名
counter.__pycircuit_name__ = "counter"

# 编译并生成 MLIR
if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(counter, name="counter", width=8)
    print(circuit.emit_mlir())
```

**逐行解释**:

| 行 | 代码 | 解释 |
|---|------|------|
| 1 | `from pycircuit import ...` | 导入需要的功能 |
| 4 | `@module` | 装饰器，标记这是硬件模块 |
| 4 | `def counter(m: Circuit, ...)` | 定义模块，m 是画布 |
| 10-12 | `clk = m.clock(...)` | 创建时钟、复位、使能输入 |
| 15-21 | `count = m.out(...)` | 创建8位寄存器，初始值为0 |
| 25 | `count.set(...)` | 定义逻辑：下一周期 count = 当前 count + 1 |
| 28 | `m.output(...)` | 把寄存器连接到输出端口 |
| 36 | `compile(...)` | 编译成硬件描述 |
| 37 | `emit_mlir()` | 生成 MLIR 代码 |

### 4.2 多路选择器 (MUX)

```python
from pycircuit import Circuit, module

@module
def mux(m: Circuit) -> None:
    """
    2选1多路选择器
    sel=0 时输出 a，sel=1 时输出 b
    """
    # 输入
    sel = m.input("sel", width=1)
    a = m.input("a", width=8)
    b = m.input("b", width=8)
    
    # 组合逻辑 (直接计算，无时钟)
    # Python 的 if-else 会被转成硬件 MUX
    y = a if sel else b
    
    # 输出
    m.output("y", y)
```

### 4.3 FastFWD 简化版

```python
from pycircuit import Circuit, module, u

N_LANES = 4  # 常量定义

@module
def fastfwd(m: Circuit) -> None:
    """
    简化版 FastFWD
    4个lane输入，排序后输出
    """
    clk = m.clock("clk")
    rst = m.reset("rst")
    
    # 4个输入
    inputs = []
    for i in range(N_LANES):
        vld = m.input(f"in{i}_vld", width=1)
        data = m.input(f"in{i}_data", width=128)
        inputs.append((vld, data))
    
    # 输出寄存器
    out_vld = []
    out_data = []
    for i in range(N_LANES):
        vld = m.out(f"out{i}_vld", clk=clk, rst=rst, width=1, init=u(1, 0))
        data = m.out(f"out{i}_data", clk=clk, rst=rst, width=128, init=u(128, 0))
        out_vld.append(vld)
        out_data.append(data)
    
    # 简化的逻辑: 直接透传
    for i in range(N_LANES):
        out_vld[i].set(inputs[i][0])
        out_data[i].set(inputs[i][1])
    
    # 连接输出
    for i in range(N_LANES):
        m.output(f"lane{i}_out_vld", out_vld[i])
        m.output(f"lane{i}_out_data", out_data[i])
```

---

## 5. MLIR 简介

### 5.1 什么是 MLIR

**MLIR = Multi-Level Intermediate Representation**

- 是硬件的"汇编语言"
- 介于 Python 和 Verilog 之间
- 便于优化和转换

### 5.2 MLIR 示例

Python 代码:
```python
count.set(count.out() + 1)
```

生成的 MLIR:
```mlir
%current = pyc.alias %count {pyc.name = "count"} : i8
%one = pyc.constant 1 : i8
%next = pyc.add %current, %one : i8
pyc.assign %count__next, %next : i8
```

**解释**:
- `%current`: 当前值
- `%one`: 常量 1
- `%next`: 加法结果
- `pyc.assign`: 赋值给下一周期

### 5.3 从 MLIR 到 Verilog

```bash
# MLIR -> Verilog
pycc input.mlir --emit=verilog -o output.v
```

---

## 6. 常用命令

### 6.1 编译 pyCircuit 项目

```bash
# 1. 进入项目目录
cd pyCircuit

# 2. 激活虚拟环境
source venv/bin/activate

# 3. 安装依赖
pip install -e .

# 4. 构建编译器 (需要 LLVM/MLIR)
bash flows/scripts/pyc build
```

### 6.2 生成 MLIR

```bash
# Python -> MLIR
python your_design.py > output.mlir
```

### 6.3 生成 Verilog

```bash
# MLIR -> Verilog
pycc input.mlir --emit=verilog -o output.v

# 或直接
pycc input.mlir --emit=verilog -o output/
```

### 6.4 运行测试

```bash
# 运行示例
bash flows/scripts/run_examples.sh

# 运行仿真
bash flows/scripts/run_sims.sh
```

---

## 7. 调试技巧

### 7.1 常见错误

| 错误 | 原因 | 解决 |
|------|------|------|
| `unknown function 'mux'` | 使用了旧 API | 用 `a if cond else b` 代替 |
| `width mismatch` | 位宽不匹配 | 检查所有信号的 width |
| `reg not assigned` | 寄存器没有赋值 | 确保所有寄存器都有 .set() |

### 7.2 调试方法

```python
# 1. 简化设计，先跑通最简单的版本
@module
def test(m: Circuit) -> None:
    clk = m.clock("clk")
    rst = m.reset("rst")
    a = m.input("a", width=1)
    
    reg = m.out("reg", clk=clk, rst=rst, width=1, init=u(1, 0))
    reg.set(a)  # 最简单的透传
    
    m.output("y", reg)

# 2. 逐步添加功能
# 3. 每步都编译测试
```

### 7.3 查看生成的 MLIR

```python
if __name__ == "__main__":
    from pycircuit import compile
    circuit = compile(your_design, name="test")
    
    # 打印 MLIR
    mlir_code = circuit.emit_mlir()
    print(mlir_code)
    
    # 保存到文件
    with open("output.mlir", "w") as f:
        f.write(mlir_code)
```

---

## 8. 学习路径

### 第 1 周: 基础
- [ ] 理解信号、寄存器、时钟
- [ ] 跑通计数器例子
- [ ] 修改计数器 (改位宽、改逻辑)

### 第 2 周: 组合逻辑
- [ ] 实现 MUX
- [ ] 实现加法器
- [ ] 实现简单 ALU

### 第 3 周: 时序逻辑
- [ ] 实现状态机
- [ ] 实现 FIFO
- [ ] 理解时序约束

### 第 4 周: 复杂设计
- [ ] 阅读 FastFWD V2
- [ ] 尝试修改 V2
- [ ] 理解 V3 架构

---

## 9. 参考资源

- **官方文档**: https://docs.openclaw.ai
- **GitHub**: https://github.com/LinxISA/pyCircuit
- **示例**: `designs/examples/` 目录

---

**记住**: 硬件设计就像搭积木，从简单开始，逐步复杂。遇到问题，先简化再调试。

---

*教程完成*
