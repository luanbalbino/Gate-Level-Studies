# Simulator selection: 'xcelium' (default) or 'modelsim'
sim ?= xcelium

# Top-level module and sources
TOP = tb_nand
SRC = nand.v tb_nand.sv

######################
# ModelSim targets
######################
run_modelsim:
	@vlib work
	@vlog $(SRC)
	@vsim -c $(TOP) -voptargs=+acc -do "run -all"

wave_modelsim:
	@vlib work
	@vlog $(SRC)
	@vsim $(TOP) -do "add wave *; run -all"

clean_modelsim:
	@rm -rf work transcript vsim.wlf *.log *.vcd

######################
# Xcelium targets
######################
run_xcelium:
	xrun -sv -timescale 1ns/1ps -access +rwc $(SRC)

wave_xcelium:
	xrun -sv -timescale 1ns/1ps -access +rwc -gui $(SRC)

clean_xcelium:
	rm -rf INCA_libs xcelium.d xrun.* *.log *.shm *.key *.history Annotation* .simvision

######################
# Simulator dispatcher
######################
run:
	$(MAKE) run_$(sim)

wave:
	$(MAKE) wave_$(sim)

clean:
	$(MAKE) clean_$(sim)
