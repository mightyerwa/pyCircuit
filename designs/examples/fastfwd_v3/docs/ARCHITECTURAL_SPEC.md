# FastFWD V3.4 架构设计规格书 (Architectural Specification)

**文档版本**: 1.0  
**日期**: 2026-03-12  
**作者**: Kimi Claw (Architect)  
**状态**: Production Ready

---

## 1. 概述 (Overview)

### 1.1 设计目标

FastFWD V3.4 是一款高性能报文转发加速器 (Packet Forwarding Accelerator)，专为网络处理单元 (NPU) 和智能网卡 (SmartNIC) 设计。其核心目标是：

- **高吞吐**: 支持 4 路并行报文处理
- **低延迟**: 最小 4 cycles 端到端延迟
- **保序输出**: 严格按报文序号顺序输出
- **依赖解析**: 支持报文间数据依赖 (1-7 hops)
- **灵活调度**: 支持 1-4 cycles 可配置处理延迟

### 1.2 典型应用场景

```
┌─────────────────────────────────────────────────────────────┐
│                    SmartNIC / NPU                           │
│  ┌──────────┐    ┌──────────┐    ┌──────────┐              │
│  │  Packet  │───▶│  FastFWD │───▶│  Output  │              │
│  │  Parser  │    │   V3.4   │    │  Queue   │              │
│  └──────────┘    └──────────┘    └──────────┘              │
│                        │                                    │
│                   ┌────┴────┐                               │
│                   │   FE    │  x4 (Forwarding Engines)       │
│                   └─────────┘                               │
└─────────────────────────────────────────────────────────────┘
```

### 1.3 关键特性

| 特性 | 规格 |
|------|------|
| 数据宽度 | 128-bit (可配置) |
| 输入通道 | 4 lanes |
| 输出通道 | 4 lanes |
| FE 数量 | 4 个并行 FE |
| 延迟范围 | 1-4 cycles (lat=0~3) |
| 依赖深度 | 1-7 packets (dep=1~7) |
| ROB 深度 | 32 entries |
| 建议频率 | 200-300 MHz |
| 面积 (28nm) | ~80,000 μm² (~55K 门) |

---

## 2. 架构设计 (Architecture)

### 2.1 顶层架构图

```
                              FastFWD V3.4 Top Level
┌──────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│  ┌──────────────────────────────────────────────────────────────────────┐   │
│  │                     fastfwd_v3_4_core                                 │   │
│  │  ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐          │   │
│  │  │ Input    │──▶│   FE     │──▶│    DE    │──▶│  Output  │          │   │
│  │  │ Collector│   │Scheduler │   │Resolver  │   │ Scheduler│          │   │
│  │  └──────────┘   └──────────┘   └──────────┘   └──────────┘          │   │
│  │        │              │              │              │               │   │
│  │        ▼              ▼              ▼              ▼               │   │
│  │  ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐          │   │
│  │  │   FE0    │◀──│   FE1    │◀──│   FE2    │◀──│   FE3    │          │   │
│  │  │  Input   │   │  Input   │   │  Input   │   │  Input   │          │   │
│  │  └──────────┘   └──────────┘   └──────────┘   └──────────┘          │   │
│  │        │              │              │              │               │   │
│  │        └──────────────┴──────────────┴──────────────┘               │   │
│  │                              │                                       │   │
│  │                              ▼                                       │   │
│  │                        ┌──────────┐                                  │   │
│  │                        │   ROB    │ (Reorder Buffer)                │   │
│  │                        │ 32-entry │                                  │   │
│  │                        └──────────┘                                  │   │
│  └──────────────────────────────────────────────────────────────────────┘   │
│                              │                                               │
│  ┌───────────────────────────┼───────────────────────────┐                  │
│  │                           ▼                           │                  │
│  │  ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐             │
│  │  │  FE 0   │    │  FE 1   │    │  FE 2   │    │  FE 3   │             │
│  │  │ Module  │    │ Module  │    │ Module  │    │ Module  │             │
│  │  └─────────┘    └─────────┘    └─────────┘    └─────────┘             │
│  └──────────────────────────────────────────────────────────┘              │
└──────────────────────────────────────────────────────────────────────────────┘
```

### 2.2 模块划分

| 模块 | 功能 | 关键设计点 |
|------|------|-----------|
| **Input Collector** | 收集 4 路输入，分配 seq | Round-robin 仲裁 |
| **FE Scheduler** | 调度报文到空闲 FE | 优先级编码器，约束检查 |
| **Dependency Resolver** | 解析报文依赖关系 | 8-entry CAM 查找表 |
| **ROB** | 重排序缓冲，保序输出 | 32-entry，warp-around |
| **Output Scheduler** | 按序输出到 4 lanes | seq 匹配，lane 分配 |
| **Backpressure** | 反压控制 | 阈值检测 |
| **FE Module** | 报文处理 (外部) | lat-cycle 延迟，异或运算 |

### 2.3 数据通路

```
Cycle 0: Input ──▶ Input Collector ──▶ (分配 seq)
Cycle 1: FE Scheduler ──▶ Dependency Check ──▶ FE Input
Cycle 2-5: FE Processing (lat=0~3)
Cycle 3-6: FE Output ──▶ ROB Write
Cycle 4-7: ROB Read ──▶ Output Scheduler ──▶ Output
```

---

## 3. 接口定义 (Interface Specification)

### 3.1 顶层接口

```verilog
module fastfwd_v3_4 (
  input              clk,           // 时钟
  input              rst,           // 复位 (高有效)
  
  // 输入接口 (4 lanes)
  input  [3:0]       lane_pkt_in_vld,
  input  [127:0]     lane0_pkt_in_data,
  input  [127:0]     lane1_pkt_in_data,
  input  [127:0]     lane2_pkt_in_data,
  input  [127:0]     lane3_pkt_in_data,
  input  [4:0]       lane0_pkt_in_ctrl,
  input  [4:0]       lane1_pkt_in_ctrl,
  input  [4:0]       lane2_pkt_in_ctrl,
  input  [4:0]       lane3_pkt_in_ctrl,
  
  // 输出接口 (4 lanes)
  output [3:0]       lane_pkt_out_vld,
  output [127:0]     lane0_pkt_out_data,
  output [127:0]     lane1_pkt_out_data,
  output [127:0]     lane2_pkt_out_data,
  output [127:0]     lane3_pkt_out_data,
  
  // 反压信号
  output             pkt_in_bkpr
);
```

### 3.2 控制信号编码

```
ctrl[4:0] = {dep[2:0], lat[1:0]}

lat[1:0] - FE 处理延迟 (cycles):
  2'b00: 1 cycle (lat=0)
  2'b01: 2 cycles (lat=1)
  2'b10: 3 cycles (lat=2)
  2'b11: 4 cycles (lat=3)

dep[2:0] - 依赖偏移 (packets):
  3'b000: 无依赖
  3'b001: 依赖前面第 1 个报文
  3'b010: 依赖前面第 2 个报文
  ...
  3'b111: 依赖前面第 7 个报文
```

### 3.3 FE 模块接口

```verilog
module FE (
  input              clk,
  input              rst_n,         // 低有效复位
  
  // 输入 (来自 Core)
  input              fwd_pkt_data_vld,
  input      [127:0] fwd_pkt_data,
  input      [1:0]   fwd_pkt_lat,   // 延迟配置
  input              fwd_pkt_dp_vld,// 依赖数据有效
  input      [127:0] fwd_pkt_dp_data,// 依赖数据
  
  // 输出 (到 Core)
  output             fwded_pkt_data_vld,
  output     [127:0] fwded_pkt_data
);
```

**FE 功能**: `fwded_pkt_data = fwd_pkt_data ^ fwd_pkt_dp_data`  
**延迟**: `lat + 1` cycles

---

## 4. 功能规格 (Functional Specification)

### 4.1 报文生命周期

```
┌────────┬────────┬────────┬────────┬────────┬────────┬────────┐
│ Cycle  │   0    │   1    │   2    │   3    │   4    │   5    │
├────────┼────────┼────────┼────────┼────────┼────────┼────────┤
│ Input  │  In    │        │        │        │        │        │
│ Collect│        │        │        │        │        │        │
├────────┼────────┼────────┼────────┼────────┼────────┼────────┤
│ FE     │        │Sched   │ FE0    │ FE0    │ FE0    │        │
│ Process│        │        │(lat=2) │        │ Done   │        │
├────────┼────────┼────────┼────────┼────────┼────────┼────────┤
│ ROB    │        │        │        │        │ Write  │        │
├────────┼────────┼────────┼────────┼────────┼────────┼────────┤
│ Output │        │        │        │        │        │ Out    │
└────────┴────────┴────────┴────────┴────────┴────────┴────────┘
```

### 4.2 FE 调度约束

**核心约束**: `finish_cycle > last_finish`

```
finish_cycle = input_cycle + lat + 1

例:
  Cycle 1: lat=2 → finish=4
  Cycle 2: lat=1 → finish=4 (冲突！不能调度)
  Cycle 2: lat=0 → finish=3 (可以)
  Cycle 2: lat=2 → finish=5 (可以)
```

**目的**: 防止 FE 输出冲突，确保每个 cycle 只有一个 FE 完成。

### 4.3 依赖解析

```
报文 N 依赖报文 N-dep:
  - 检查 dep_table[N-dep] 是否有效
  - 有效: 读取 dep_data 作为 FE 输入
  - 无效: 阻塞调度，等待依赖完成

dep_table 结构 (8-entry CAM):
  - entry[i].valid: 是否有效
  - entry[i].seq: 报文序号
  - entry[i].data: 报文数据
```

### 4.4 ROB 操作

```
Write (来自 FE):
  - 找到空闲 entry
  - 写入 {seq, data, valid=1}

Read (到 Output):
  - 按 seq 顺序检查
  - seq == expected_seq 且 valid==1: 输出
  - 否则: 等待

Warp Around:
  - lane0: seq 0, 4, 8, 12...
  - lane1: seq 1, 5, 9, 13...
  - lane2: seq 2, 6, 10, 14...
  - lane3: seq 3, 7, 11, 15...
```

### 4.5 反压机制

```
pkt_in_bkpr = (ROB 占用 > threshold) |
              (Input FIFO 快满) |
              (依赖表满)

threshold 建议值: ROB 容量的 75% (24/32)
```

---

## 5. 验证策略 (Verification Strategy)

### 5.1 验证层次

```
Level 1: Unit Test (模块级)
  - Input Collector
  - FE Scheduler
  - Dependency Resolver
  - ROB
  - Output Scheduler

Level 2: Integration Test (子系统级)
  - Core + FE
  - Full Pipeline

Level 3: System Test (系统级)
  - Random Stress
  - Corner Cases
  - Performance
```

### 5.2 测试用例分类

| 类别 | 测试项 | 目的 |
|------|--------|------|
| **基础功能** | 单包通过 | 验证基本通路 |
| | 多路并行 | 验证 4 lane 同时工作 |
| | 依赖解析 | 验证 dep 功能 |
| **时序约束** | lat=2→lat=1 | 验证 FE 约束 |
| | 混合延迟 | 验证复杂调度 |
| **边界条件** | ROB 满 | 验证反压 |
| | 依赖链 >7 | 验证最大支持 |
| | Seq 回绕 | 验证 warp-around |
| **压力测试** | 1000+ cycles | 验证稳定性 |
| | 随机注入 | 验证鲁棒性 |

### 5.3 参考模型

```python
class Packet:
    seq: int          # 全局序号
    lane: int         # 输入 lane
    data: int         # 128-bit 数据
    ctrl: int         # 5-bit 控制
    lat: int          # FE 延迟
    dep: int          # 依赖偏移
    cycle_in: int     # 输入 cycle
    cycle_out: int    # 输出 cycle

class ReferenceModel:
    def schedule_fe(self, packet):
        # 精确模拟 FE 调度约束
        
    def resolve_dep(self, packet):
        # 精确模拟依赖解析
        
    def rob_output(self):
        # 精确模拟 ROB 保序输出
```

### 5.4 覆盖率目标

| 类型 | 目标 | 方法 |
|------|------|------|
| 代码覆盖率 | >95% | 行覆盖 + 分支覆盖 |
| 功能覆盖率 | 100% | 所有控制组合 |
| 断言覆盖 | 关键路径 | SVA 断言 |

---

## 6. 集成指南 (Integration Guide)

### 6.1 与前端模块集成

```
Packet Parser ──▶ FastFWD ──▶ Output Queue
     │                              │
     └─ 提取 metadata              └─ 按序输出到网络
```

**前端要求**:
- 提供有效的 `pkt_in_vld` 和 `pkt_in_data`
- 处理 `pkt_in_bkpr` 反压信号
- 生成正确的 `ctrl` 信号 (dep + lat)

### 6.2 与 FE 集成

```
FastFWD Core ──▶ FE Instance x4 ──▶ FastFWD Core
```

**FE 要求**:
- 实现规定的接口
- 满足 lat+1 cycles 延迟
- 支持数据异或操作
- 正确处理 rst_n (低有效)

### 6.3 与后端模块集成

```
FastFWD ──▶ Packet Modifier ──▶ Checksum Engine ──▶ TX
```

**后端要求**:
- 采样 `pkt_out_vld` 判断有效输出
- 根据 `lane` 分发到不同队列

### 6.4 时钟复位要求

```
Clock:
  - 频率: 200-300 MHz (建议)
  - 占空比: 50%
  - 抖动: <100ps

Reset:
  - 高有效 (rst)
  - 最小脉宽: 5 cycles
  - 同步释放
```

---

## 7. 性能规格 (Performance Specification)

### 7.1 吞吐能力

| 场景 | 吞吐 | 说明 |
|------|------|------|
| 理想情况 | 4 pkt/cycle | 无依赖，lat=0 |
| 典型情况 | 2-3 pkt/cycle | 有依赖，混合 lat |
| 最坏情况 | 1 pkt/cycle | 长依赖链 |

### 7.2 延迟规格

| 类型 | 最小 | 典型 | 最大 |
|------|------|------|------|
| FE 处理 | 1 cycle | 2-3 cycles | 4 cycles |
| 端到端 | 4 cycles | 6-8 cycles | 10+ cycles |

**延迟计算公式**:
```
Total_Latency = 3 (pipeline) + lat + dep_wait
```

### 7.3 资源占用

| 资源类型 | 数量 | 备注 |
|----------|------|------|
| DFF | 6,113 | 含使能和复位 |
| MUX | 11,897 | 主要逻辑 |
| 逻辑门 | ~21K | AND/OR/XOR等 |
| 总面积 | ~80K μm² | 28nm 工艺 |

---

## 8. 调试与诊断 (Debug & Diagnostics)

### 8.1 关键观测信号

```verilog
// 内部状态 (可用于调试)
wire [15:0] current_seq;      // 当前分配序号
wire [15:0] cycle_cnt;        // 全局周期计数
wire [3:0]  fe_busy;          // FE 忙碌状态
wire [31:0] rob_occupancy;    // ROB 占用位图
wire [7:0]  dep_table_valid;  // 依赖表有效位
```

### 8.2 常见问题排查

| 现象 | 可能原因 | 排查方法 |
|------|----------|----------|
| 输出乱序 | ROB 逻辑错误 | 检查 seq 匹配逻辑 |
| 吞吐量低 | FE 约束过严 | 检查 finish_cycle 计算 |
| 依赖错误 | dep_table 更新问题 | 检查 write/read 时序 |
| 反压持续 | 后端阻塞 | 检查 output scheduler |

### 8.3 断言检查点

```systemverilog
// FE 约束检查
assert property (@(posedge clk) 
  $rose(fwded_vld[i]) |-> ##1 !fe_constraint_violation);

// 保序输出检查
assert property (@(posedge clk) 
  lane_out_vld |-> out_seq == expected_seq);

// 无丢包检查
assert property (@(posedge clk) 
  ##100 pkt_in_vld |-> ##[4:20] pkt_out_vld);
```

---

## 9. 版本历史 (Revision History)

| 版本 | 日期 | 变更 | 作者 |
|------|------|------|------|
| 1.0 | 2026-03-12 | 初始版本 | Kimi Claw |

---

## 10. 附录 (Appendix)

### 10.1 术语表

| 术语 | 说明 |
|------|------|
| FE | Forwarding Engine，转发引擎 |
| ROB | Reorder Buffer，重排序缓冲 |
| lat | Latency，处理延迟 |
| dep | Dependency，依赖偏移 |
| seq | Sequence number，报文序号 |
| bkpr | Backpressure，反压 |

### 10.2 参考资料

- `docs/PERFORMANCE_ANALYSIS.md` - 性能分析报告
- `docs/TIMING_DIAGRAMS.md` - 时序图
- `tb/comprehensive_test.py` - 综合测试
- `verilog_auto/synth.ys` - Yosys 综合脚本

---

**文档结束**

*本规格书由架构师编写，供设计、验证、集成团队参考使用。*
