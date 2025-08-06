# Simulator selection: 'xcelium' (default) or 'modelsim'
sim ?= xcelium

# Top-level module
ifndef TOP
$(error TOP not defined. Use: make <target> TOP=tb_name)
endif

DIR := $(TOP)

SRC := $(wildcard $(DIR)/*.v) $(wildcard $(DIR)/*.sv)

# ============================================================================
# ModelSim targets
# ============================================================================
run_modelsim:
	@echo "Executando ModelSim com TOP=$(TOP)"
	@vlib work
	@vlog $(SRC)
	@vsim -c $(TOP) -voptargs=+acc -do "run -all"

wave_modelsim:
	@echo "Executando ModelSim GUI com TOP=$(TOP)"
	@vlib work
	@vlog $(SRC)
	@vsim $(TOP) -do "add wave *; run -all"

clean_modelsim:
	@rm -rf work transcript vsim.wlf *.log *.vcd

# ============================================================================
# Xcelium targets
# ============================================================================
run_xcelium:
	@echo "Executando Xcelium com TOP=$(TOP)"
	xrun -sv -timescale 1ns/1ps -access +rwc $(SRC)

wave_xcelium:
	@echo "Executando Xcelium GUI com TOP=$(TOP)"
	xrun -sv -timescale 1ns/1ps -access +rwc -gui $(SRC)

clean_xcelium:
	@rm -rf INCA_libs xcelium.d xrun.* *.log *.shm *.key *.history Annotation* .simvision

# ============================================================================
# Simulation 
# ============================================================================
run:
	$(MAKE) run_$(sim) TOP=$(TOP)

wave:
	$(MAKE) wave_$(sim) TOP=$(TOP)

clean:
	$(MAKE) clean_$(sim)
