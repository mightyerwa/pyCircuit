# FastFWD V3.4 Testbench Makefile

# Tools
IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave
PYTHON = python3

# Directories
TB_DIR = .
RTL_DIR = ../verilog_auto
FE_DIR = ../../../contrib/fastfwd

# Source files
TB_TOP = $(TB_DIR)/tb_fastfwd_v3_4.v
DUT_TOP = $(RTL_DIR)/fastfwd_v3_4.v
CORE = $(RTL_DIR)/fastfwd_v3_4_core.v
FE = $(FE_DIR)/fe.v

# Runtime files
RUNTIME = ../../../runtime/verilog/pyc_reg.v \
          ../../../runtime/verilog/pyc_fifo.v \
          ../../../runtime/verilog/pyc_sync_mem.v \
          ../../../runtime/verilog/pyc_sync_mem_dp.v

# Output
VVP_FILE = tb_fastfwd_v3_4.vvp
VCD_FILE = tb_fastfwd_v3_4.vcd

# Test vectors directory
VECTOR_DIR = test_vectors

.PHONY: all compile run view clean test-vectors test-full

all: compile run

# Compile Verilog
compile:
	@echo "========================================"
	@echo "Compiling FastFWD V3.4 Testbench..."
	@echo "========================================"
	$(IVERILOG) -g2012 -o $(VVP_FILE) $(TB_TOP) $(DUT_TOP) $(CORE) $(FE) $(RUNTIME)
	@echo "Compilation complete: $(VVP_FILE)"

# Run simulation
run:
	@echo "========================================"
	@echo "Running simulation..."
	@echo "========================================"
	$(VVP) $(VVP_FILE)
	@echo "Simulation complete"

# Run with VCD dump
run-vcd:
	@echo "========================================"
	@echo "Running simulation with VCD..."
	@echo "========================================"
	$(VVP) -vcd $(VCD_FILE) $(VVP_FILE)
	@echo "VCD file generated: $(VCD_FILE)"

# View waveform
view: run-vcd
	@echo "Opening GTKWave..."
	$(GTKWAVE) $(VCD_FILE) &

# Generate test vectors from reference model
test-vectors:
	@echo "========================================"
	@echo "Generating test vectors from reference model..."
	@echo "========================================"
	mkdir -p $(VECTOR_DIR)
	$(PYTHON) ref_model.py --test single --output $(VECTOR_DIR)/test.hex
	$(PYTHON) ref_model.py --test fe --output $(VECTOR_DIR)/test.hex
	$(PYTHON) ref_model.py --test dep --output $(VECTOR_DIR)/test.hex
	@echo "Test vectors generated in $(VECTOR_DIR)/"

# Full test with reference model comparison
test-full: test-vectors compile run
	@echo "========================================"
	@echo "Full test complete"
	@echo "========================================"

# Clean generated files
clean:
	rm -f $(VVP_FILE) $(VCD_FILE)
	rm -rf $(VECTOR_DIR)
	rm -f *.vcd
	@echo "Cleaned generated files"

# Help
help:
	@echo "FastFWD V3.4 Testbench Makefile"
	@echo ""
	@echo "Targets:"
	@echo "  make compile      - Compile Verilog sources"
	@echo "  make run          - Run simulation"
	@echo "  make run-vcd      - Run simulation with VCD output"
	@echo "  make view         - Open waveform viewer (GTKWave)"
	@echo "  make test-vectors - Generate test vectors from Python reference model"
	@echo "  make test-full    - Full test with reference model comparison"
	@echo "  make clean        - Remove generated files"
	@echo "  make help         - Show this help"
