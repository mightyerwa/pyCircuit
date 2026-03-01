#!/usr/bin/env python3
"""
FastFWD V3 自动测试与优化脚本
持续运行，发现 bug 并优化

作者: Kimi Claw
日期: 2026-03-01
"""
import sys
import random
import time
from pathlib import Path
from datetime import datetime

# 添加路径
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent.parent))

from test_v3_complete import FastFWDReferenceModel, Packet, Logger


class AutoTester:
    """自动测试器 - 持续运行测试，记录结果"""
    
    def __init__(self):
        self.log_dir = Path(__file__).parent.parent / "logs"
        self.log_dir.mkdir(exist_ok=True)
        self.run_count = 0
        self.pass_count = 0
        self.fail_count = 0
        
    def log(self, msg: str):
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        line = f"[{timestamp}] {msg}"
        print(line)
        
        # 写入主日志
        with open(self.log_dir / "auto_test.log", "a") as f:
            f.write(line + "\n")
    
    def test_random_stress(self, duration_cycles: int = 1000) -> bool:
        """随机压力测试"""
        self.run_count += 1
        rng = random.Random(self.run_count)
        model = FastFWDReferenceModel()
        
        errors = []
        
        for c in range(duration_cycles):
            # 随机输入
            vlds = [1 if rng.random() < 0.4 else 0 for _ in range(4)]
            datas = [rng.getrandbits(128) for _ in range(4)]
            ctrls = [rng.randint(0, 31) for _ in range(4)]
            
            model.process_input(c, vlds, datas, ctrls)
            model.schedule_fe(c)  # 调度 FE
            model.complete_fe(c)  # 完成 FE
            out = model.get_output(c)  # 获取输出
            
            # 检查: 输出序号必须连续
            if out:
                expected_seq = model.stats['packets_out'] - len(out)
                for lane, data, seq in out:
                    if seq != expected_seq:
                        errors.append(f"Cycle {c}: Expected seq={expected_seq}, got seq={seq}")
                    expected_seq += 1
        
        # 排空
        for c in range(duration_cycles, duration_cycles + 100):
            model.tick(c)
            model.get_output(c)
        
        # 验证
        if model.stats['packets_in'] != model.stats['packets_out']:
            errors.append(f"In/Out mismatch: {model.stats['packets_in']} vs {model.stats['packets_out']}")
        
        if errors:
            self.fail_count += 1
            self.log(f"Run {self.run_count}: FAILED")
            for e in errors[:5]:
                self.log(f"  {e}")
            
            # 保存详细日志
            log_file = self.log_dir / f"fail_run_{self.run_count}_{datetime.now().strftime('%H%M%S')}.log"
            with open(log_file, "w") as f:
                f.write(f"Random seed: {self.run_count}\n")
                f.write(f"Errors:\n")
                for e in errors:
                    f.write(f"  {e}\n")
            return False
        else:
            self.pass_count += 1
            self.log(f"Run {self.run_count}: PASSED (in={model.stats['packets_in']}, out={model.stats['packets_out']})")
            return True
    
    def run_continuous(self, max_runs: int = 100):
        """持续运行测试"""
        self.log("="*60)
        self.log("FastFWD V3 Auto Tester Started")
        self.log("="*60)
        
        for i in range(max_runs):
            self.test_random_stress(500)
            time.sleep(0.1)  # 避免 CPU 占用过高
        
        self.log("="*60)
        self.log(f"Completed: {self.run_count} runs, {self.pass_count} passed, {self.fail_count} failed")
        self.log("="*60)


if __name__ == "__main__":
    tester = AutoTester()
    tester.run_continuous(50)
