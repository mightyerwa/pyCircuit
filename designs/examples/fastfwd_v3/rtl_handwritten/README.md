# FastFWD V3 - Handwritten RTL

This folder contains **handwritten RTL implementations** for PPA (Power/Performance/Area) comparison with the generated version.

## Purpose

The `rtl/` folder contains auto-generated RTL from pyCircuit, which may not be optimal.
This `rtl_handwritten/` folder contains manually optimized RTL for comparison.

## Key Differences

### 1. FE Scheduler Constraint

| Version | Constraint | Behavior |
|---------|------------|----------|
| **Generated** (`rtl/`) | `finish_cycle > last_finish` | Too conservative |
| **Handwritten** (`rtl_handwritten/`) | `finish_cycle != existing_finish` | Correct |

**Why:** The constraint is to prevent two packets from outputting in the same cycle (single output port). Different finish cycles are fine, even if decreasing.

Example:
- Cycle 0: pkt0 lat=3 → finish@4
- Cycle 1: pkt1 lat=1 → finish@3
- 4 != 3, **ALLOWED** ✅

### 2. Dependency Timing

| Version | When dependency satisfied | Correct? |
|---------|---------------------------|----------|
| **Generated** | Packet enters FE | ❌ Wrong |
| **Handwritten** | Packet completes FE output | ✅ Correct |

**Why:** Dependency data comes from FE output, not FE input.

Example:
- seq=1 enters FE at Cycle 1, lat=2
- seq=1 outputs at Cycle 4
- seq=4 (dep=3) can enter at Cycle 5

## File Structure

```
rtl_handwritten/
├── README.md              # This file
├── input_collector.py     # Input collection module
├── fe_scheduler.py        # FE scheduling with correct constraint
├── dependency_resolver.py # (TODO) Dependency handling
├── rob.py                 # (TODO) Reorder buffer
├── output_scheduler.py    # (TODO) Output scheduling
└── fastfwd_v3.py          # Top module integrating all
```

## Generating Verilog

```bash
cd /path/to/pyCircuit
export PYTHONPATH=/path/to/pyCircuit/compiler/frontend:$PYTHONPATH

# Generate MLIR
python3 designs/examples/fastfwd_v3/rtl_handwritten/fe_scheduler.py

# Generate Verilog (requires pycc compiler)
pycc designs/examples/fastfwd_v3/mlir/fe_scheduler_handwritten.mlir -o verilog/
```

## PPA Comparison

| Metric | Generated RTL | Handwritten RTL | Notes |
|--------|---------------|-----------------|-------|
| Area | TBD | TBD | Compare after synthesis |
| Timing | TBD | TBD | Compare critical path |
| Power | TBD | TBD | Compare dynamic/leakage |
| Correctness | ❌ Constraint too tight | ✅ Correct constraint | Functional comparison |

## TODO

- [ ] Complete remaining modules (dependency_resolver, rob, output_scheduler)
- [ ] Generate Verilog for both versions
- [ ] Run synthesis and PPA analysis
- [ ] Document results

## Reference

See `../tb/test_system_timing.py` for the reference model that validates the correct constraint behavior.
