read_verilog "../netlist/pic16f84a_layout.v"
set search_path "../techlibs/"
set link_library "fast.db"
link_design
source "../timing/postlayout.sdc"
read_parasitics "../timing/pic.spef"
report_constraint -all_violators > "./reports/hold_viol.rpt"
report_timing -delay_type max -max_paths 10 \
-slack_lesser_than 10 > "./reports/hold_check.rpt"
set power_enable_analysis true
report_power -verbose > "./reports/hold_power.rpt"
