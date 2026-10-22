set design_dir "$::env(FLOW_HOME)/results/sky130hd/traffic_light/base"
set corner $::env(CORNER)
set lib "$::env(FLOW_HOME)/timing_libs/sky130hd/sky130_fd_sc_hd__${corner}.lib"
set report_dir "$::env(REPORT_DIR)"

file mkdir $report_dir

puts "Loading PVT corner: $corner"
puts "Liberty: $lib"

read_liberty $lib
read_db $design_dir/6_final.odb
read_sdc $design_dir/6_final.sdc
read_spef $design_dir/6_final.spef

check_setup

report_checks -path_delay max -format full_clock_expanded \
    -fields {slew cap fanout input_pin net} \
    -digits 4 > $report_dir/setup_timing.rpt

report_checks -path_delay min -format full_clock_expanded \
    -fields {slew cap fanout input_pin net} \
    -digits 4 > $report_dir/hold_timing.rpt

report_worst_slack -max > $report_dir/worst_setup_slack.rpt
report_worst_slack -min > $report_dir/worst_hold_slack.rpt
report_wns > $report_dir/wns.rpt
report_tns > $report_dir/tns.rpt

puts "Completed post-route STA for $corner"
exit
