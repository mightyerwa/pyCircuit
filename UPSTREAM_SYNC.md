# pyCircuit 上游更新追踪记录

**记录时间**: 2026-03-01  
**本地仓库**: mightyerwa/pyCircuit  
**上游仓库**: https://github.com/LinxISA/pyCircuit (修正)

⚠️ **重要更正**: 上游是 LinxISA/pyCircuit，不是 hengliao1972/pyCircuit

---

## 同步状态

| 项目 | 状态 |
|------|------|
| 上游地址 | ✅ 已更正为 LinxISA/pyCircuit |
| fetch 权限 | ⚠️ 需要 GitHub Token 或 SSH |
| 本地分支 | main |
| 远程分支 | origin/main |

---

## 手动同步指南

由于服务器无法直接访问 GitHub 进行 fetch，请按以下步骤手动同步：

### 方法 1: 本地手动同步 (推荐)

在你的本地机器上执行：

```bash
# 1. 克隆你的仓库
git clone git@github.com:mightyerwa/pyCircuit.git
cd pyCircuit

# 2. 添加 upstream
git remote add upstream https://github.com/LinxISA/pyCircuit.git

# 3. 获取上游更新
git fetch upstream main

# 4. 查看差异
git log HEAD..upstream/main --oneline

# 5. 创建合并分支
git checkout -b sync-upstream

# 6. 合并上游更新
git merge upstream/main

# 7. 处理冲突 (如果有)
# - 保留 fastfwd_v3/ 目录
# - 保留我们的测试文件
# - 接受上游的新文件

# 8. 验证测试
python designs/examples/fastfwd_v3/tb/comprehensive_test.py

# 9. 推送
git checkout main
git merge sync-upstream
git push origin main
```

### 方法 2: GitHub Web 界面同步

1. 打开 https://github.com/mightyerwa/pyCircuit
2. 点击 "Sync fork" 按钮 (如果有)
3. 或者创建 Pull Request 从 LinxISA/pyCircuit 合并到 mightyerwa/pyCircuit

---

## 上游关键更新 (LinxISA/pyCircuit)

### 提交 4c5fc6d - hierarchical.py (重要)
**功能**: 模块/规格推断能力

**可能用途**:
- FastFWD V3 的模块层次化设计
- 自动规格推断
- 简化复杂模块定义

**建议**: 合并后研究是否可用于 V3 实现

### 其他更新
- 文档结构整理 (doc/ → docs/)
- CI 改进
- 仿真增强

---

## 本地项目状态

### FastFWD V3 (已推送)

```
designs/examples/fastfwd_v3/
├── README.md                 ✅
├── docs/SPEC.md             ✅
├── rtl/
│   ├── fastfwd_v2.py       ✅
│   ├── fastfwd_v2_1.py     ✅ MLIR 编译成功
│   └── fastfwd_v3.py       ✅ 框架
├── tb/
│   ├── comprehensive_test.py  ✅ 10/10 通过
│   └── *.log               ✅
├── mlir/fastfwd_v2_1.mlir  ✅
└── verilog/fe.v            ✅
```

### 测试状态
- ✅ 10/10 测试通过
- ✅ MLIR 生成成功
- ⚠️ V3 完整实现待开发

---

## 下一步行动

### 立即执行 (手动)
1. **同步上游** - 使用上述方法 1 或 2
2. **检查 hierarchical.py** - 评估对 V3 的帮助
3. **解决冲突** - 如有冲突，保留 FastFWD 项目

### 完成后
1. **通知我** - 同步完成后告诉我
2. **继续 V3** - 基于最新代码开发 V3 完整实现
3. **生成 Verilog** - 使用 pycc 生成 Verilog 代码

---

## hierarchical.py 预览 (待获取)

需要获取后分析的内容：
- 模块层次化定义 API
- 规格推断功能
- 是否可用于 FastFWD FE 调度器

---

*最后更新: 2026-03-01*  
*维护者: Kimi Claw*
