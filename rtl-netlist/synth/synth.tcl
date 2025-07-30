# ***************************************************************
# File: synth.tcl
# Description: Basic Synthesis script
# ***************************************************************

# --- Environment and Libraries Setup ---
set_db lib_search_path "SET YOUR PATH HERE"
set_db library {"typical.lib"}

set REPORT_DIR "./reports" ; 
set RESULT_DIR "./netlist" ; 

# Create output directories if they don't exist
catch {file mkdir $REPORT_DIR}
catch {file mkdir $RESULT_DIR}

set RTL_NAME "register_4bit"

read_hdl -sv ./RTL/${RTL_NAME}.sv; 

elaborate ;

# --- Constraints ---
create_clock -period 10 -waveform {0 5} [get_ports clk] 
set_input_delay 1.0 -max -clock clk [all_inputs] 
set_output_delay 1.0 -max -clock clk [all_outputs] 

set_false_path -from [get_ports reset] ; 

# --- Synthesis (Optimization) ---
syn_generic ;
syn_map ;
syn_opt ;

# --- Report Generation ---
report_area   > ${REPORT_DIR}/${RTL_NAME}_area.rpt
report_timing > ${REPORT_DIR}/${RTL_NAME}_timing.rpt
report_power  > ${REPORT_DIR}/${RTL_NAME}_power.rpt
report_qor    > ${REPORT_DIR}/${RTL_NAME}_qor.rpt ;

write_sdf -design ${RTL_NAME} -version 3.0 -setuphold split -recrem split > ./sdf/${RTL_NAME}.sdf

# --- Netlist Generation ---
write_netlist -language v2001 > ${RESULT_DIR}/${RTL_NAME}_netlist.v

exit
