from __future__ import annotations

from pycircuit import Circuit, Queue, Reg, Wire, cat

N_ENG = 4
PIPE_DEPTH = 5


def build(
    m: Circuit,
    Q_DEPTH: int = 16,
    ROB_DEPTH: int = 16,
    SEQ_W: int = 16,
    HIST_DEPTH: int = 8,
    BKPR_SLACK: int = 2,
) -> None:
    BUNDLE_W = SEQ_W + 128 + 5

    clk = m.clock("clk")
    rst = m.reset("rst")

    # ---- input ports ----
    in_vld = [m.input(f"lane{i}_pkt_in_vld", width=1) for i in range(4)]
    in_data = [m.input(f"lane{i}_pkt_in_data", width=128) for i in range(4)]
    in_ctrl = [m.input(f"lane{i}_pkt_in_ctrl", width=5) for i in range(4)]

    fwded_vld = [m.input(f"fwded{e}_pkt_data_vld", width=1) for e in range(N_ENG)]
    fwded_data = [m.input(f"fwded{e}_pkt_data", width=128) for e in range(N_ENG)]

    # ---- registered outputs ----
    bkpr_r = m.out("pkt_in_bkpr", clk=clk, rst=rst, width=1, init=0)
    out_vld_r = [m.out(f"lane{i}_pkt_out_vld", clk=clk, rst=rst, width=1, init=0) for i in range(4)]
    out_data_r = [m.out(f"lane{i}_pkt_out_data", clk=clk, rst=rst, width=128, init=0) for i in range(4)]

    # ---- global state ----
    seq_alloc = m.out("seq_alloc", clk=clk, rst=rst, width=SEQ_W, init=0)
    commit_ptr = m.out("commit_ptr", clk=clk, rst=rst, width=2, init=0)
    exp_seq = [m.out(f"exp_seq{i}", clk=clk, rst=rst, width=SEQ_W, init=i) for i in range(4)]

    # ---- per-lane issue queues ----
    issue_q = [m.queue(f"iq{i}", clk=clk, rst=rst, width=BUNDLE_W, depth=Q_DEPTH) for i in range(4)]

    # ---- per-engine pipeline tracker ----
    pipe_v = [
        [m.out(f"eng{e}_pv{s}", clk=clk, rst=rst, width=1, init=0) for s in range(PIPE_DEPTH)]
        for e in range(N_ENG)
    ]
    pipe_s = [
        [m.out(f"eng{e}_ps{s}", clk=clk, rst=rst, width=SEQ_W, init=0) for s in range(PIPE_DEPTH)]
        for e in range(N_ENG)
    ]

    # ---- per-lane ROB ----
    rob_v = [
        [m.out(f"rob{l}_v{s}", clk=clk, rst=rst, width=1, init=0) for s in range(ROB_DEPTH)]
        for l in range(4)
    ]
    rob_d = [
        [m.out(f"rob{l}_d{s}", clk=clk, rst=rst, width=128, init=0) for s in range(ROB_DEPTH)]
        for l in range(4)
    ]

    # ---- history buffer ----
    hist_v = [m.out(f"hist_v{i}", clk=clk, rst=rst, width=1, init=0) for i in range(HIST_DEPTH)]
    hist_s = [m.out(f"hist_s{i}", clk=clk, rst=rst, width=SEQ_W, init=0) for i in range(HIST_DEPTH)]
    hist_d = [m.out(f"hist_d{i}", clk=clk, rst=rst, width=128, init=0) for i in range(HIST_DEPTH)]

    # ---- shadow counts for BKPR ----
    shadow_cnt = [m.out(f"iq_cnt{i}", clk=clk, rst=rst, width=16, init=0) for i in range(4)]

    # ==================================================================
    # INPUT ACCEPT: assign seq numbers, route to issue queues
    # ==================================================================
    with m.scope("IN"):
        bkpr = bkpr_r.out()
        accept = ~bkpr
        eff_v = [in_vld[i] & accept for i in range(4)]

        base = seq_alloc.out()
        inc = [eff_v[i].select(m.const(1, width=SEQ_W), m.const(0, width=SEQ_W)) for i in range(4)]
        seq_lane: list[Wire] = [base]
        for i in range(1, 4):
            seq_lane.append(seq_lane[i - 1] + inc[i - 1])
        total_inc = inc[0] + inc[1] + inc[2] + inc[3]
        seq_alloc.set(base + total_inc)

        push_v = [m.const(0, width=1) for _ in range(4)]
        push_d = [m.const(0, width=BUNDLE_W) for _ in range(4)]

        for i in range(4):
            si = seq_lane[i]
            target = si[0:2]
            bundle = cat(si, in_data[i], in_ctrl[i])
            for q in range(4):
                hit = eff_v[i] & target.eq(q)
                push_v[q] = push_v[q] | hit
                push_d[q] = hit.select(bundle, push_d[q])

        push_fire = [issue_q[q].push(push_d[q], when=push_v[q]) for q in range(4)]

    # ==================================================================
    # DEPENDENCY LOOKUP helper
    # ==================================================================
    def dep_lookup(dep_seq: Wire) -> tuple[Wire, Wire]:
        found_fe = m.const(0, width=1)
        data_fe = m.const(0, width=128)
        for e in range(N_ENG):
            match = pipe_v[e][0].out() & fwded_vld[e] & pipe_s[e][0].out().eq(dep_seq)
            found_fe = found_fe | match
            data_fe = match.select(fwded_data[e], data_fe)

        found_rob = m.const(0, width=1)
        data_rob = m.const(0, width=128)
        dl = dep_seq[0:2]
        for lane in range(4):
            is_l = dl.eq(lane)
            delta = (dep_seq - exp_seq[lane].out()) >> 2
            for s in range(ROB_DEPTH):
                match = is_l & rob_v[lane][s].out() & delta.eq(s)
                found_rob = found_rob | match
                data_rob = match.select(rob_d[lane][s].out(), data_rob)

        found_h = m.const(0, width=1)
        data_h = m.const(0, width=128)
        for i in range(HIST_DEPTH):
            match = hist_v[i].out() & hist_s[i].out().eq(dep_seq)
            found_h = found_h | match
            data_h = match.select(hist_d[i].out(), data_h)

        found = found_fe | found_rob | found_h
        data = found_fe.select(data_fe, found_rob.select(data_rob, data_h))
        return found, data

    # ==================================================================
    # DISPATCH: issue queue → FE
    # ==================================================================
    with m.scope("DISP"):
        dispatch_fire = [m.const(0, width=1) for _ in range(N_ENG)]
        dispatch_seq = [m.const(0, width=SEQ_W) for _ in range(N_ENG)]

        fwd_vld_w = [m.const(0, width=1) for _ in range(N_ENG)]
        fwd_data_w = [m.const(0, width=128) for _ in range(N_ENG)]
        fwd_lat_w = [m.const(0, width=2) for _ in range(N_ENG)]
        fwd_dp_vld_w = [m.const(0, width=1) for _ in range(N_ENG)]
        fwd_dp_data_w = [m.const(0, width=128) for _ in range(N_ENG)]

        lane_pop = [m.const(0, width=1) for _ in range(4)]

        for lane in range(4):
            e = lane
            c0 = m.const(0, width=1)

            qv = issue_q[lane].out_valid
            qb = issue_q[lane].out_data

            q_ctrl = qb[0:5]
            q_data = qb[5:133]
            q_seq = qb[133 : 133 + SEQ_W]
            q_lat = q_ctrl[0:2]
            q_dep = q_ctrl[2:5]

            has_dep = ~q_dep.eq(0)
            dep_s = q_seq - q_dep.zext(width=SEQ_W)
            dep_found, dep_data_w = dep_lookup(dep_s)
            dep_ok = (~has_dep) | dep_found

            stall = pipe_v[e][0].out() & ~fwded_vld[e]
            busy = q_lat.eq(0).select(pipe_v[e][2].out(), c0)
            busy = q_lat.eq(1).select(pipe_v[e][3].out(), busy)
            busy = q_lat.eq(2).select(pipe_v[e][4].out(), busy)
            eng_ok = ~stall & ~busy

            delta = (q_seq - exp_seq[lane].out()) >> 2
            in_range = delta.ult(ROB_DEPTH)

            can = qv & dep_ok & eng_ok & in_range
            pop_r = issue_q[lane].pop(when=can)
            lane_pop[lane] = pop_r.fire

            dispatch_fire[e] = can
            dispatch_seq[e] = q_seq

            fwd_vld_w[e] = can
            fwd_data_w[e] = q_data
            fwd_lat_w[e] = q_lat
            fwd_dp_vld_w[e] = can & has_dep
            fwd_dp_data_w[e] = dep_data_w

    # ==================================================================
    # COMPLETION: FE output → signals for ROB insert
    # ==================================================================
    comp_v = [pipe_v[e][0].out() & fwded_vld[e] for e in range(N_ENG)]
    comp_seq = [pipe_s[e][0].out() for e in range(N_ENG)]
    comp_data = [fwded_data[e] for e in range(N_ENG)]

    ins_fire = [comp_v[lane] for lane in range(4)]
    ins_seq = [comp_seq[lane] for lane in range(4)]
    ins_data = [comp_data[lane] for lane in range(4)]

    # ==================================================================
    # PIPELINE UPDATE: shift + insert
    # ==================================================================
    with m.scope("PIPE"):
        c0w = m.const(0, width=1)
        c1w = m.const(1, width=1)
        zero_seq = m.const(0, width=SEQ_W)

        for e in range(N_ENG):
            stall = pipe_v[e][0].out() & ~fwded_vld[e]
            fire = dispatch_fire[e] & ~stall
            lat = fwd_lat_w[e]
            seq_in = dispatch_seq[e]

            for i in range(PIPE_DEPTH):
                if i + 1 < PIPE_DEPTH:
                    v_next = pipe_v[e][i + 1].out()
                    s_next = pipe_s[e][i + 1].out()
                else:
                    v_next = c0w
                    s_next = zero_seq

                if i == 1:
                    do_set = fire & lat.eq(0)
                elif i == 2:
                    do_set = fire & lat.eq(1)
                elif i == 3:
                    do_set = fire & lat.eq(2)
                elif i == 4:
                    do_set = fire & lat.eq(3)
                else:
                    do_set = c0w

                v_new = do_set.select(c1w, v_next)
                s_new = do_set.select(seq_in, s_next)
                pipe_v[e][i].set(stall.select(pipe_v[e][i].out(), v_new))
                pipe_s[e][i].set(stall.select(pipe_s[e][i].out(), s_new))

    # ==================================================================
    # COMMIT: ROB head → output, ROB update, history update
    # ==================================================================
    with m.scope("COMMIT"):
        start = commit_ptr.out()
        lane_ready = [rob_v[l][0].out() for l in range(4)]
        lane_data0 = [rob_d[l][0].out() for l in range(4)]

        def prefix(sl: int) -> tuple[list[Wire], Wire]:
            ok = m.const(1, width=1)
            v: list[Wire] = []
            for k in range(4):
                lane = (sl + k) & 3
                ok = ok & lane_ready[lane]
                v.append(ok)
            cnt = v[0].select(m.const(1, width=3), m.const(0, width=3))
            cnt = v[1].select(m.const(2, width=3), cnt)
            cnt = v[2].select(m.const(3, width=3), cnt)
            cnt = v[3].select(m.const(4, width=3), cnt)
            return v, cnt

        pvs = [prefix(s) for s in range(4)]
        is_s = [start.eq(s) for s in range(4)]
        commit_cnt = is_s[3].select(pvs[3][1], is_s[2].select(pvs[2][1], is_s[1].select(pvs[1][1], pvs[0][1])))

        out_v = [m.const(0, width=1) for _ in range(4)]
        out_d = [m.const(0, width=128) for _ in range(4)]
        commit_pop = [m.const(0, width=1) for _ in range(4)]

        for phys in range(4):
            vv = m.const(0, width=1)
            dd = m.const(0, width=128)
            for s in range(4):
                for k in range(4):
                    lane = (s + k) & 3
                    if lane != phys:
                        continue
                    hit = pvs[s][0][k]
                    cond = is_s[s] & hit
                    vv = cond.select(m.const(1, width=1), vv)
                    dd = cond.select(lane_data0[phys], dd)
            out_v[phys] = vv
            out_d[phys] = dd
            commit_pop[phys] = vv

        for i in range(4):
            out_vld_r[i].set(out_v[i])
            out_data_r[i].set(out_v[i].select(out_d[i], m.const(0, width=128)))

        next_ptr = (start + commit_cnt[0:2])[0:2]
        commit_ptr.set(next_ptr)

        for lane in range(4):
            inc4 = commit_pop[lane].select(m.const(4, width=SEQ_W), m.const(0, width=SEQ_W))
            exp_seq[lane].set(exp_seq[lane].out() + inc4)

        # ---- ROB update: insert completion then shift on commit ----
        for lane in range(4):
            delta = (ins_seq[lane] - exp_seq[lane].out()) >> 2

            v_ins: list[Wire] = []
            d_ins: list[Wire] = []
            for i in range(ROB_DEPTH):
                hit = ins_fire[lane] & delta.eq(i)
                v_ins.append(hit.select(m.const(1, width=1), rob_v[lane][i].out()))
                d_ins.append(hit.select(ins_data[lane], rob_d[lane][i].out()))

            for i in range(ROB_DEPTH):
                if i + 1 < ROB_DEPTH:
                    v_nx = commit_pop[lane].select(v_ins[i + 1], v_ins[i])
                    d_nx = commit_pop[lane].select(d_ins[i + 1], d_ins[i])
                else:
                    v_nx = commit_pop[lane].select(m.const(0, width=1), v_ins[i])
                    d_nx = commit_pop[lane].select(m.const(0, width=128), d_ins[i])
                rob_v[lane][i].set(v_nx)
                rob_d[lane][i].set(d_nx)

        # ---- history update: shift down by commit_cnt, insert committed at top ----
        commit_seqs: list[Wire] = []
        commit_datas: list[Wire] = []
        for k in range(4):
            lane_k = (start + m.const(k, width=2))[0:2]
            s_val = m.const(0, width=SEQ_W)
            d_val = m.const(0, width=128)
            for lane in range(4):
                is_l = lane_k.eq(lane)
                s_val = is_l.select(exp_seq[lane].out(), s_val)
                d_val = is_l.select(lane_data0[lane], d_val)
            commit_seqs.append(s_val)
            commit_datas.append(d_val)

        for i in range(HIST_DEPTH):
            v_next = hist_v[i].out()
            s_next = hist_s[i].out()
            d_next = hist_d[i].out()

            for cc in range(1, 5):
                if i < cc:
                    idx = cc - 1 - i
                    v_cc = m.const(1, width=1)
                    s_cc = commit_seqs[idx]
                    d_cc = commit_datas[idx]
                else:
                    src = i - cc
                    v_cc = hist_v[src].out()
                    s_cc = hist_s[src].out()
                    d_cc = hist_d[src].out()

                is_cc = commit_cnt.eq(cc)
                v_next = is_cc.select(v_cc, v_next)
                s_next = is_cc.select(s_cc, s_next)
                d_next = is_cc.select(d_cc, d_next)

            hist_v[i].set(v_next)
            hist_s[i].set(s_next)
            hist_d[i].set(d_next)

    # ==================================================================
    # BKPR: backpressure based on shadow counts
    # ==================================================================
    with m.scope("BKPR"):
        bkpr_next = m.const(0, width=1)
        for lane in range(4):
            push_i = push_fire[lane].zext(width=16)
            pop_i = lane_pop[lane].zext(width=16)
            cnt_next = shadow_cnt[lane].out() + push_i - pop_i
            shadow_cnt[lane].set(cnt_next)
            near_full = cnt_next.uge(Q_DEPTH - BKPR_SLACK)
            bkpr_next = bkpr_next | near_full
        bkpr_r.set(bkpr_next)

    # ==================================================================
    # MODULE OUTPUTS
    # ==================================================================
    m.output("pkt_in_bkpr", bkpr_r.out())
    for i in range(4):
        m.output(f"lane{i}_pkt_out_vld", out_vld_r[i].out())
        m.output(f"lane{i}_pkt_out_data", out_data_r[i].out())
    for e in range(N_ENG):
        m.output(f"fwd{e}_pkt_data_vld", fwd_vld_w[e])
        m.output(f"fwd{e}_pkt_data", fwd_data_w[e])
        m.output(f"fwd{e}_pkt_lat", fwd_lat_w[e])
        m.output(f"fwd{e}_pkt_dp_vld", fwd_dp_vld_w[e])
        m.output(f"fwd{e}_pkt_dp_data", fwd_dp_data_w[e])


build.__pycircuit_name__ = "FastFwdV2"
