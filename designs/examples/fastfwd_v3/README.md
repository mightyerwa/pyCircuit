# FastFWD V3 - 生产级报文转发加速器

## 1. 设计概述

FastFWD 是一个高性能报文转发加速器，处理 4 路并行输入报文，支持依赖解析、多 FE 并行处理和严格保序输出。

**核心特性**:
- 4 路输入/输出，每路 128bit 数据
- 支持 4 个 FE (Forwarding Engine) 并行处理
- 依赖解析 (dep 1~7)
- 延迟处理 (lat 0~3，对应 1~4 cycles)
- ROB (Reorder Buffer) 保序输出
- 反压控制

---

## 2. 接口定义

### 2.1 输入接口

| 信号名 | 位宽 | 方向 | 说明 |
|--------|------|------|------|
| clk | 1 | Input | 时钟 |
| rst | 1 | Input | 复位 (高有效) |
| lane{i}_pkt_in_vld | 1 | Input | Lane i 输入有效 |
| lane{i}_pkt_in_data | 128 | Input | Lane i 输入数据 |
| lane{i}_pkt_in_ctrl | 5 | Input | Lane i 控制信号 |

### 2.2 输出接口

| 信号名 | 位宽 | 方向 | 说明 |
|--------|------|------|------|
| lane{i}_pkt_out_vld | 1 | Output | Lane i 输出有效 |
| lane{i}_pkt_out_data | 128 | Output | Lane i 输出数据 |
| pkt_in_bkpr | 1 | Output | 反压信号 |

### 2.3 FE 接口

| 信号名 | 位宽 | 方向 | 说明 |
|--------|------|------|------|
| fwd{i}_pkt_data_vld | 1 | Output | FE i 输入数据有效 |
| fwd{i}_pkt_data | 128 | Output | FE i 输入数据 |
| fwd{i}_pkt_lat | 2 | Output | FE i 延迟 (0~3) |
| fwd{i}_pkt_dp_vld | 1 | Output | FE i 依赖数据有效 |
| fwd{i}_pkt_dp_data | 128 | Output | FE i 依赖数据 |
| fwded{i}_pkt_data_vld | 1 | Input | FE i 输出数据有效 |
| fwded{i}_pkt_data | 128 | Input | FE i 输出数据 |

---

## 3. 控制信号 ctrl[4:0] 详解

```
[4:2] : dependency (3bit)
  - 0: 无依赖
  - 1~7: 依赖前面第 1~7 个报文
  
[1:0] : latency (2bit)
  - 0: 1 cycle 延迟
  - 1: 2 cycles 延迟
  - 2: 3 cycles 延迟
  - 3: 4 cycles 延迟
```

---

## 4. 关键设计约束

1. **寄存器输出**: 所有输出必须是寄存器
2. **FE 调度约束**: lat=2 的输入后不能紧跟 lat=1 的输入
3. **输出保序**: 必须按报文序号顺序输出
4. **warp around**: lane0 输出 seq 0,4,8,12...

---

## 5. 文件结构

```
fastfwd_v3/
├── rtl/
│   ├── fastfwd_v2.py      # V2 基础版
│   ├── fastfwd_v2_1.py    # V2 完善版
│   └── fastfwd_v3.py      # V3 完整实现
├── tb/
│   ├── tb_v2.py           # V2 测试
│   └── comprehensive_test.py  # 全面测试
├── verilog/
│   └── fe.v               # FE 模块
└── docs/
    └── SPEC.md            # 详细规格
```

---

## 6. 版本历史

- V2.0: 基础透传版本
- V2.1: 完善 FIFO 和输出调度
- V3.0: 完整实现 (FE、依赖、ROB)

---

作者: Kimi Claw for mightyerwa
