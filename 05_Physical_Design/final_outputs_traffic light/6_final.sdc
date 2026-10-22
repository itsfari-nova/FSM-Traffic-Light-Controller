vscode@codespaces-2693b8:~/Desktop/OpenROAD-flow-scripts/flow$ head -70 results/sky130hd/traffic_light/base/6_final.sdc
###############################################################################
# Created by write_sdc
###############################################################################
current_design traffic_light
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 20.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {clk}]
set_input_delay 1.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {countdown[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {countdown[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {countdown[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {countdown[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {countdown[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {countdown[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {green}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {red}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_tens[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {seg_units[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {yellow}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
