# FastFwd V2 设计文档

## 一、功能概述

FastFwd 是一个 **4 车道数据包转发调度器**，类似于乱序处理器的微架构。它接收来自
4 个输入 lane 的数据包，通过 Forwarding Engine (FE) 处理后，按序从 4 个输出 lane 输出。

## 二、接口定义

### 2.1 输入端口 (4 lanes)

| 信号 | 位宽 | 描述 |
|------|------|------|
| `lane{0-3}_pkt_in_vld` | 1 | 数据有效信号 |
| `lane{0-3}_pkt_in_data` | 128 | 报文数据 |
| `lane{0-3}_pkt_in_ctrl` | 5 | 控制字段: `{dep[4:2], lat[1:0]}` |

- `ctrl[1:0]` (lat): 转发延迟。0→1拍, 1→2拍, 2→3拍, 3→4拍
- `ctrl[4:2]` (dep): 依赖关系。0=无依赖, 1~7=依赖前面第1~7个报文的处理结果

### 2.2 输出端口 (4 lanes)

| 信号 | 位宽 | 描述 |
|------|------|------|
| `lane{0-3}_pkt_out_vld` | 1 | 输出有效信号 (寄存器输出) |
| `lane{0-3}_pkt_out_data` | 128 | 处理后的报文数据 (寄存器输出) |

### 2.3 反压信号

| 信号 | 位宽 | 描述 |
|------|------|------|
| `pkt_in_bkpr` | 1 | 反压信号 (寄存器输出)。为高时上游不可发送数据 |

### 2.4 FE 接口 (4 个引擎)

| 信号 | 方向 | 位宽 | 描述 |
|------|------|------|------|
| `fwd{0-3}_pkt_data_vld` | 输出 | 1 | 发往 FE 的数据有效 |
| `fwd{0-3}_pkt_data` | 输出 | 128 | 发往 FE 的原始数据 |
| `fwd{0-3}_pkt_lat` | 输出 | 2 | 发往 FE 的延迟提示 |
| `fwd{0-3}_pkt_dp_vld` | 输出 | 1 | 依赖数据有效 |
| `fwd{0-3}_pkt_dp_data` | 输出 | 128 | 依赖数据 (前序报文的处理结果) |
| `fwded{0-3}_pkt_data_vld` | 输入 | 1 | FE 返回数据有效 |
| `fwded{0-3}_pkt_data` | 输入 | 128 | FE 返回的处理结果 |

## 三、报文排序规则

### 3.1 输入排序

- 同一周期内: 按 lane0 → lane3 排序 (lane0 序号最小)
- 不同周期: 早期周期的报文序号更小
- 仅 `vld=1` 的 lane 参与排序和编号

### 3.2 输出排序

- 严格按报文序号从小到大输出
- `lane0` 固定输出序号 0, 4, 8, 12, ...
- `lane1` 固定输出序号 1, 5, 9, 13, ...
- `lane2` 固定输出序号 2, 6, 10, 14, ...
- `lane3` 固定输出序号 3, 7, 11, 15, ...
- 每周期可输出 0~4 个报文，以 warp-around 方式轮转

## 四、微架构

```
Input Lanes → Sequencer → Issue Queues → Dispatch → FEs → ROB → Commit → Output Lanes
     (4)                    (4, by seq%4)    (4)      (4)   (4)            (4)
```

### 4.1 输入接收 (Sequencer)

- 根据输入 lane 的有效信号, 按 lane0~3 顺序为报文分配递增序列号 (seq)
- 打包为 bundle: `{seq, data, ctrl}`
- 根据 `seq % 4` 路由到对应的 Issue Queue
  - 由于同一周期最多 4 个报文, 其 seq%4 值必然互不相同, 不会冲突

### 4.2 Issue Queue (每 lane 一个 FIFO)

- 深度: Q_DEPTH (默认 16)
- 存储待调度的报文 bundle
- 每周期最多 push 1 个, pop 1 个

### 4.3 调度 (Dispatch)

每个 lane 独立调度, 尝试从 Issue Queue 头部取出报文发送到对应 FE:

**调度条件 (全部满足才可发射):**
1. Queue 非空
2. 依赖已解决 (dep=0 或在 FE旁路/ROB/历史中找到结果)
3. FE 空闲 (目标流水级无冲突)
4. ROB 范围内 (`delta < ROB_DEPTH`)

**依赖解析优先级:**
1. FE 输出旁路 (当前周期 FEOUT)
2. ROB 条目
3. 历史缓冲区

### 4.4 FE 流水线跟踪 (每引擎 5 级)

```
stage4 → stage3 → stage2 → stage1 → stage0 (输出)
```

- 每个 posedge 整体下移一级, stage0 弹出
- 新报文插入到 `stage(1 + lat)`
- 冲突检查: 对 lat=L 的报文, 检查 `stage(2+L)` 是否占用

### 4.5 ROB (每 lane 一个)

- 深度: ROB_DEPTH (默认 16)
- 按 `delta = (seq - exp_seq) >> 2` 索引
- 支持: 按 delta 插入 + 头部弹出 (commit 时)

### 4.6 提交 (Commit)

- 从 `commit_ptr` 指向的 lane 开始, 检查连续 lane 的 ROB 头部是否就绪
- 前缀提交: 连续就绪则输出, 遇到首个未就绪即停止
- 每周期最多提交 4 个报文
- 提交后:
  - 更新 `exp_seq[lane] += 4`
  - 弹出 ROB 头部
  - 写入历史缓冲区
  - 推进 `commit_ptr`

### 4.7 历史缓冲区 (全局移位寄存器)

- 深度: HIST_DEPTH (默认 8)
- 存储最近提交的报文 {seq, data}
- 用于后续报文的依赖解析
- 每次 commit 时下移 commit_count 位, 在顶部插入新条目

### 4.8 反压 (BKPR)

- 使用 shadow count 跟踪每个 Issue Queue 的占用量
- 当任意队列占用 ≥ Q_DEPTH - BKPR_SLACK 时拉高 BKPR
- BKPR 为寄存器输出, 有 1 拍延迟

## 五、FE 模型

FE 是一个 5 级流水线黑盒:
- 输入: `data`, `lat`, `dp_vld`, `dp_data`
- 输出: `fwded_data = data + (dp_vld ? dp_data : 0)`
- 延迟: `lat + 1` 拍 (在 `stage(1+lat)` 插入)
- 约束: 同一 FE 不可在同一拍产生两个有效输出

## 六、参数

| 参数 | 默认值 | 描述 |
|------|--------|------|
| Q_DEPTH | 16 | Issue Queue 深度 |
| ROB_DEPTH | 16 | ROB 深度 |
| SEQ_W | 16 | 序列号位宽 |
| HIST_DEPTH | 8 | 历史缓冲区深度 |
| BKPR_SLACK | 2 | 反压余量 |
