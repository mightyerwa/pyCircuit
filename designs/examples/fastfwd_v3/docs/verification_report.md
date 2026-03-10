# FastFWD V3.4 验证报告

## 1. Spec 需求分析

### 1.1 输入接口
| 信号 | 位宽 | 描述 |
|------|------|------|
| lane{0-3}_pkt_in_data | 128bit | 报文数据 |
| lane{0-3}_pkt_in_vld | 1bit | 数据有效 |
| lane{0-3}_pkt_in_ctrl | 5bit | ctrl[4:2]=dependency(0-7), ctrl[1:0]=latency(0-3) |

**Latency 映射**: lat=0→1cycle, lat=1→2cycle, lat=2→3cycle, lat=3→4cycle

**Dependency**: dep=0无依赖, dep=1-7表示与前1-7个报文有依赖

### 1.2 输出接口
| 信号 | 位宽 | 描述 |
|------|------|------|
| lane{0-3}_pkt_out_vld | 1bit | 输出有效 |
| lane{0-3}_pkt_out_data | 128bit | 输出数据 |
| pkt_in_bkpr | 1bit | 反压信号 |

**输出顺序规则**:
- 必须从lane0开始输出
- 支持warp around (如: cycle1输出lane0,1; cycle2输出lane2,3,0)
- 每个cycle可输出0-4个
- lane0只输出seq=0,4,8,12...; lane1只输出seq=1,5,9,13...

### 1.3 FE模块需求
- 例化数量: 0-32个(推荐4个)
- 输入: data_vld, data, lat, dp_vld, dp_data
- 输出: fwded_pkt_data_vld, fwded_pkt_data
- **关键约束**: 同一cycle只能输出一个有效数据
- **时序保证**: lat=2的数据在cycle1采样，cycle4输出有效

### 1.4 排序规则
1. 同一cycle内按lane0~lane3排序
2. 不同cycle按时间排序(先输入的编号小)
3. 依赖关系基于输入报文顺序

### 1.5 寄存器要求
所有lane input/output以及pkbr信号均需要寄存器输入输出

---

## 2. 测试覆盖分析

### 2.1 已测试功能 ✓

| 测试项 | 测试编号 | 状态 |
|--------|----------|------|
| 单包输入 | Test 1 | ✓ Pass |
| 四lane并行输入 | Test 2 | ✓ Pass |
| 顺序包输入 | Test 3 | ✓ Pass |
| Latency=0 (1cycle) | Test 4 | ✓ Pass |
| Latency=1 (2cycle) | Test 5 | ✓ Pass |
| Latency=2 (3cycle) | Test 6 | ✓ Pass |
| Latency=3 (4cycle) | Test 7 | ✓ Pass |
| 混合Latency | Test 8 | ✓ Pass |
| FE约束-相同latency | Test 9 | ✓ Pass |
| FE约束-不同latency | Test 10 | ✓ Pass |
| 依赖-dep=1 | Test 11 | ✓ Pass |
| 依赖链 | Test 12 | ✓ Pass |
| 零数据错误检测 | Test 13 | ✓ Pass |
| 反压信号 | Test 14 | ✓ Pass |
| 随机压力 | Test 15 | ✓ Pass |
| 突发压力 | Test 16 | ✓ Pass |

### 2.2 未测试/需补充功能 ⚠️

| 缺失项 | 优先级 | 说明 |
|--------|--------|------|
| 输出lane顺序验证 | 高 | 验证seq 0,4,8在lane0输出 |
| 输出warp around | 高 | 验证跨cycle输出顺序 |
| 依赖dep=2-7 | 高 | 当前只测试了dep=1 |
| 反压时输入阻塞 | 中 | 验证bkpr=1时输入是否被阻断 |
| 多FE实例约束 | 中 | 验证4个FE之间的约束 |
| 寄存器输入输出 | 中 | 验证所有IO都经过寄存器 |
| Dependency table满 | 低 | 边界条件测试 |
| ROB满 | 低 | 边界条件测试 |

---

## 3. 波形分析结果

### 3.1 功能实现验证

#### 3.1.1 输入排序 ✓
- **观察**: 同一cycle内，lane0数据先进入处理流程
- **验证**: 代码中seq_cnt按lane0~lane3顺序递增
- **状态**: 已实现

#### 3.1.2 Latency映射 ✓
- **观察**: FE模块正确实现lat=0~3对应1~4 cycle延迟
- **验证**: Test 4-7波形显示正确的延迟
- **状态**: 已实现

#### 3.1.3 FE约束检查 ✓
- **观察**: Test 9中相同latency的第二个包被延迟调度
- **验证**: constraint_ok信号控制调度
- **状态**: 已实现

#### 3.1.4 依赖解析 ✓
- **观察**: Test 11/12中dep包等待依赖完成后再处理
- **验证**: dep_found信号控制can_schedule
- **状态**: 已实现

#### 3.1.5 反压信号 ✓
- **观察**: Test 14中pkt_in_bkpr在队列满时拉高
- **验证**: pending_cnt >= 10时触发
- **状态**: 已实现

### 3.2 未充分验证的功能 ⚠️

#### 3.2.1 输出lane分配
- **Spec要求**: lane0→seq 0,4,8...; lane1→seq 1,5,9...
- **当前状态**: 未明确验证
- **风险**: 输出可能不按预期分配到对应lane

#### 3.2.2 输出warp around
- **Spec要求**: 可以从任意lane开始输出，支持wrap
- **当前状态**: 未明确验证
- **风险**: 连续cycle输出可能不按warp规则

#### 3.2.3 反压时输入阻断
- **Spec要求**: pkt_in_bkpr=1时，所有lane input valid不会拉高
- **当前状态**: 只验证了bkpr产生，未验证阻断效果
- **风险**: 反压可能只是建议而非强制

---

## 4. 补充测试用例设计

### Test 17: 输出Lane顺序验证
**目的**: 验证seq 0,4,8在lane0输出，seq 1,5,9在lane1输出
**步骤**:
1. 连续输入5个cycle，每cycle从lane0输入1个包
2. 观察输出：seq0应在lane0，seq1应在lane1...
3. 验证seq4回到lane0

### Test 18: 输出Warp Around验证
**目的**: 验证跨cycle输出支持wrap around
**步骤**:
1. cycle1: 输入2个包
2. cycle2: 输入2个包
3. 观察输出：如果cycle1输出lane0,1；cycle2应从lane2开始
4. 验证warp行为

### Test 19: 依赖Dep=2-7验证
**目的**: 验证dep=2~7的依赖关系
**步骤**:
1. 输入无依赖包(seq0)
2. 输入dep=2的包(seq2，依赖seq0)
3. 输入dep=3的包(seq3，依赖seq0)
4. 验证依赖解析正确

### Test 20: 反压阻断验证
**目的**: 验证bkpr=1时输入被强制阻断
**步骤**:
1. 触发bkpr=1(高速输入)
2. 尝试在bkpr=1时输入数据
3. 验证这些数据被丢弃或延迟
4. bkpr=0后继续输入，验证功能恢复

### Test 21: 多FE约束验证
**目的**: 验证4个FE实例之间的约束
**步骤**:
1. 同时向4个lane发送lat=0的数据
2. 验证同一cycle 4个FE不会同时输出
3. 验证调度策略

### Test 22: 寄存器IO验证
**目的**: 验证所有IO都经过寄存器
**步骤**:
1. 检查所有输出信号是否由always_ff生成
2. 验证输入到输出的延迟固定

---

## 5. 结论

### 5.1 已实现功能
- ✓ 4 lane输入/输出
- ✓ Latency注入 (1-4 cycles)
- ✓ FE约束检查
- ✓ 依赖解析 (基础)
- ✓ 反压信号生成
- ✓ 基础排序

### 5.2 需要完善
- ⚠️ 输出lane分配验证
- ⚠️ 输出warp around机制
- ⚠️ 完整依赖覆盖 (dep=2-7)
- ⚠️ 反压强制阻断
- ⚠️ 多FE调度策略

### 5.3 建议
1. **优先级1**: 补充输出lane顺序和warp around测试
2. **优先级2**: 扩展依赖测试到dep=2-7
3. **优先级3**: 完善反压机制测试
4. **优先级4**: 边界条件测试(Dependency table/ROB满)

---

*报告生成时间: 2026-03-10*  
*测试平台: Icarus Verilog + GTKWave*  
*DUT版本: FastFWD V3.4*
