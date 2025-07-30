# Study Examples

This repository contains RTL, testbenches, netlists, and scripts for study purposes.

---

## Structure

- `RTL/` – SystemVerilog source files  
- `tb/` – Testbenches  
- `sdf/` – SDF files for back-annotation simulation  
- `rtl-netlist/`  
  - `netlist/` – Synthesized Verilog netlists  
  - `reports/` – Synthesis reports  
  - `fv/` – (optional) formal verification files  
- `synth/` – Synthesis script (`synth.tcl`)  
- `waves/` – Waveform output files  
- `Makefile` – Build, simulate, synthesize, and clean automation

---

##  Usage

1. Set your standard cell library path in the `Makefile`:
   ```makefile
   STD_LIB_PATH = /path/to/your/library
   STD_LIB = $(STD_LIB_PATH)/your_lib.v
    ```
2. Makefile commands:

    ```bash
    make run_rtl TOP='<RTL_NAME>' # Compile and simulate RTL
    make wave_rtl TOP='<RTL_NAME>' # Open RTL waveform GUI

    make run_synthesis # Run synthesis (generate netlist and SDF)

    make run_netlist TOP='<RTL_NAME>' # Compile and simulate gate-level netlist
    make wave_netlist TOP='<RTL_NAME>' # Open gate-level waveform GUI

    make clean # Clean simulation outputs
    make clean_all  
    ```