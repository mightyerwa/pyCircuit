#include <cstdint>
#include <cstdlib>
#include <deque>
#include <iomanip>
#include <iostream>
#include <random>
#include <sstream>
#include <string>
#include <vector>

#include <pyc/cpp/pyc_tb.hpp>

#include "fastfwd_v2_gen.hpp"

using pyc::cpp::Testbench;
using pyc::cpp::Wire;

namespace {

constexpr int kTotalEng = 4;

// ---- port accessors (hardcoded for 4 lanes / 4 engines) ----

static Wire<1> &inVld(pyc::gen::FastFwdV2 &d, int l) {
  switch (l) {
  case 0: return d.lane0_pkt_in_vld;
  case 1: return d.lane1_pkt_in_vld;
  case 2: return d.lane2_pkt_in_vld;
  default: return d.lane3_pkt_in_vld;
  }
}
static Wire<128> &inData(pyc::gen::FastFwdV2 &d, int l) {
  switch (l) {
  case 0: return d.lane0_pkt_in_data;
  case 1: return d.lane1_pkt_in_data;
  case 2: return d.lane2_pkt_in_data;
  default: return d.lane3_pkt_in_data;
  }
}
static Wire<5> &inCtrl(pyc::gen::FastFwdV2 &d, int l) {
  switch (l) {
  case 0: return d.lane0_pkt_in_ctrl;
  case 1: return d.lane1_pkt_in_ctrl;
  case 2: return d.lane2_pkt_in_ctrl;
  default: return d.lane3_pkt_in_ctrl;
  }
}
static Wire<1> &outVld(pyc::gen::FastFwdV2 &d, int l) {
  switch (l) {
  case 0: return d.lane0_pkt_out_vld;
  case 1: return d.lane1_pkt_out_vld;
  case 2: return d.lane2_pkt_out_vld;
  default: return d.lane3_pkt_out_vld;
  }
}
static Wire<128> &outData(pyc::gen::FastFwdV2 &d, int l) {
  switch (l) {
  case 0: return d.lane0_pkt_out_data;
  case 1: return d.lane1_pkt_out_data;
  case 2: return d.lane2_pkt_out_data;
  default: return d.lane3_pkt_out_data;
  }
}
static Wire<1> &fwdVld(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwd0_pkt_data_vld;
  case 1: return d.fwd1_pkt_data_vld;
  case 2: return d.fwd2_pkt_data_vld;
  default: return d.fwd3_pkt_data_vld;
  }
}
static Wire<128> &fwdData(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwd0_pkt_data;
  case 1: return d.fwd1_pkt_data;
  case 2: return d.fwd2_pkt_data;
  default: return d.fwd3_pkt_data;
  }
}
static Wire<2> &fwdLat(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwd0_pkt_lat;
  case 1: return d.fwd1_pkt_lat;
  case 2: return d.fwd2_pkt_lat;
  default: return d.fwd3_pkt_lat;
  }
}
static Wire<1> &fwdDpVld(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwd0_pkt_dp_vld;
  case 1: return d.fwd1_pkt_dp_vld;
  case 2: return d.fwd2_pkt_dp_vld;
  default: return d.fwd3_pkt_dp_vld;
  }
}
static Wire<128> &fwdDpData(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwd0_pkt_dp_data;
  case 1: return d.fwd1_pkt_dp_data;
  case 2: return d.fwd2_pkt_dp_data;
  default: return d.fwd3_pkt_dp_data;
  }
}
static Wire<1> &fwdedVld(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwded0_pkt_data_vld;
  case 1: return d.fwded1_pkt_data_vld;
  case 2: return d.fwded2_pkt_data_vld;
  default: return d.fwded3_pkt_data_vld;
  }
}
static Wire<128> &fwdedData(pyc::gen::FastFwdV2 &d, int e) {
  switch (e) {
  case 0: return d.fwded0_pkt_data;
  case 1: return d.fwded1_pkt_data;
  case 2: return d.fwded2_pkt_data;
  default: return d.fwded3_pkt_data;
  }
}

// ---- Software FE model ----

class FeModel {
public:
  void driveDue(pyc::gen::FastFwdV2 &dut, std::uint64_t cycle) {
    for (int e = 0; e < kTotalEng; e++) {
      fwdedVld(dut, e) = Wire<1>(0);
      fwdedData(dut, e) = Wire<128>(0);

      Slot &s = pending_[e][cycle % kSlots];
      if (!s.valid || s.due != cycle)
        continue;
      fwdedVld(dut, e) = Wire<1>(1);
      fwdedData(dut, e) = s.data;
      s.valid = false;
    }
  }

  void capture(pyc::gen::FastFwdV2 &dut, std::uint64_t cycle) {
    for (int e = 0; e < kTotalEng; e++) {
      if (!fwdVld(dut, e).toBool())
        continue;

      std::uint64_t lat = fwdLat(dut, e).value() & 0x3u;
      std::uint64_t due = cycle + 2u + lat;

      Wire<128> in = fwdData(dut, e);
      Wire<128> dp = fwdDpVld(dut, e).toBool() ? fwdDpData(dut, e) : Wire<128>(0);
      Wire<128> out = in + dp;

      Slot &s = pending_[e][due % kSlots];
      if (s.valid) {
        std::cerr << "ERROR: FE collision eng=" << e << " due=" << due << "\n";
        std::exit(2);
      }
      s.valid = true;
      s.due = due;
      s.data = out;
    }
  }

private:
  static constexpr std::uint64_t kSlots = 16;
  struct Slot {
    bool valid = false;
    std::uint64_t due = 0;
    Wire<128> data{};
  };
  Slot pending_[kTotalEng][kSlots]{};
};

static std::string hex128(Wire<128> v) {
  std::ostringstream o;
  o << std::hex << std::setfill('0') << std::setw(16) << v.word(1)
    << std::setw(16) << v.word(0);
  return o.str();
}

// ---- main simulation ----

static int run(std::uint64_t seed, std::uint64_t maxCycles, std::uint64_t maxPkts) {
  pyc::gen::FastFwdV2 dut{};
  Testbench<pyc::gen::FastFwdV2> tb(dut);

  tb.addClock(dut.clk, 1);
  tb.reset(dut.rst, 2, 1);

  FeModel fe;
  std::mt19937_64 rng(seed);
  std::uniform_int_distribution<std::uint64_t> u64(0, ~std::uint64_t{0});
  std::uniform_int_distribution<std::uint64_t> latDist(0, 3);

  struct Expected {
    std::uint64_t seq;
    Wire<128> data;
  };

  std::deque<Expected> expQ;
  std::vector<Wire<128>> expBySeq;
  expBySeq.reserve(static_cast<std::size_t>(maxPkts));

  std::uint64_t sent = 0, got = 0, bkprCycles = 0;
  int outPtr = 0;
  std::uint64_t simCycle = 0;

  while (simCycle < maxCycles || !expQ.empty()) {
    std::uint64_t dutCyc = dut.seq_alloc.value(); // seq_alloc tracks allocations
    (void)dutCyc;
    const bool bkpr = dut.pkt_in_bkpr.toBool();
    if (bkpr) bkprCycles++;

    fe.driveDue(dut, simCycle);

    for (int l = 0; l < 4; l++) {
      inVld(dut, l) = Wire<1>(0);
      inData(dut, l) = Wire<128>(0);
      inCtrl(dut, l) = Wire<5>(0);
    }

    if (!bkpr && simCycle < maxCycles && sent < maxPkts) {
      bool heavy = simCycle >= maxCycles / 2;
      for (int l = 0; l < 4; l++) {
        if (sent >= maxPkts) break;
        unsigned p = heavy ? 85 : 45;
        bool doSend = (u64(rng) % 100) < p;
        if (!doSend) continue;

        std::uint64_t seq = sent;
        std::uint64_t maxDep = (seq < 7) ? seq : 7;
        std::uint64_t dep = 0;
        if (maxDep != 0) {
          std::uint64_t total = 14u + maxDep;
          std::uint64_t r = u64(rng) % total;
          dep = (r < 14u) ? 0u : (r - 13u);
        }
        std::uint64_t lat = latDist(rng);
        std::uint64_t ctrl = (lat & 0x3u) | ((dep & 0x7u) << 2u);

        std::uint64_t lo = u64(rng), hi = u64(rng);
        Wire<128> data({lo, hi});

        Wire<128> dpData = (dep != 0) ? expBySeq[static_cast<std::size_t>(seq - dep)] : Wire<128>(0);
        Wire<128> fwded = data + dpData;

        expBySeq.push_back(fwded);
        expQ.push_back(Expected{seq, fwded});
        sent++;

        inVld(dut, l) = Wire<1>(1);
        inData(dut, l) = data;
        inCtrl(dut, l) = Wire<5>(ctrl);
      }
    }

    dut.eval();
    fe.capture(dut, simCycle);

    tb.step(); // posedge

    // Check seq_alloc consistency
    if (dut.seq_alloc.value() != sent) {
      std::cerr << "FAIL: seq_alloc=" << dut.seq_alloc.value()
                << " sent=" << sent << " cyc=" << simCycle << "\n";
      return 1;
    }

    // Check outputs
    int ptr = outPtr;
    int produced = 0;
    for (; produced < 4; produced++) {
      if (!outVld(dut, ptr).toBool()) break;

      if (expQ.empty()) {
        std::cerr << "FAIL: unexpected output at cyc=" << simCycle
                  << " lane=" << ptr << "\n";
        return 1;
      }
      Expected exp = expQ.front();
      expQ.pop_front();
      Wire<128> o = outData(dut, ptr);
      if (o != exp.data) {
        std::cerr << "FAIL: data mismatch cyc=" << simCycle << " lane=" << ptr
                  << " exp_seq=" << exp.seq
                  << " got=" << hex128(o)
                  << " exp=" << hex128(exp.data)
                  << " (sent=" << sent << " got=" << got << ")\n";
        return 1;
      }
      got++;
      ptr = (ptr + 1) & 3;
    }

    for (int k = produced; k < 4; k++) {
      int lane = (outPtr + k) & 3;
      if (outVld(dut, lane).toBool()) {
        std::cerr << "FAIL: output hole cyc=" << simCycle
                  << " outPtr=" << outPtr << " lane=" << lane << "\n";
        return 1;
      }
    }

    outPtr = ptr;
    if (static_cast<std::uint64_t>(outPtr) != (dut.commit_ptr.value() & 0x3u)) {
      std::cerr << "FAIL: outPtr=" << outPtr
                << " commit_ptr=" << dut.commit_ptr.value()
                << " cyc=" << simCycle << "\n";
      return 1;
    }

    tb.step(); // negedge

    simCycle++;
    if (simCycle > maxCycles + 50000 && !expQ.empty()) {
      std::cerr << "FAIL: timeout, outstanding=" << expQ.size() << "\n";
      return 1;
    }
  }

  double thr = (simCycle == 0) ? 0.0 : static_cast<double>(got) / static_cast<double>(simCycle);
  std::cout << "ok: FastFwdV2 sent=" << sent << " got=" << got
            << " cycles=" << simCycle
            << " throughput=" << std::fixed << std::setprecision(3) << thr
            << " pkt/cyc"
            << " bkpr=" << std::fixed << std::setprecision(1)
            << (100.0 * static_cast<double>(bkprCycles) / static_cast<double>(simCycle))
            << "%\n";
  return 0;
}

} // namespace

int main(int argc, char **argv) {
  std::uint64_t seed = 1, cycles = 10000, packets = 30000;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (a == "--seed" && i + 1 < argc) { seed = std::stoull(argv[++i]); continue; }
    if (a == "--cycles" && i + 1 < argc) { cycles = std::stoull(argv[++i]); continue; }
    if (a == "--packets" && i + 1 < argc) { packets = std::stoull(argv[++i]); continue; }
    std::cerr << "unknown arg: " << a << "\n";
    return 2;
  }
  return run(seed, cycles, packets);
}
