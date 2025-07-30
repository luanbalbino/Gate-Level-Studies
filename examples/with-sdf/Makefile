# Default target
all: run

# Variables
TOP ?= skew
RTL_FILE = $(TOP).sv
TB_FILE = tb_$(TOP).sv
SRCS = $(RTL_FILE) $(TB_FILE)
XRUN_FLAGS = -sv -timescale 1ns/1ps -access +rwc
DIR = $(TOP)
TB_MODULE = tb

run:
	cd $(DIR) && xrun $(XRUN_FLAGS) -top $(TB_MODULE) $(SRCS)

wave:
	cd $(DIR) && xrun -gui $(XRUN_FLAGS) -top $(TB_MODULE) $(SRCS)

clean:
	cd $(DIR) && rm -rf INCA_libs xcelium.d xrun.* *.log *.shm *.key *.history Annotation* .simvision*

clean_all:
	find . -type f \( \
		-name "xrun.*" -o \
		-name "*.log" -o \
		-name "*.shm" -o \
		-name "*.key" -o \
		-name "*.history" -o \
		-name "Annotation*" \) -delete

	find . -type d \( \
		-name "INCA_libs" -o \
		-name "xcelium.d" -o \
		-name ".simvision*" \) -exec rm -rf {} +

help:
	@echo "Usage:"
	@echo "  make run TOP=<name_of_folder>      # Run simulation for given folder"
	@echo "  make wave TOP=<name_of_folder>     # Run simulation with waveform GUI"
	@echo "  make clean TOP=<name_of_folder>    # Clean simulation files in the folder"
	@echo "  make clean_all                     # Clean simulation files in all folders"
	@echo ""
	@echo "Variables:"
	@echo "  TOP    : Folder and top module name (default: skew)"
	@echo "  XRUN_FLAGS : Flags passed to xrun simulator"
	@echo ""
	@echo "Dependencies:"
	@echo "  - Cadence Xcelium (xrun)"
	@echo "  - Make"
	@echo ""
	@echo "Notes:"
	@echo "  Using xrun by default; you can modify for other simulators if needed."