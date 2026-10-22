# ==========================================
# Static Timing Analysis (STA)
# FSM Based Traffic Light Controller
# SKY130 HD - TT 025C 1.80V
# ==========================================

# Read the standard-cell timing library
read_liberty /data/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read the synthesized SKY130 netlist
read_verilog /data/traffic_light/traffic_light_sky130.v

# Link the top-level design
link_design traffic_light

# Read timing constraints
read_sdc /data/traffic_light/traffic_light.sdc

# Report maximum-delay paths
puts "\n========== MAXIMUM DELAY PATHS =========="
report_checks -path_delay max

# Report minimum-delay paths
puts "\n========== MINIMUM DELAY PATHS =========="
report_checks -path_delay min

# Report worst setup slack
puts "\n========== WORST MAXIMUM SLACK =========="
report_worst_slack -max

# Report worst hold slack
puts "\n========== WORST MINIMUM SLACK =========="
report_worst_slack -min

puts "\n========== SETUP WNS AND TNS =========="
report_wns -max
report_tns -max

puts "\n========== MINIMUM-DELAY WNS AND TNS =========="
report_wns -min
report_tns -min

# End STA
exit

