TOP = tb_nochange
SRCS = nochange.sv tb_nochange.sv

# this is an option too (withou annotate)
# SDF_FILE = dfsf.sdf
# and include this in XRUN_FLAGS like this: -sdf max:/tb/dff_inst=$(SDF_FILE)
XRUN_FLAGS = -sv  -timescale 1ns/1ps -access +rwc 

all: run

run:
	xrun $(XRUN_FLAGS) $(SRCS)

wave:
	xrun -gui $(XRUN_FLAGS) $(SRCS)

clean:
	rm -rf INCA_libs xcelium.d xrun.* *.log *.shm *.key *.history Annotation* .simvision
