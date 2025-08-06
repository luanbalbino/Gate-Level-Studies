# ============================================================================
# Makefile for simulation with xrun (Xcelium)
# Supports RTL simulation (run/wave) and placeholder for GLS
# ============================================================================

TOP = tb_dummy
SRCS = dummy.sv tb_dummy.sv
SDF_FILE = dummy.sdf \
		   second_dummy

XRUN_FLAGS = -sv -timescale 1ns/1ps -access +rwc
DEFINE     = -define SDF_TEST

all: zero_delay

# ============================================================================
# RTL simulation - zero delay
# ============================================================================
zero_delay: clean
	xrun $(XRUN_FLAGS) $(SRCS) -delay_mode zero -log xrun_zero.log

# ============================================================================
# RTL simulation - unit delay
# ============================================================================
unit_delay:
	xrun $(XRUN_FLAGS) $(SRCS) -delay_mode unit -log xrun_unit.log

# ============================================================================
# RTL simulation - sdf file
# ============================================================================
sdf_delay: clean
	xrun $(XRUN_FLAGS) $(SRCS) $(DEFINE) -log xrun_sdf.log

# ============================================================================
# RTL simulation with GUI (SimVision)
# ============================================================================
wave_zero:
	xrun -gui $(XRUN_FLAGS) $(SRCS) -delay_mode zero -log xrun_zero.log

wave_unit:
	xrun -gui $(XRUN_FLAGS) $(SRCS) -delay_mode unit -log xrun_unit.log

wave_sdf: clean
	xrun -gui $(XRUN_FLAGS) $(SRCS) $(DEFINE) -log xrun_sdf.log

# ============================================================================
# Placeholder for Gate-Level Simulation (GLS)
# ============================================================================
gls:
	@echo "[INFO] To run GLS, the netlist must be available and SDF properly annotated."
	@echo "[INFO] You can use GENUS or other tools to generate the netlist and SDF file. For This example, it's not necessary"
	@echo "[INFO] Update the SRCS list and/or insert the \$sdf_annotate call in your testbench."

clean:
	rm -rf xrun* *.log waves.shm xcelium.d* Annotation* *.diag
