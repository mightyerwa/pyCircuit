# FastFWD V3 时序图

## 1. 基本时序 - 无依赖、无延迟 (lat=0)

```
Cycle:    0      1      2      3      4      5
          │      │      │      │      │      │
          ▼      ▼      ▼      ▼      ▼      ▼

Input:
lane0_vld  ████
lane0_data ════D0════

lane1_vld       ████
lane1_data      ════D1════

lane2_vld            ████
lane2_data           ════D2════

lane3_vld                 ████
lane3_data                ════D3════

FE Input:
fwd0_vld   ────████
fwd0_data  ────D0────
           (lat=0, 1 cycle)

fwd1_vld        ────████
fwd1_data       ────D1────
                (lat=0, 1 cycle)

fwd2_vld             ────████
fwd2_data            ────D2────
                     (lat=0, 1 cycle)

fwd3_vld                  ────████
fwd3_data                 ────D3────
                          (lat=0, 1 cycle)

FE Output:
fwded0_vld      ████
fwded0_data     ════D0════
                (cycle 1: lat=0, output ready)

fwded1_vld           ████
fwded1_data          ════D1════

fwded2_vld                ████
fwded2_data               ════D2════

fwded3_vld                     ████
fwded3_data                    ════D3════

Output:
lane0_out_vld   ────████
lane0_out_data  ────D0════
                (seq=0, lane0)

lane1_out_vld        ────████
lane1_out_data       ────D1════
                     (seq=1, lane1)

lane2_out_vld             ────████
lane2_out_data            ────D2════
                          (seq=2, lane2)

lane3_out_vld                  ────████
lane3_out_data                 ────D3════
                               (seq=3, lane3)

Legend:
████ = 信号有效 (高电平)
════ = 数据传输
──── = 信号无效 (低电平)
```

## 2. 延迟时序 - lat=2 (3 cycles)

```
Cycle:    0      1      2      3      4      5      6
          │      │      │      │      │      │      │
          ▼      ▼      ▼      ▼      ▼      ▼      ▼

Input:
lane0_vld  ████
lane0_data ════D0════
ctrl[1:0]=2 (lat=2, 3 cycles)

FE Input:
fwd0_vld   ────████
fwd0_data  ────D0════
fwd0_lat   ───═2═
           (lat=2)

FE Internal:
Stage0     ────────────────████
Stage1     ────────████
Stage2     ────████
Input      ████
           (3 stage pipeline)

FE Output:
fwded0_vld                ████
fwded0_data               ════D0════
                          (cycle 3: lat=2, 1+2=3 cycles later)

Output:
lane0_out_vld             ────████
lane0_out_data            ────D0════
```

## 3. 依赖时序 - dep=1 (依赖前一个报文)

```
Cycle:    0      1      2      3      4      5      6      7
          │      │      │      │      │      │      │      │
          ▼      ▼      ▼      ▼      ▼      ▼      ▼      ▼

Input:
lane0_vld  ████
lane0_data ════A════     (seq=0, dep=0)

lane1_vld       ████
lane1_data      ════B════ (seq=1, dep=1, depends on seq=0)
ctrl[4:2]=1

Dependency Resolution:
seq=0 result stored ────R0────
                      (A after FE processing)

FE Input 0 (seq=0):
fwd0_vld   ────████
fwd0_data  ────A════
fwd0_dp_vld────0      (no dependency)

FE Output 0:
fwded0_vld      ████
fwded0_data     ════R0════ (Result of A)

FE Input 1 (seq=1):
fwd1_vld        ────████
fwd1_data       ────B════
fwd1_dp_vld     ────1      (has dependency)
fwd1_dp_data    ────R0════ (data from seq=0)
                (dp_data = result of previous packet)

FE Output 1:
fwded1_vld           ████
fwded1_data          ════R1════ (B + R0)

Output:
lane0_out_vld   ────████
lane0_out_data  ────R0════ (seq=0)

lane1_out_vld        ────████
lane1_out_data       ────R1════ (seq=1, includes dependency)
```

## 4. FE 调度约束时序

```
Cycle:    0      1      2      3      4      5
          │      │      │      │      │      │
          ▼      ▼      ▼      ▼      ▼      ▼

Constraint Violation Example (WRONG):
lane0_vld  ████
ctrl       lat=2

lane1_vld       ████
ctrl            lat=1  ← VIOLATION! lat=2 followed by lat=1

Result: Unstable output, timing conflict in FE pipeline

Correct Scheduling:
lane0_vld  ████
ctrl       lat=2

lane1_vld            ████
ctrl                 lat=1  ← OK! Gap of 1 cycle

Or:
lane0_vld  ████
ctrl       lat=2

lane1_vld       ████
ctrl            lat=0 or lat=2 or lat=3  ← OK! Different latencies
```

## 5. 完整时序 - 4 Lane 并行输入

```
Cycle:    0      1      2      3      4      5      6      7      8
          │      │      │      │      │      │      │      │      │
          ▼      ▼      ▼      ▼      ▼      ▼      ▼      ▼      ▼

Input (Cycle 0):
lane2_vld  ████
lane2_data ════D0════ (seq=0, lat=0)

lane3_vld  ████
lane3_data ════D1════ (seq=1, lat=1)

Input (Cycle 1):
lane0_vld       ████
lane0_data      ════D2════ (seq=2, lat=0, dep=0)

lane1_vld       ████
lane1_data      ════D3════ (seq=3, lat=2, dep=2)

lane3_vld       ████
lane3_data      ════D4════ (seq=4, lat=0, dep=0)

Sequence Assignment:
Cycle 0: lane2=seq0, lane3=seq1
Cycle 1: lane0=seq2, lane1=seq3, lane3=seq4

FE Processing:
seq0(lat=0) → ready at cycle 1
seq1(lat=1) → ready at cycle 2
seq2(lat=0) → ready at cycle 2
seq3(lat=2) → ready at cycle 3 (depends on seq1)
seq4(lat=0) → ready at cycle 2

ROB (Reorder Buffer):
Cycle 1: seq0 ready
Cycle 2: seq1, seq2, seq4 ready (seq3 waiting for dep)
Cycle 3: seq3 ready

Output (in-order):
Cycle 2: lane0=seq0, lane1=seq1, lane2=seq2, lane3=seq3? No!
         lane0=seq0, lane1=seq1, lane2=seq2, lane3=none (seq3 not ready)

Cycle 3: lane0=seq3, lane1=seq4, lane2=none, lane3=none

Warp Around:
Cycle 2: out_ptr=0 → output to lane0,1,2
Cycle 3: out_ptr=3 → output to lane3,0,1
```

## 6. 反压时序

```
Cycle:    10     11     12     13     14     15
          │      │      │      │      │      │
          ▼      ▼      ▼      ▼      ▼      ▼

ROB State:
Count    ████████████████████████████████████ (almost full)

Backpressure:
pkt_in_bkpr                    ████████████████
                               (ROB almost full)

Input Response:
lane0_vld  ████    ████    ────    ────    ████
lane1_vld  ████    ████    ────    ────    ████
           (cycles 12-13: bkpr=1, no input accepted)

Drain:
Output   ────    ────    ████    ████    ████
         (cycles 12-13: draining ROB)

ROB Count ████████████████████    ████████    ████    (decreasing)

Release:
pkt_in_bkpr                    ████    ────    ────
                               (ROB has space again)

Input Resume:
lane0_vld                              ████    ████
```

## 7. 关键时序参数

| 参数 | 值 | 说明 |
|------|-----|------|
| Input to FE | 0 cycle | 组合逻辑 |
| FE latency | 1-4 cycles | lat=0:1, lat=1:2, lat=2:3, lat=3:4 |
| FE to ROB | 0 cycle | 组合逻辑 |
| ROB to Output | 1 cycle | 寄存器输出 |
| Total latency | 2-5 cycles | 输入到输出 |
| Backpressure response | 1 cycle | 检测到满到产生 bkpr |

## 8. 时序检查清单

- [ ] 输入按 lane0→lane3 顺序分配序号
- [ ] FE 延迟符合 lat 设置
- [ ] FE 调度满足约束 (lat=2 后不接 lat=1)
- [ ] 依赖数据在报文进入 FE 前准备好
- [ ] ROB 按 seq 顺序输出
- [ ] 输出从 lane0 开始 warp around
- [ ] 反压在 ROB 满前产生
- [ ] 所有输出是寄存器输出
