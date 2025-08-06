# ============================================================================
# Makefile for simulation with xrun (Xcelium)
# Supports RTL simulation (run/wave)
# ============================================================================

TOP = tb_dummy
SRCS = dummy.sv tb_dummy.sv
SDF_FILE = dummy.sdf

XRUN_FLAGS = -sv -timescale 1ns/1ps -access +rwc
DEFINE     = -define SDF_TEST

all: zero_delay

# ============================================================================
# RTL simulation - zero delay
# ============================================================================
zero_delay:
	xrun $(XRUN_FLAGS) $(SRCS) -delay_mode zero -log xrun_zero.log

# ============================================================================
# RTL simulation - unit delay
# ============================================================================
unit_delay:
	xrun $(XRUN_FLAGS) $(SRCS) -delay_mode unit -log xrun_unit.log

# ============================================================================
# RTL simulation - sdf file
# ============================================================================
sdf_delay:
	xrun $(XRUN_FLAGS) $(SRCS) $(DEFINE) -log xrun_sdf.log

# ============================================================================
# RTL simulation with GUI (SimVision)
# ============================================================================
wave_zero:
	xrun -gui $(XRUN_FLAGS) $(SRCS) -delay_mode zero -log xrun_zero.log

wave_unit:
	xrun -gui $(XRUN_FLAGS) $(SRCS) -delay_mode unit -log xrun_unit.log

wave_sdf:
	xrun -gui $(XRUN_FLAGS) $(SRCS) $(DEFINE) -log xrun_sdf.log

clean:
	rm -rf xrun* *.log waves.shm xcelium.d* Annotation* *.diag
