# FastFWD V3 - 生产级报文转发加速器

## 项目概述

FastFWD 是一个高性能报文转发加速器，支持 4 路并行输入、依赖解析、多 FE 并行处理和保序输出。

## 设计规格确认

基于需求文档，确认以下设计要点：

### 输入接口
- **4 个输入 lane** (lane0~lane3)
- 每个 lane 每 cycle 最多 1 个报文
- `lane{i}_pkt_in_data[127:0]`: 报文数据
- `lane{i}_pkt_in_vld`: 数据有效
- `lane{i}_pkt_in_ctrl[4:0]`: 控制信号
  - `[4:2]`: dependency (0~7)，0=无依赖，N=依赖前 N 个报文
  - `[1:0]`: latency (0~3)，0=1cycle，3=4cycle

### 输出接口
- **4 个输出 lane** (lane0~lane3)
- `lane{i}_pkt_out_data[127:0]`: 处理后数据
- `lane{i}_pkt_out_vld`: 输出有效
- **严格保序**: 从 lane0 开始，按报文序号 warp around 输出
- 每 cycle 输出 0~4 个报文

### 报文排序规则
1. **同 cycle 内**: lane0 < lane1 < lane2 < lane3
2. **不同 cycle**: 先输入的报文序号小
3. **依赖关系**: 基于报文序号，dep=N 表示依赖第 (seq-N) 个报文

### FE (Forwarding Engine) 模块
- 可配置 1~32 个，推荐 4 个
- 输入: data_vld, data[127:0], lat[1:0], dp_vld, dp_data[127:0]
- 输出: fwded_vld, fwded_data[127:0]
- 行为: lat=0 时 1cycle 后输出，lat=3 时 4cycle 后输出
- dp_vld=1 时，输出 = data + dp_data

### 关键约束
- 所有输入输出必须是寄存器
- FE 调度约束: lat=2 的输入后不能紧跟 lat=1 的输入
- 反压信号 pkt_in_bkpr=1 时，所有 lane 输入 valid 必须为 0

## 目录结构

```
fastfwd_v3/
├── rtl/
│   ├── __init__.py
│   ├── fastfwd.py          # 主设计文件
│   ├── input_collector.py  # 输入收集与排序
│   ├── fe_scheduler.py     # FE 调度器
│   ├── rob.py              # 重排序缓冲区
│   ├── output_scheduler.py # 输出调度器
│   └── utils.py            # 工具函数
├── tb/
│   ├── __init__.py
│   ├── tb_fastfwd.py       # 主测试平台
│   ├── ref_model.py        # 参考模型
│   └── test_cases.py       # 测试用例
├── docs/
│   ├── SPEC.md             # 设计规格
│   └── ARCH.md             # 架构文档
├── verilog/
│   └── fe.v                # FE 模块 Verilog 实现
└── mlir/                   # 生成的 MLIR 文件
```

## 快速开始

### 编译设计
```bash
cd /path/to/pyCircuit
bash flows/scripts/pyc build
pycircuit emit designs/examples/fastfwd_v3/rtl/fastfwd.py -o fastfwd_v3.pyc
```

### 生成 Verilog
```bash
pycc fastfwd_v3.pyc --emit=verilog -o fastfwd_v3.v
```

### 运行测试
```bash
python designs/examples/fastfwd_v3/tb/tb_fastfwd.py
```

## 版本历史

- V3.0 (2026-03-01): 初始生产级版本
  - 完整 4 lane 输入输出
  - 依赖解析和 FE 调度
  - ROB 保序输出
  - 反压支持
  - 完整测试覆盖

## 作者

Kimi Claw for hengliao1972
