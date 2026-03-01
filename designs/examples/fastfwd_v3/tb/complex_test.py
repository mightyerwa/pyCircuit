"""
FastFWD V3 复杂场景测试
测试各种边界条件和时序场景
"""
import sys
import random
from pathlib import Path
from datetime import datetime

sys.path.insert(0, str(Path(__file__).parent))

from test_v3_complete import FastFWDReferenceModel


class ComplexTestRunner:
    """复杂场景测试运行器"""
    
    def __init__(self):
        self.log_file = Path(__file__).parent.parent / "logs" / f"complex_test_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"
        self.log_file.parent.mkdir(exist_ok=True)
        self.lines = []
        
    def log(self, msg: str):
        timestamp = datetime.now().strftime("%H:%M:%S")
        line = f"[{timestamp}] {msg}"
        self.lines.append(line)
        print(line)
        
    def save(self):
        with open(self.log_file, "w") as f:
            f.write("\n".join(self.lines))
        print(f"\nLog saved: {self.log_file}")
    
    def test_burst_input(self):
        """突发输入测试 - 连续多个 cycle 满负荷输入"""
        self.log("\n=== Test: Burst Input ===")
        model = FastFWDReferenceModel()
        
        # 连续 10 个 cycle，每 cycle 4 个输入
        for c in range(10):
            model.process_input(c, [1,1,1,1], [c*4+0, c*4+1, c*4+2, c*4+3], [0,0,0,0])
            model.schedule_fe(c)
            model.complete_fe(c)
            out = model.get_output(c)
            if out:
                self.log(f"Cycle {c}: Output {len(out)} packets")
        
        # 排空
        for c in range(10, 20):
            model.schedule_fe(c)
            model.complete_fe(c)
            out = model.get_output(c)
        
        self.log(f"Total: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
        return model.stats['packets_in'] == model.stats['packets_out']
    
    def test_sparse_input(self):
        """稀疏输入测试 - 随机间隔输入"""
        self.log("\n=== Test: Sparse Input ===")
        model = FastFWDReferenceModel()
        rng = random.Random(42)
        
        for c in range(100):
            if rng.random() < 0.3:  # 30% 概率有输入
                vlds = [1 if rng.random() < 0.5 else 0 for _ in range(4)]
                datas = [rng.getrandbits(128) for _ in range(4)]
                model.process_input(c, vlds, datas, [0,0,0,0])
            
            model.schedule_fe(c)
            model.complete_fe(c)
            model.get_output(c)
        
        # 排空
        for c in range(100, 120):
            model.schedule_fe(c)
            model.complete_fe(c)
            model.get_output(c)
        
        self.log(f"Total: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
        return model.stats['packets_in'] == model.stats['packets_out']
    
    def test_latency_mix(self):
        """混合延迟测试 - 不同 lat 混合输入"""
        self.log("\n=== Test: Latency Mix ===")
        model = FastFWDReferenceModel()
        
        # 交替输入不同 lat
        for c in range(20):
            lats = [(c + i) % 4 for i in range(4)]  # 0,1,2,3 循环
            ctrls = [lat for lat in lats]
            model.process_input(c, [1,1,1,1], [c*4+i for i in range(4)], ctrls)
            model.schedule_fe(c)
            model.complete_fe(c)
            model.get_output(c)
        
        # 排空 - 增加更多 cycle 确保所有包输出
        for c in range(20, 100):
            model.schedule_fe(c)
            model.complete_fe(c)
            model.get_output(c)
        
        self.log(f"Total: in={model.stats['packets_in']}, out={model.stats['packets_out']}")
        return model.stats['packets_in'] == model.stats['packets_out']
    
    def run_all(self):
        """运行所有测试"""
        self.log("="*60)
        self.log("FastFWD V3 Complex Test Suite")
        self.log("="*60)
        
        tests = [
            ("Burst Input", self.test_burst_input),
            ("Sparse Input", self.test_sparse_input),
            ("Latency Mix", self.test_latency_mix),
        ]
        
        passed = 0
        for name, test_fn in tests:
            try:
                if test_fn():
                    self.log(f"✓ {name}: PASSED")
                    passed += 1
                else:
                    self.log(f"✗ {name}: FAILED")
            except Exception as e:
                self.log(f"✗ {name}: EXCEPTION - {e}")
        
        self.log(f"\nResults: {passed}/{len(tests)} passed")
        self.save()
        return passed == len(tests)


if __name__ == "__main__":
    runner = ComplexTestRunner()
    runner.run_all()
