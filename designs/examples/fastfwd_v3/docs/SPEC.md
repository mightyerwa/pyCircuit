# FastFWD 设计规格说明

## 1. 设计概述

FastFWD 是一个高性能报文转发加速器，用于处理 4 路并行输入的报文流，支持依赖解析、多 FE 并行处理和严格保序输出。

## 2. 接口定义

### 2.1 输入接口

| 信号名 | 位宽 | 方向 | 说明 |
|--------|------|------|------|
| clk | 1 | Input | 时钟信号 |
| rst | 1 | Input | 复位信号 (高有效) |
| lane0_pkt_in_vld | 1 | Input | Lane 0 输入有效 |
| lane0_pkt_in_data | 128 | Input | Lane 0 输入数据 |
| lane0_pkt_in_ctrl | 5 | Input | Lane 0 控制信号 |
| lane1_pkt_in_vld | 1 | Input | Lane 1 输入有效 |
| lane1_pkt_in_data | 128 | Input | Lane 1 输入数据 |
| lane1_pkt_in_ctrl | 5 | Input | Lane 1 控制信号 |
| lane2_pkt_in_vld | 1 | Input | Lane 2 输入有效 |
| lane2_pkt_in_data | 128 | Input | Lane 2 输入数据 |
| lane2_pkt_in_ctrl | 5 | Input | Lane 2 控制信号 |
| lane3_pkt_in_vld | 1 | Input | Lane 3 输入有效 |
| lane3_pkt_in_data | 128 | Input | Lane 3 输入数据 |
| lane3_pkt_in_ctrl | 5 | Input | Lane 3 控制信号 |

### 2.2 输出接口

| 信号名 | 位宽 | 方向 | 说明 |
|--------|------|------|------|
| lane0_pkt_out_vld | 1 | Output | Lane 0 输出有效 |
| lane0_pkt_out_data | 128 | Output | Lane 0 输出数据 |
| lane1_pkt_out_vld | 1 | Output | Lane 1 输出有效 |
| lane1_pkt_out_data | 128 | Output | Lane 1 输出数据 |
| lane2_pkt_out_vld | 1 | Output | Lane 2 输出有效 |
| lane2_pkt_out_data | 128 | Output | Lane 2 输出数据 |
| lane3_pkt_out_vld | 1 | Output | Lane 3 输出有效 |
| lane3_pkt_out_data | 128 | Output | Lane 3 输出数据 |
| pkt_in_bkpr | 1 | Output | 反压信号 |

### 2.3 FE 接口 (V3)

| 信号名 | 位宽 | 方向 | 说明 |
|--------|------|------|------|
| fwd{i}_pkt_data_vld | 1 | Output | FE i 输入数据有效 |
| fwd{i}_pkt_data | 128 | Output | FE i 输入数据 |
| fwd{i}_pkt_lat | 2 | Output | FE i 延迟 |
| fwd{i}_pkt_dp_vld | 1 | Output | FE i 依赖数据有效 |
| fwd{i}_pkt_dp_data | 128 | Output | FE i 依赖数据 |
| fwded{i}_pkt_data_vld | 1 | Input | FE i 输出数据有效 |
| fwded{i}_pkt_data | 128 | Input | FE i 输出数据 |

## 3. 控制信号格式

### 3.1 ctrl[4:0] 格式

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

## 4. 报文排序规则

### 4.1 输入排序

1. **同一 cycle 内**: 按 lane0 → lane1 → lane2 → lane3 顺序
2. **不同 cycle 间**: 先输入的报文序号小

### 4.2 示例

```
Cycle 0: lane2=valid, lane3=valid
  -> seq0 (lane2), seq1 (lane3)

Cycle 1: lane0=valid, lane1=valid, lane3=valid
  -> seq2 (lane0), seq3 (lane1), seq4 (lane3)
```

## 5. 输出规则

### 5.1 保序输出

- 必须按报文序号从小到大输出
- 从 lane0 开始，按 lane0→lane1→lane2→lane3 顺序
- 支持 warp around

### 5.2 输出示例

```
假设待输出报文: seq0, seq1, seq2, seq3, seq4

Cycle N:   lane0=seq0, lane1=seq1, lane2=seq2, lane3=seq3
Cycle N+1: lane0=seq4, lane1=none, lane2=none, lane3=none

假设待输出报文: seq0, seq1, seq2

Cycle N:   lane0=seq0, lane1=seq1, lane2=seq2, lane3=none
Cycle N+1: (无输出)
```

## 6. 反压规则

- `pkt_in_bkpr=1` 时，所有 lane 的输入 valid 必须为 0
- 反压条件:
  - 输出缓冲快满
  - ROB 快满
  - FE 全部忙

## 7. FE 模块行为

### 7.1 输入

- `fwd_pkt_data_vld`: 输入数据有效
- `fwd_pkt_data[127:0]`: 输入数据
- `fwd_pkt_lat[1:0]`: 延迟 (0~3)
- `fwd_pkt_dp_vld`: 依赖数据有效
- `fwd_pkt_dp_data[127:0]`: 依赖数据

### 7.2 输出

- `fwded_pkt_data_vld`: 输出数据有效
- `fwded_pkt_data[127:0]`: 输出数据 = 输入数据 + 依赖数据 (如果 dp_vld=1)

### 7.3 时序

| lat | 延迟 |
|-----|------|
| 0 | 1 cycle |
| 1 | 2 cycles |
| 2 | 3 cycles |
| 3 | 4 cycles |

### 7.4 约束

- 同一 cycle 只能输出一个有效数据
- 如果 cycle N 输入 lat=2 的数据，cycle N+1 不能输入 lat=1 的数据

## 8. 版本差异

| 特性 | V2 | V3 |
|------|-----|-----|
| 4 lane 输入 | ✓ | ✓ |
| 报文排序 | ✓ | ✓ |
| 寄存器输出 | ✓ | ✓ |
| 保序输出 | ✓ | ✓ |
| 反压 | ✓ | ✓ |
| FE 处理 | ✗ | ✓ |
| 依赖解析 | ✗ | ✓ |
| 多 FE 并行 | ✗ | ✓ |
| ROB | ✗ | ✓ |

## 9. 测试覆盖

### 9.1 V2 测试

- [x] 单 lane 基础测试
- [x] 多 lane 并行测试
- [x] 输出保序测试
- [x] 随机压力测试

### 9.2 V3 测试 (计划中)

- [ ] FE 功能测试
- [ ] 依赖解析测试
- [ ] 反压测试
- [ ] 性能测试

## 10. 文件列表

```
fastfwd_v3/
├── README.md              # 项目说明
├── docs/
│   └── SPEC.md           # 本文件
├── rtl/
│   ├── fastfwd_v2.py     # V2 实现
│   └── fastfwd.py        # V3 实现 (框架)
├── tb/
│   └── tb_v2.py          # V2 测试平台
├── verilog/
│   └── fe.v              # FE 模块 Verilog
└── tb/
    └── test_results.log  # 测试结果
```

## 11. 作者

Kimi Claw for hengliao1972
