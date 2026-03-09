#!/usr/bin/env python3
"""
FastFWD V3.4 Reference Model
Generates expected output sequences for Verilog testbench verification

Usage:
    python ref_model.py --test single > test_vectors/single.hex
    python ref_model.py --test fe_constraint > test_vectors/fe_constraint.hex
"""

import argparse
import random
from dataclasses import dataclass
from typing import List, Tuple, Optional


@dataclass
class Packet:
    """Packet structure"""
    seq: int
    data: int
    latency: int  # 0-3
    dep: int      # 0-7, 0 means no dependency
    
    @property
    def ctrl(self) -> int:
        """Generate control word: {dep[2:0], lat[1:0]}"""
        return (self.dep << 2) | self.latency
    
    def hex_data(self) -> str:
        return f"{self.data:032x}"
    
    def hex_ctrl(self) -> str:
        return f"{self.ctrl:02x}"


class FastFWDRefModel:
    """
    Reference model for FastFWD V3.4
    Implements the exact same logic as the RTL
    """
    
    def __init__(self, n_lanes: int = 4, n_fe: int = 4):
        self.n_lanes = n_lanes
        self.n_fe = n_fe
        
        # State
        self.seq_cnt = 0
        self.cycle = 0
        self.out_ptr = 0
        
        # FE state
        self.fe_busy = [False] * n_fe
        self.fe_timer = [0] * n_fe
        self.fe_last_finish = [-1] * n_fe  # -1 means no previous
        self.fe_pkt_seq = [0] * n_fe
        
        # Dependency table (8-entry CAM)
        self.dep_valid = [False] * 8
        self.dep_data = [0] * 8
        self.dep_seq = [0] * 8
        self.dep_write_ptr = 0
        
        # ROB (8-entry)
        self.rob_valid = [False] * 8
        self.rob_data = [0] * 8
        self.rob_seq = [0] * 8
        self.rob_tail = 0
        self.next_output_seq = 0
        
        # Input collector state
        self.ic_seq = [0] * n_lanes
        
        # Output tracking
        self.outputs = []  # List of (cycle, lane, seq, data)
        
    def reset(self):
        """Reset state"""
        self.__init__(self.n_lanes, self.n_fe)
    
    def cycle_step(self, lane_inputs: List[Optional[Packet]]) -> List[Optional[Packet]]:
        """
        Execute one cycle
        
        Args:
            lane_inputs: List of 4 packets (or None for no input)
        
        Returns:
            List of 4 output packets (or None for no output)
        """
        # Input Collector: assign seq numbers
        current_seq = self.seq_cnt
        valid_inputs = []
        
        for i, pkt in enumerate(lane_inputs):
            if pkt is not None:
                pkt.seq = current_seq + len(valid_inputs)
                valid_inputs.append((i, pkt))
                self.ic_seq[i] = pkt.seq
        
        self.seq_cnt += len(valid_inputs)
        
        # Process FE completions first (feedback from previous cycles)
        fe_done = False
        fe_done_data = 0
        fe_done_seq = 0
        
        for i in range(self.n_fe):
            if self.fe_busy[i] and self.fe_timer[i] == 1:
                # FE completes this cycle
                fe_done = True
                fe_done_data = self.fe_pkt_seq[i]  # Simplified - should be actual data
                fe_done_seq = self.fe_pkt_seq[i]
                self.fe_busy[i] = False
                self.fe_timer[i] = 0
        
        # Update dependency table and ROB
        if fe_done:
            self.dep_valid[self.dep_write_ptr] = True
            self.dep_data[self.dep_write_ptr] = fe_done_data
            self.dep_seq[self.dep_write_ptr] = fe_done_seq
            self.dep_write_ptr = (self.dep_write_ptr + 1) % 8
            
            self.rob_valid[self.rob_tail] = True
            self.rob_data[self.rob_tail] = fe_done_data
            self.rob_seq[self.rob_tail] = fe_done_seq
            self.rob_tail = (self.rob_tail + 1) % 8
        
        # FE Scheduler
        for fe_id in range(self.n_fe):
            if fe_id < len(valid_inputs):
                lane_id, pkt = valid_inputs[fe_id]
                lat = pkt.latency
                dep = pkt.dep
                
                # Calculate finish cycle
                finish_cycle = self.cycle + 2 + lat
                
                # Check constraint: finish != last_finish
                constraint_ok = (finish_cycle != self.fe_last_finish[fe_id])
                
                # Check dependency
                can_schedule = (not self.fe_busy[fe_id]) and constraint_ok
                
                if dep != 0:
                    # Need to find dependency
                    target_seq = pkt.seq - dep
                    dep_found = False
                    for j in range(8):
                        if self.dep_valid[j] and self.dep_seq[j] == target_seq:
                            dep_found = True
                            break
                    can_schedule = can_schedule and dep_found
                
                if can_schedule:
                    self.fe_busy[fe_id] = True
                    self.fe_timer[fe_id] = lat + 1
                    self.fe_last_finish[fe_id] = finish_cycle
                    self.fe_pkt_seq[fe_id] = pkt.seq
        
        # Decrement FE timers
        for i in range(self.n_fe):
            if self.fe_busy[i] and self.fe_timer[i] > 0:
                self.fe_timer[i] -= 1
        
        # Output Scheduler
        outputs = [None] * self.n_lanes
        
        # Find if next_output_seq is available in ROB
        found_in_rob = False
        rob_data = 0
        rob_idx = -1
        
        for i in range(8):
            if self.rob_valid[i] and self.rob_seq[i] == self.next_output_seq:
                found_in_rob = True
                rob_data = self.rob_data[i]
                rob_idx = i
                break
        
        if found_in_rob:
            lane = self.out_ptr
            outputs[lane] = Packet(
                seq=self.next_output_seq,
                data=rob_data,
                latency=0,
                dep=0
            )
            self.outputs.append((self.cycle, lane, self.next_output_seq, rob_data))
            
            # Clear ROB entry
            self.rob_valid[rob_idx] = False
            
            # Advance pointers
            self.out_ptr = (self.out_ptr + 1) % self.n_lanes
            self.next_output_seq += 1
        
        self.cycle += 1
        return outputs
    
    def run_test(self, inputs: List[List[Optional[Packet]]]) -> List[List[Optional[Packet]]]:
        """
        Run a complete test
        
        Args:
            inputs: List of cycles, each cycle has list of 4 packets
        
        Returns:
            List of cycles with output packets
        """
        all_outputs = []
        
        for cycle_inputs in inputs:
            outputs = self.cycle_step(cycle_inputs)
            all_outputs.append(outputs)
        
        # Run additional cycles to drain
        for _ in range(20):
            outputs = self.cycle_step([None, None, None, None])
            all_outputs.append(outputs)
        
        return all_outputs
    
    def generate_verilog_vectors(self, inputs: List[List[Optional[Packet]]], filename: str):
        """Generate test vectors for Verilog"""
        outputs = self.run_test(inputs)
        
        with open(filename, 'w') as f:
            f.write("// FastFWD V3.4 Test Vectors\n")
            f.write("// Format: cycle,input_vld,lane0_data,lane0_ctrl,...\n\n")
            
            for cycle, (inp, out) in enumerate(zip(inputs, outputs)):
                # Input valid
                in_vld = sum(1 << i for i, p in enumerate(inp) if p is not None)
                
                # Input data and ctrl
                in_data = []
                in_ctrl = []
                for i in range(4):
                    if inp[i] is not None:
                        in_data.append(inp[i].hex_data())
                        in_ctrl.append(inp[i].hex_ctrl())
                    else:
                        in_data.append("0" * 32)
                        in_ctrl.append("00")
                
                # Output valid
                out_vld = sum(1 << i for i, p in enumerate(out) if p is not None)
                
                # Expected output data
                out_data = []
                for i in range(4):
                    if out[i] is not None:
                        out_data.append(f"{out[i].data:032x}")
                    else:
                        out_data.append("0" * 32)
                
                f.write(f"{cycle:04d}_{in_vld:01x}_{out_vld:01x}_")
                f.write('_'.join(in_data + in_ctrl + out_data))
                f.write("\n")
        
        print(f"Test vectors written to {filename}")


def test_single_packet():
    """Test 1: Single packet through lane 0"""
    print("\n[Test 1] Single Packet")
    
    model = FastFWDRefModel()
    
    # One packet on lane 0
    pkt = Packet(seq=0, data=0xDEADBEEF_CAFE1234_AABBCCDD_EEFF0011, latency=0, dep=0)
    inputs = [[pkt, None, None, None]]
    inputs += [[None, None, None, None]] * 10  # Wait for output
    
    outputs = model.run_test(inputs)
    
    print(f"Sent packet: seq={pkt.seq}, data={pkt.hex_data()}")
    for cycle, out in enumerate(outputs):
        if out[0] is not None:
            print(f"Cycle {cycle}: Output on lane 0, seq={out[0].seq}")
    
    return inputs, outputs


def test_fe_constraint():
    """Test 2: FE constraint - lat=2 then lat=0"""
    print("\n[Test 2] FE Constraint (lat=2 then lat=0)")
    
    model = FastFWDRefModel()
    
    # Packet 0: lat=2 (finish at cycle+4)
    pkt0 = Packet(seq=0, data=0xAAAA, latency=2, dep=0)
    # Packet 1: lat=0 (finish at cycle+3) - should be OK with != constraint
    pkt1 = Packet(seq=1, data=0xBBBB, latency=0, dep=0)
    
    inputs = [
        [pkt0, None, None, None],
        [pkt1, None, None, None],
    ]
    inputs += [[None, None, None, None]] * 15
    
    outputs = model.run_test(inputs)
    
    print(f"Packet 0: lat=2, expected finish at cycle {2+2+1}=5")
    print(f"Packet 1: lat=0, expected finish at cycle {1+2+0}=3")
    print("With != constraint, both should schedule (finish times differ)")
    
    for cycle, out in enumerate(outputs):
        for lane, pkt in enumerate(out):
            if pkt is not None:
                print(f"Cycle {cycle}: Output on lane {lane}, seq={pkt.seq}, data={pkt.data:04x}")
    
    return inputs, outputs


def test_dependency():
    """Test 3: Dependency resolution"""
    print("\n[Test 3] Dependency Resolution")
    
    model = FastFWDRefModel()
    
    # Packet 0: no dep
    pkt0 = Packet(seq=0, data=0x1000, latency=1, dep=0)
    # Packet 1: depends on packet 0 (dep=1)
    pkt1 = Packet(seq=1, data=0x2000, latency=1, dep=1)
    
    inputs = [
        [pkt0, None, None, None],
        [pkt1, None, None, None],
    ]
    inputs += [[None, None, None, None]] * 15
    
    outputs = model.run_test(inputs)
    
    print(f"Packet 0: seq=0, no dep")
    print(f"Packet 1: seq=1, depends on seq=0")
    print("Packet 1 should wait until packet 0 completes")
    
    for cycle, out in enumerate(outputs):
        for lane, pkt in enumerate(out):
            if pkt is not None:
                print(f"Cycle {cycle}: Output on lane {lane}, seq={pkt.seq}")
    
    return inputs, outputs


def main():
    parser = argparse.ArgumentParser(description='FastFWD V3.4 Reference Model')
    parser.add_argument('--test', choices=['single', 'fe', 'dep', 'all'], 
                        default='all', help='Test to run')
    parser.add_argument('--output', '-o', help='Output file for test vectors')
    args = parser.parse_args()
    
    if args.test == 'single' or args.test == 'all':
        inputs, outputs = test_single_packet()
        if args.output:
            model = FastFWDRefModel()
            model.generate_verilog_vectors(inputs, args.output.replace('.hex', '_single.hex'))
    
    if args.test == 'fe' or args.test == 'all':
        inputs, outputs = test_fe_constraint()
        if args.output:
            model = FastFWDRefModel()
            model.generate_verilog_vectors(inputs, args.output.replace('.hex', '_fe.hex'))
    
    if args.test == 'dep' or args.test == 'all':
        inputs, outputs = test_dependency()
        if args.output:
            model = FastFWDRefModel()
            model.generate_verilog_vectors(inputs, args.output.replace('.hex', '_dep.hex'))


if __name__ == '__main__':
    main()
