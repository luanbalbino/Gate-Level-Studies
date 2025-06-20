# ============================================================================
# Makefile for simulation with xrun (Xcelium)
# Supports RTL simulation (run/wave) and placeholder for GLS
# ============================================================================

TOP        = tb_setuphold
SRCS       = test_setuphold.sv tb_setuphold.sv

# this is an option too (withou annotate)
# SDF_FILE = dfsf.sdf
# and include this in XRUN_FLAGS like this: -sdf max:/tb/dff_inst=$(SDF_FILE)
XRUN_FLAGS = -sv -timescale 1ps/1ps -access +rwc
DEFINE     = -define SDF_TEST

# ============================================================================
# Default target
# ============================================================================
all: run

# ============================================================================
# RTL simulation in terminal (text mode)
# ============================================================================
run:
	xrun $(XRUN_FLAGS) $(SRCS) $(DEFINE)

# ============================================================================
# RTL simulation with GUI (SimVision)
# ============================================================================
wave:
	xrun -gui $(XRUN_FLAGS) $(SRCS) $(DEFINE)

# ============================================================================
# Placeholder for Gate-Level Simulation (GLS)
# ============================================================================
gls:
	@echo "[INFO] To run GLS, the netlist must be available and SDF properly annotated."
	@echo "[INFO] Update the SRCS list and/or insert the \$sdf_annotate call in your testbench."

# ============================================================================
# Clean up simulation-generated files
# ============================================================================
clean:
	rm -rf INCA_libs xcelium.d xrun.* *.log *.shm *.key *.history Annotation* .simvision

.PHONY: all run wave gls clean
