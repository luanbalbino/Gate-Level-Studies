# Default target
all: run

# Variables
TOP ?= register_4bit
NETLIST_FILE = ./netlist/$(TOP)_netlist.v
SYNTH_FILE = ./synth/synth.tcl
RTL_FILE = ./RTL/$(TOP).sv
TB_FILE  = ./tb/tb_$(TOP).sv

# TODO: Set the correct path to your standard cell library below
STD_LIB_PATH = # include your library
STD_LIB = # specify your .v file from library

ifeq ($(STD_LIB),)
$(error [ERROR] STD_LIB not defined. Please set STD_LIB_PATH and STD_LIB to your library .v file)
endif

SRCS_NETLIST = $(NETLIST_FILE) $(TB_FILE)
SRCS_RTL = $(RTL_FILE) $(TB_FILE)

SEED = random

# Common flags
COMMON_FLAGS = -sv -timescale 1ns/1ps -access +rwc -v $(STD_LIB)

# Gate-level sim flags
XRUN_FLAGS = $(COMMON_FLAGS) -sdf_cmd_file ./sdf/cmd_files/sdf_cmd_file_${TOP} 

run_synthesis:
	genus -f $(SYNTH_FILE)

run_netlist:
	xrun $(XRUN_FLAGS) -top tb_$(TOP) $(SRCS_NETLIST) -svseed $(SEED)

wave_netlist:
	xrun -gui $(XRUN_FLAGS) -top tb_$(TOP) $(SRCS_NETLIST) -svseed $(SEED)

run_rtl:
	xrun $(COMMON_FLAGS) -top tb_$(TOP) $(SRCS_RTL) -svseed $(SEED)

wave_rtl:
	xrun -gui $(COMMON_FLAGS) -top tb_$(TOP) $(SRCS_RTL) -svseed $(SEED)


clean:
	rm -rf INCA_libs xcelium.d xrun.* *.log *.shm *.key *.history Annotation* .simvision* *.X *.log*

clean_all:
	find . -type f \( \
		-name "xrun.*" -o \
		-name "*.log" -o \
		-name "*.shm" -o \
		-name "*.key" -o \
		-name "*.history" -o \
		-name "*.log*" -o \
		-name "*.cmd*" -o \
		-name "*.tstamp*" -o \
		-name "*.diag" -o \
		-name "Annotation*" \) -delete

	find . -type d \( \
		-name "INCA_libs" -o \
		-name "xcelium.d" -o \
		-name ".simvision*" \) -exec rm -rf {} +
