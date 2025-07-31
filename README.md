# Gate-Level-Studies
This repository includes examples and tests made during my studies on gate level simulations.

## How to run
Each folder contains its own Makefile. Simply use the available targets in each folder to run the examples.

## Compilation/Simulation Options and brief description

| Option                    | Description                                                                                 |
| ------------------------- | ------------------------------------------------------------------------------------------- |
| `-nonotifier`             | Ignores notifiers when performing timing checks during elaboration.                         |
| `-delay_mode punit`       | Simulates the design in **precision unit delay** mode. All other timing checks are ignored. |
| `-delay_mode path`        | Simulates the design in **path delay** mode, except for modules without module path delays. |
| `-delay_mode distributed` | Simulates the design in **distributed delay** mode.                                         |
| `-delay_mode unit`        | Simulates the design in **unit delay** mode.                                                |
| `-delay_mode zero`        | Simulates all modules in **zero delay** mode.                                               |
| `-delay_mode none`        | Delays are simulated **as specified in the source** (default).                              |
| `-output`                 | Renames the SDF output file. By default, the name is `<original_name.X>`.                   |
| `-sdf_cmd_file`           | Pass SDF command file. E.g. xmelab/xrun top -sdf_cmd_file <filename>                            |
| `-sdf_verbose`            | Includes more detailed information in the log file.                                         |
| `$sdf_annotate`           | applies timing delay annotations to a design from an SDF file, during elaboration.          |
| `-sdf_simtime`            | To enable different annotation during the same simulation run                               |
| `-entchnetinfo`           | To report transition value information during violation report                              |



You can compile manually your SDF File with xmsdfc option
- xmsdfc [-options] <sdf_filename>

## Verilog x SDF notation
### *Verilog*: 
- $setup( D, posedge clk, 10 );  
- $hold( posedge clk, D, 10 );

### *SDF*: 
- ( SETUP D (posedge clk) (10) ) 
- ( HOLD D (posedge clk) (10) )




## `$sdf_annotate` Sintax

```systemverilog
$sdf_annotate ("sdf_file", [module_instance], ["config_file"], ["log_file"], ["mtm_spec"], ["scale_factors"],["scale_type"]);
```

## `-sdf_cmd_file` Usage

To apply delays via SDF in gate-level simulations with Xcelium, its possible to use an SDF command file that defines annotation parameters in a structured way. This file must contain at least one declaration of either SDF_FILE (for standard files) or COMPILED_SDF_FILE (for precompiled files with the .X extension).

``` bash
# Basic example
COMPILED_SDF_FILE = "Module.sdf.X",
SCOPE = Module:i1,
LOG_FILE = "sdf_name.log",
MTM_CONTROL = "MINIMUM", # can be Maximum Minimum, or typical
SCALE_FACTORS = ".201:1.01:3.01",
SCALE_TYPE = "FROM_MINIMUM";
```

### Parameters

| Parameter        | Description                                             | Required? |
|------------------|---------------------------------------------------------|-----------|
| `sdf_file`       | Path to the SDF file to be annotated                     | Yes       |
| `module_instance`| Module instance where the annotation will be applied    | Optional  |
| `config_file`    | Configuration file for the SDF                           | Optional  |
| `log_file`       | File to save annotation logs                             | Optional  |
| `mtm_spec`       | MTM (Multiple Timing Models) specification               | Optional  |
| `scale_factors`  | Scale factors for timing                                  | Optional  |
| `scale_type`     | Type of scaling applied (e.g., `MAXIMUM`, `MINIMUM`)     | Optional  |

#### *mtm_spec*: Specifies which delay value to annotate from the SDF

| Value       | Description                                       |
| ----------- | ------------------------------------------------- |
| `"MINIMUM"` | Annotates the **minimum** delay value             |
| `"TYPICAL"` | Annotates the **typical** delay value *(default)* |
| `"MAXIMUM"` | Annotates the **maximum** delay value             |