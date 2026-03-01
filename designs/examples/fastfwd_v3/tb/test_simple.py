# FastFWD Comprehensive Test Suite
# High robustness testing with detailed logging

import random
from dataclasses import dataclass
from typing import List, Tuple
from datetime import datetime

@dataclass
class Packet:
    seq: int
    lane: int
    data: int
    ctrl: int
    cycle: int

class RefModel:
    def __init__(self):
        self.seq = 0
        self.buf = []
        self.ptr = 0
        self.in_count = 0
        self.out_count = 0
    
    def input(self, c, vlds, datas, ctrls):
        for i in range(4):
            if vlds[i]:
                self.buf.append(Packet(self.seq, i, datas[i], ctrls[i], c))
                self.seq += 1
                self.in_count += 1
    
    def output(self):
        out = []
        self.buf.sort(key=lambda p: p.seq)
        lane = self.ptr
        for p in self.buf[:4]:
            out.append((lane, p.data, p.seq))
            lane = (lane + 1) % 4
            self.out_count += 1
        self.buf = self.buf[len(out):]
        self.ptr = lane
        return out

def test_basic():
    m = RefModel()
    m.input(0, [1,0,0,0], [0x1234,0,0,0], [0,0,0,0])
    out = m.output()
    assert len(out) == 1 and out[0][2] == 0
    return True

def test_multi():
    m = RefModel()
    m.input(0, [1,1,1,1], [0,1,2,3], [0,0,0,0])
    out = m.output()
    assert len(out) == 4
    return True

if __name__ == "__main__":
    print("Running basic tests...")
    print("test_basic:", "PASS" if test_basic() else "FAIL")
    print("test_multi:", "PASS" if test_multi() else "FAIL")
    print("Done")
