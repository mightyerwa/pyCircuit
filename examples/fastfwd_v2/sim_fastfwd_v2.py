"""
Cycle-accurate Python simulation of FastFwd V2.

Mirrors the RTL described in fastfwd_v2.py:
  4 input lanes  ->  sequencer  ->  4 issue queues (by seq%4)
  -> dispatch (dep check + eng free)  ->  4 FEs  ->  ROB  ->  commit  ->  4 output lanes

All register semantics: .out() is current-cycle value, .set() is next-cycle value.
Updates are applied at posedge (end of cycle).
"""

from __future__ import annotations

import random
import sys
from collections import deque
from dataclasses import dataclass, field

MASK128 = (1 << 128) - 1
MASK16 = (1 << 16) - 1
N_ENG = 4
PIPE_DEPTH = 5
Q_DEPTH = 16
ROB_DEPTH = 16
SEQ_W = 16
HIST_DEPTH = 8
BKPR_SLACK = 2
SEQ_MASK = (1 << SEQ_W) - 1


class Reg:
    def __init__(self, width: int, init: int = 0):
        self.width = width
        self.mask = (1 << width) - 1
        self.val = init & self.mask
        self._next = init & self.mask
        self._set_called = False

    def out(self) -> int:
        return self.val

    def set(self, v: int) -> None:
        self._next = v & self.mask
        self._set_called = True

    def tick(self) -> None:
        if self._set_called:
            self.val = self._next
        self._set_called = False


class Fifo:
    """Simple FIFO with push/pop per cycle (at most one each)."""

    def __init__(self, depth: int):
        self.depth = depth
        self._buf: deque[int] = deque()

    @property
    def count(self) -> int:
        return len(self._buf)

    @property
    def out_valid(self) -> int:
        return 1 if self._buf else 0

    @property
    def out_data(self) -> int:
        return self._buf[0] if self._buf else 0

    def push(self, data: int, when: int) -> int:
        if when and len(self._buf) < self.depth:
            self._buf.append(data)
            return 1
        return 0

    def pop(self, when: int) -> tuple[int, int]:
        if when and self._buf:
            d = self._buf.popleft()
            return 1, d
        return 0, 0


@dataclass
class FeSlot:
    valid: bool = False
    due: int = 0
    data: int = 0


class FeModel:
    def __init__(self):
        self.slots: list[list[FeSlot]] = [[FeSlot() for _ in range(32)] for _ in range(N_ENG)]

    def drive_due(self, cycle: int) -> list[tuple[int, int]]:
        out = []
        for e in range(N_ENG):
            s = self.slots[e][cycle % 32]
            if s.valid and s.due == cycle:
                out.append((1, s.data))
                s.valid = False
            else:
                out.append((0, 0))
        return out

    def capture(self, cycle: int, fwd_vld: list[int], fwd_data: list[int],
                fwd_lat: list[int], fwd_dp_vld: list[int], fwd_dp_data: list[int]) -> None:
        for e in range(N_ENG):
            if not fwd_vld[e]:
                continue
            lat = fwd_lat[e] & 0x3
            due = cycle + 2 + lat
            dp = fwd_dp_data[e] if fwd_dp_vld[e] else 0
            result = (fwd_data[e] + dp) & MASK128
            s = self.slots[e][due % 32]
            if s.valid:
                print(f"ERROR: FE collision eng={e} due={due}", file=sys.stderr)
                sys.exit(2)
            s.valid = True
            s.due = due
            s.data = result


class FastFwdSim:
    def __init__(self):
        self.bkpr_r = Reg(1, 0)
        self.out_vld_r = [Reg(1, 0) for _ in range(4)]
        self.out_data_r = [Reg(128, 0) for _ in range(4)]
        self.seq_alloc = Reg(SEQ_W, 0)
        self.commit_ptr = Reg(2, 0)
        self.exp_seq = [Reg(SEQ_W, i) for i in range(4)]
        self.issue_q = [Fifo(Q_DEPTH) for _ in range(4)]
        self.pipe_v = [[Reg(1, 0) for _ in range(PIPE_DEPTH)] for _ in range(N_ENG)]
        self.pipe_s = [[Reg(SEQ_W, 0) for _ in range(PIPE_DEPTH)] for _ in range(N_ENG)]
        self.rob_v = [[Reg(1, 0) for _ in range(ROB_DEPTH)] for _ in range(4)]
        self.rob_d = [[Reg(128, 0) for _ in range(ROB_DEPTH)] for _ in range(4)]
        self.hist_v = [Reg(1, 0) for _ in range(HIST_DEPTH)]
        self.hist_s = [Reg(SEQ_W, 0) for _ in range(HIST_DEPTH)]
        self.hist_d = [Reg(128, 0) for _ in range(HIST_DEPTH)]
        self.shadow_cnt = [Reg(16, 0) for _ in range(4)]

    def _all_regs(self):
        regs = [self.bkpr_r, self.seq_alloc, self.commit_ptr]
        regs += self.out_vld_r + self.out_data_r
        regs += self.exp_seq
        for e in range(N_ENG):
            regs += self.pipe_v[e] + self.pipe_s[e]
        for l in range(4):
            regs += self.rob_v[l] + self.rob_d[l]
        regs += self.hist_v + self.hist_s + self.hist_d
        regs += self.shadow_cnt
        return regs

    def tick(self):
        for r in self._all_regs():
            r.tick()

    def dep_lookup(self, dep_seq: int, fwded_vld: list[int], fwded_data: list[int]) -> tuple[int, int]:
        dep_seq &= SEQ_MASK

        # FE bypass
        for e in range(N_ENG):
            if self.pipe_v[e][0].out() and fwded_vld[e] and self.pipe_s[e][0].out() == dep_seq:
                return 1, fwded_data[e]

        # ROB
        dl = dep_seq & 3
        for lane in range(4):
            if dl != lane:
                continue
            delta = ((dep_seq - self.exp_seq[lane].out()) & SEQ_MASK) >> 2
            if 0 <= delta < ROB_DEPTH and self.rob_v[lane][delta].out():
                return 1, self.rob_d[lane][delta].out()

        # History
        for i in range(HIST_DEPTH):
            if self.hist_v[i].out() and self.hist_s[i].out() == dep_seq:
                return 1, self.hist_d[i].out()

        return 0, 0

    def eval(self, in_vld: list[int], in_data: list[int], in_ctrl: list[int],
             fwded_vld: list[int], fwded_data: list[int]):
        """
        Combinational evaluation. Returns:
          (fwd_vld, fwd_data, fwd_lat, fwd_dp_vld, fwd_dp_data)
        and sets next-cycle values for all registers.
        """
        BUNDLE_W = SEQ_W + 128 + 5

        # ---- INPUT ACCEPT ----
        bkpr = self.bkpr_r.out()
        accept = 1 - bkpr
        eff_v = [in_vld[i] & accept for i in range(4)]

        base = self.seq_alloc.out()
        seq_lane = []
        running = base
        for i in range(4):
            seq_lane.append(running & SEQ_MASK)
            if eff_v[i]:
                running = (running + 1) & SEQ_MASK
        self.seq_alloc.set(running)

        push_v = [0] * 4
        push_d = [0] * 4
        for i in range(4):
            if not eff_v[i]:
                continue
            si = seq_lane[i]
            target = si & 3
            bundle = (si << (128 + 5)) | ((in_data[i] & MASK128) << 5) | (in_ctrl[i] & 0x1F)
            push_v[target] = 1
            push_d[target] = bundle

        push_fire = [self.issue_q[q].push(push_d[q], push_v[q]) for q in range(4)]

        # ---- DISPATCH ----
        fwd_vld = [0] * N_ENG
        fwd_data = [0] * N_ENG
        fwd_lat = [0] * N_ENG
        fwd_dp_vld = [0] * N_ENG
        fwd_dp_data = [0] * N_ENG
        dispatch_fire = [0] * N_ENG
        dispatch_seq = [0] * N_ENG
        lane_pop = [0] * 4

        for lane in range(4):
            e = lane
            qv = self.issue_q[lane].out_valid
            qb = self.issue_q[lane].out_data

            q_ctrl = qb & 0x1F
            q_data = (qb >> 5) & MASK128
            q_seq = (qb >> (5 + 128)) & SEQ_MASK
            q_lat = q_ctrl & 0x3
            q_dep = (q_ctrl >> 2) & 0x7

            has_dep = q_dep != 0
            dep_s = (q_seq - q_dep) & SEQ_MASK
            dep_found, dep_data_w = self.dep_lookup(dep_s, fwded_vld, fwded_data) if has_dep else (0, 0)
            dep_ok = (not has_dep) or dep_found

            stall = self.pipe_v[e][0].out() and not fwded_vld[e]
            if q_lat == 0:
                busy = self.pipe_v[e][2].out()
            elif q_lat == 1:
                busy = self.pipe_v[e][3].out()
            elif q_lat == 2:
                busy = self.pipe_v[e][4].out()
            else:
                busy = 0
            eng_ok = (not stall) and (not busy)

            delta = ((q_seq - self.exp_seq[lane].out()) & SEQ_MASK) >> 2
            in_range = delta < ROB_DEPTH

            can = qv and dep_ok and eng_ok and in_range
            pop_fire, _ = self.issue_q[lane].pop(1 if can else 0)
            lane_pop[lane] = pop_fire

            dispatch_fire[e] = 1 if can else 0
            dispatch_seq[e] = q_seq

            fwd_vld[e] = 1 if can else 0
            fwd_data[e] = q_data
            fwd_lat[e] = q_lat
            fwd_dp_vld[e] = 1 if (can and has_dep) else 0
            fwd_dp_data[e] = dep_data_w if dep_found else 0

        # ---- COMPLETION ----
        comp_v = [0] * N_ENG
        comp_seq = [0] * N_ENG
        comp_data = [0] * N_ENG
        for e in range(N_ENG):
            if self.pipe_v[e][0].out() and fwded_vld[e]:
                comp_v[e] = 1
                comp_seq[e] = self.pipe_s[e][0].out()
                comp_data[e] = fwded_data[e]

        ins_fire = list(comp_v)
        ins_seq = list(comp_seq)
        ins_data = list(comp_data)

        # ---- PIPELINE UPDATE ----
        for e in range(N_ENG):
            stall = self.pipe_v[e][0].out() and not fwded_vld[e]
            fire = dispatch_fire[e] and not stall
            lat = fwd_lat[e]
            seq_in = dispatch_seq[e]

            for i in range(PIPE_DEPTH):
                if i + 1 < PIPE_DEPTH:
                    v_next = self.pipe_v[e][i + 1].out()
                    s_next = self.pipe_s[e][i + 1].out()
                else:
                    v_next = 0
                    s_next = 0

                do_set = False
                if fire:
                    if i == 1 and lat == 0:
                        do_set = True
                    elif i == 2 and lat == 1:
                        do_set = True
                    elif i == 3 and lat == 2:
                        do_set = True
                    elif i == 4 and lat == 3:
                        do_set = True

                v_new = 1 if do_set else v_next
                s_new = seq_in if do_set else s_next

                if stall:
                    self.pipe_v[e][i].set(self.pipe_v[e][i].out())
                    self.pipe_s[e][i].set(self.pipe_s[e][i].out())
                else:
                    self.pipe_v[e][i].set(v_new)
                    self.pipe_s[e][i].set(s_new)

        # ---- COMMIT ----
        start = self.commit_ptr.out()
        lane_ready = [self.rob_v[l][0].out() for l in range(4)]
        lane_data0 = [self.rob_d[l][0].out() for l in range(4)]

        def prefix(sl: int):
            ok = True
            v = []
            for k in range(4):
                lane = (sl + k) & 3
                ok = ok and lane_ready[lane]
                v.append(ok)
            cnt = 0
            for k in range(4):
                if v[k]:
                    cnt = k + 1
            return v, cnt

        pvs = [prefix(s) for s in range(4)]
        commit_cnt = pvs[start][1]

        out_v = [0] * 4
        out_d = [0] * 4
        commit_pop = [0] * 4

        for k in range(commit_cnt):
            lane = (start + k) & 3
            out_v[lane] = 1
            out_d[lane] = lane_data0[lane]
            commit_pop[lane] = 1

        for i in range(4):
            self.out_vld_r[i].set(out_v[i])
            self.out_data_r[i].set(out_d[i] if out_v[i] else 0)

        next_ptr = (start + commit_cnt) & 3
        self.commit_ptr.set(next_ptr)

        for lane in range(4):
            if commit_pop[lane]:
                self.exp_seq[lane].set((self.exp_seq[lane].out() + 4) & SEQ_MASK)
            else:
                self.exp_seq[lane].set(self.exp_seq[lane].out())

        # ---- ROB UPDATE ----
        for lane in range(4):
            delta = ((ins_seq[lane] - self.exp_seq[lane].out()) & SEQ_MASK) >> 2

            v_ins = []
            d_ins = []
            for i in range(ROB_DEPTH):
                if ins_fire[lane] and delta == i:
                    v_ins.append(1)
                    d_ins.append(ins_data[lane])
                else:
                    v_ins.append(self.rob_v[lane][i].out())
                    d_ins.append(self.rob_d[lane][i].out())

            for i in range(ROB_DEPTH):
                if commit_pop[lane]:
                    if i + 1 < ROB_DEPTH:
                        self.rob_v[lane][i].set(v_ins[i + 1])
                        self.rob_d[lane][i].set(d_ins[i + 1])
                    else:
                        self.rob_v[lane][i].set(0)
                        self.rob_d[lane][i].set(0)
                else:
                    self.rob_v[lane][i].set(v_ins[i])
                    self.rob_d[lane][i].set(d_ins[i])

        # ---- HISTORY UPDATE ----
        commit_seqs = []
        commit_datas = []
        for k in range(4):
            lane_k = (start + k) & 3
            commit_seqs.append(self.exp_seq[lane_k].out())
            commit_datas.append(lane_data0[lane_k])

        for i in range(HIST_DEPTH):
            v_next = self.hist_v[i].out()
            s_next = self.hist_s[i].out()
            d_next = self.hist_d[i].out()

            if commit_cnt > 0:
                cc = commit_cnt
                if i < cc:
                    idx = cc - 1 - i
                    v_next = 1
                    s_next = commit_seqs[idx]
                    d_next = commit_datas[idx]
                else:
                    src = i - cc
                    v_next = self.hist_v[src].out()
                    s_next = self.hist_s[src].out()
                    d_next = self.hist_d[src].out()

            self.hist_v[i].set(v_next)
            self.hist_s[i].set(s_next)
            self.hist_d[i].set(d_next)

        # ---- BKPR ----
        bkpr_next = 0
        for lane in range(4):
            cnt_cur = self.shadow_cnt[lane].out()
            cnt_next = (cnt_cur + push_fire[lane] - lane_pop[lane]) & 0xFFFF
            self.shadow_cnt[lane].set(cnt_next)
            if cnt_next >= Q_DEPTH - BKPR_SLACK:
                bkpr_next = 1
        self.bkpr_r.set(bkpr_next)

        return fwd_vld, fwd_data, fwd_lat, fwd_dp_vld, fwd_dp_data


def run_test(seed: int = 1, max_cycles: int = 10000, max_pkts: int = 30000, verbose: bool = False):
    rng = random.Random(seed)
    dut = FastFwdSim()
    fe = FeModel()

    exp_q: deque[tuple[int, int]] = deque()
    exp_by_seq: list[int] = []

    sent = 0
    got = 0
    bkpr_cycles = 0
    out_ptr = 0
    errors = 0

    sim_cycle = 0
    while sim_cycle < max_cycles or exp_q:
        bkpr = dut.bkpr_r.out()
        if bkpr:
            bkpr_cycles += 1

        fe_out = fe.drive_due(sim_cycle)
        fwded_vld = [fe_out[e][0] for e in range(N_ENG)]
        fwded_data = [fe_out[e][1] for e in range(N_ENG)]

        in_vld = [0] * 4
        in_data = [0] * 4
        in_ctrl = [0] * 4

        if not bkpr and sim_cycle < max_cycles and sent < max_pkts:
            for l in range(4):
                if sent >= max_pkts:
                    break
                heavy = sim_cycle >= max_cycles // 2
                p = 85 if heavy else 45
                if rng.randint(0, 99) >= p:
                    continue

                seq = sent
                max_dep = min(seq, 7)
                dep = 0
                if max_dep > 0:
                    total = 14 + max_dep
                    r = rng.randint(0, total - 1)
                    dep = 0 if r < 14 else (r - 13)

                lat = rng.randint(0, 3)
                ctrl = (lat & 0x3) | ((dep & 0x7) << 2)

                data = rng.getrandbits(128)
                dp_data = exp_by_seq[seq - dep] if dep != 0 else 0
                fwded = (data + dp_data) & MASK128

                exp_by_seq.append(fwded)
                exp_q.append((seq, fwded))
                sent += 1

                in_vld[l] = 1
                in_data[l] = data
                in_ctrl[l] = ctrl

        fwd_vld, fwd_data, fwd_lat, fwd_dp_vld, fwd_dp_data = dut.eval(
            in_vld, in_data, in_ctrl, fwded_vld, fwded_data
        )

        fe.capture(sim_cycle, fwd_vld, fwd_data, fwd_lat, fwd_dp_vld, fwd_dp_data)

        dut.tick()

        if dut.seq_alloc.out() != (sent & SEQ_MASK):
            print(f"FAIL: seq_alloc={dut.seq_alloc.out()} sent={sent} cyc={sim_cycle}")
            return 1

        produced = 0
        ptr = out_ptr
        for _ in range(4):
            if not dut.out_vld_r[ptr].out():
                break
            if not exp_q:
                print(f"FAIL: unexpected output cyc={sim_cycle} lane={ptr}")
                return 1
            exp_seq, exp_data = exp_q.popleft()
            o = dut.out_data_r[ptr].out()
            if o != exp_data:
                print(f"FAIL: data mismatch cyc={sim_cycle} lane={ptr} "
                      f"exp_seq={exp_seq} got=0x{o:032x} exp=0x{exp_data:032x} "
                      f"(sent={sent} got={got})")
                errors += 1
                if errors > 10:
                    return 1
            got += 1
            produced += 1
            ptr = (ptr + 1) & 3

        for k in range(produced, 4):
            lane_k = (out_ptr + k) & 3
            if dut.out_vld_r[lane_k].out():
                print(f"FAIL: output hole cyc={sim_cycle} outPtr={out_ptr} lane={lane_k}")
                return 1

        out_ptr = ptr
        if out_ptr != (dut.commit_ptr.out() & 3):
            print(f"FAIL: outPtr={out_ptr} commit_ptr={dut.commit_ptr.out()} cyc={sim_cycle}")
            return 1

        sim_cycle += 1
        if sim_cycle > max_cycles + 50000 and exp_q:
            print(f"FAIL: timeout, outstanding={len(exp_q)}")
            return 1

    if errors > 0:
        print(f"FAIL: {errors} data mismatches")
        return 1

    thr = got / sim_cycle if sim_cycle > 0 else 0.0
    bkpr_pct = 100.0 * bkpr_cycles / sim_cycle if sim_cycle > 0 else 0.0
    print(f"PASS: FastFwdV2 sent={sent} got={got} cycles={sim_cycle} "
          f"throughput={thr:.3f} pkt/cyc bkpr={bkpr_pct:.1f}%")
    return 0


if __name__ == "__main__":
    seed = 1
    cycles = 10000
    packets = 30000
    verbose = False

    args = sys.argv[1:]
    i = 0
    while i < len(args):
        if args[i] == "--seed" and i + 1 < len(args):
            seed = int(args[i + 1]); i += 2; continue
        if args[i] == "--cycles" and i + 1 < len(args):
            cycles = int(args[i + 1]); i += 2; continue
        if args[i] == "--packets" and i + 1 < len(args):
            packets = int(args[i + 1]); i += 2; continue
        if args[i] == "--verbose":
            verbose = True; i += 1; continue
        print(f"unknown arg: {args[i]}"); sys.exit(2)

    sys.exit(run_test(seed, cycles, packets, verbose))
