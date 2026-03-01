# pyCircuit 上游更新追踪记录

**记录时间**: 2026-03-01  
**本地仓库**: mightyerwa/pyCircuit  
**上游仓库**: hengliao1972/pyCircuit

---

## 同步状态

| 项目 | 状态 |
|------|------|
| 上游最新提交 | 83f0cdf (2026-02-25) |
| 本地最新提交 | 8abd1f5 (2026-03-01) |
| 同步状态 | ⚠️ 本地领先上游，需要合并上游更新 |

---

## 上游最新更新 (2026-02-25)

### 提交 1: 83f0cdf - examples/fm16: sync fm16 updates
**时间**: 2026-02-25  
**作者**: Cursor Agent  
**内容**: 
- 同步 fm16 示例更新
- 更新 sw5809s.py

### 提交 2: a7615e8 - Merge PR #6: Enhanced simulation/verification
**时间**: 2026-02-25  
**内容**:
- 增强 pyCircuit 仿真/验证能力

### 提交 3: 4c5fc6d - refactor: clean up repo and add hierarchical module support
**时间**: 2026-02-24  
**作者**: RuoyuZhou  
**重要更改**:
- ✅ 移除冗余 doc/ 文件夹，合并到 docs/
- ✅ 中文教程移动到 docs/
- ✅ 添加 mkdocs.yml 文档生成
- ✅ 改进 README 开源结构
- ✅ 增强 pyproject.toml 依赖
- ✅ 更新 CONTRIBUTING.md
- ✅ 改进 CI 工作流
- ✅ **新增 hierarchical.py - 模块/规格推断能力**
- ✅ 添加 LinxISA 引用
- ✅ 清理 .gitignore

### 提交 4: 92452bf - linx: default QEMU_BIN to in-tree build
**时间**: 2026-02-24  
**内容**:
- QEMU_BIN 默认使用树内构建

### 提交 5: 603e6ca - Merge PR #22: v0.3 submodule sync
**时间**: 2026-02-22  
**内容**:
- v0.3 子模块同步 (tools-pycircuit)

---

## 关键变化分析

### 对 FastFWD 项目的影响

| 变化 | 影响 | 行动 |
|------|------|------|
| doc/ → docs/ | 无冲突 | 我们的 SPEC.md 在正确位置 |
| hierarchical.py | 有益 | 可能用于 V3 模块推断 |
| .gitignore 清理 | 需检查 | 确认 fastfwd_v3 未被忽略 |
| CI 改进 | 有益 | 可能改进测试流程 |

### 需要合并的更新

```bash
# 上游最新: 83f0cdf (2026-02-25)
# 本地基于: 23857f9 (Merge PR #26, 早于上游)

# 需要合并的提交:
# - 83f0cdf: fm16 updates
# - a7615e8: Enhanced simulation
# - 4c5fc6d: Hierarchical module support (重要)
# - 92452bf: QEMU_BIN default
# - 603e6ca: v0.3 sync
```

---

## 本地新增内容

### FastFWD V3 项目

```
designs/examples/fastfwd_v3/
├── README.md
├── docs/SPEC.md
├── rtl/fastfwd_v2.py
├── rtl/fastfwd_v2_1.py      ✅ MLIR 编译成功
├── rtl/fastfwd_v3.py
├── tb/tb_v2.py
├── tb/comprehensive_test.py  ✅ 10/10 测试通过
├── tb/test_simple.py
├── tb/*.log
├── mlir/fastfwd_v2_1.mlir
└── verilog/fe.v
```

### 新增根目录文件

- `UPSTREAM_SYNC.md` - 本文件

---

## 合并计划

### 步骤 1: 获取上游更新
```bash
git fetch upstream main
git log HEAD..upstream/main --oneline
```

### 步骤 2: 创建合并分支
```bash
git checkout -b sync-upstream
git merge upstream/main
```

### 步骤 3: 处理冲突 (如果有)
- 保留 fastfwd_v3/ 目录
- 保留我们的测试文件
- 接受上游的 hierarchical.py
- 接受上游的 CI 改进

### 步骤 4: 验证
```bash
# 重新运行测试
python designs/examples/fastfwd_v3/tb/comprehensive_test.py

# 重新生成 MLIR
python designs/examples/fastfwd_v3/rtl/fastfwd_v2_1.py
```

### 步骤 5: 推送
```bash
git checkout main
git merge sync-upstream
git push origin main
```

---

## 重要发现

### hierarchical.py (新增)
上游新增的 hierarchical.py 可能包含模块推断功能，对 V3 开发有益：
- 模块/规格推断能力
- 可能简化 FastFWD 的模块设计

### .gitignore 清理
上游清理了 .gitignore，需要确认：
- designs/examples/ 是否仍被忽略？
- 我们的 fastfwd_v3 是否需要 -f 强制添加？

---

## 下一步行动

1. **执行合并** - 按上述计划合并上游更新
2. **解决冲突** - 如有冲突，保留 FastFWD 项目
3. **重新验证** - 确保测试和 MLIR 生成仍正常
4. **更新文档** - 记录合并后的状态

---

*最后更新: 2026-03-01*  
*维护者: Kimi Claw*
