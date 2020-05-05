analyze -library WORK -format vhdl {/home/pt/lkivikun/digi2/pic16f84a/vhdl/pic16f84a_pkg.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/ram.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/program_mem.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/n_bit_register.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/idec.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/alu.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/top.vhd}
elaborate TOP -architecture RTL -library WORK
set_operating_conditions -library slow_vdd1v0 PVT_0P9V_125C
change_selection [all_inputs]
set_driving_cell  -lib_cell INVX1LVT  { {program_mem_addr_in[8]} {program_mem_d_in[5]} program_mem_reset {program_mem_addr_in[5]} {program_mem_d_in[3]} {program_mem_addr_in[12]} {program_mem_addr_in[3]} {program_mem_d_in[1]} {program_mem_d_in[8]} {program_mem_addr_in[10]} {program_mem_addr_in[2]} {program_mem_addr_in[9]} idec_enable w_reg_reset {program_mem_d_in[6]} {program_mem_d_in[11]} {program_mem_addr_in[0]} idec_reset clk {program_mem_addr_in[7]} {program_mem_d_in[13]} {program_mem_addr_in[6]} {program_mem_d_in[4]} pc_reset {program_mem_addr_in[4]} {program_mem_d_in[2]} {program_mem_d_in[9]} {program_mem_d_in[10]} {program_mem_addr_in[11]} ram_reset {program_mem_d_in[0]} {program_mem_d_in[7]} program_mem_we {program_mem_d_in[12]} {program_mem_addr_in[1]} }
set_load 0.001 [all_outputs]
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
set_dont_touch_network  [ find clock clk ]
set_clock_uncertainty -setup 1 clk
set_clock_transition 0.1 clk
change_selection [all_inputs]
change_selection [all_inputs]
set_input_delay -clock clk  -max -rise 2 "{program_mem_addr_in[8]} {program_mem_d_in[5]} {program_mem_addr_in[5]} {program_mem_d_in[3]} {program_mem_addr_in[12]} {program_mem_addr_in[3]} {program_mem_d_in[1]} {program_mem_d_in[8]} {program_mem_addr_in[10]} {program_mem_addr_in[2]} {program_mem_addr_in[9]} {program_mem_d_in[6]} {program_mem_d_in[11]} {program_mem_addr_in[0]} {program_mem_addr_in[7]} {program_mem_d_in[13]} {program_mem_addr_in[6]} {program_mem_d_in[4]} {program_mem_addr_in[4]} {program_mem_d_in[2]} {program_mem_d_in[9]} {program_mem_d_in[10]} {program_mem_addr_in[11]} {program_mem_d_in[0]} {program_mem_d_in[7]} program_mem_we {program_mem_d_in[12]} {program_mem_addr_in[1]}"
set_input_delay -clock clk -max -fall 2 "{program_mem_addr_in[8]} {program_mem_d_in[5]} {program_mem_addr_in[5]} {program_mem_d_in[3]} {program_mem_addr_in[12]} {program_mem_addr_in[3]} {program_mem_d_in[1]} {program_mem_d_in[8]} {program_mem_addr_in[10]} {program_mem_addr_in[2]} {program_mem_addr_in[9]} {program_mem_d_in[6]} {program_mem_d_in[11]} {program_mem_addr_in[0]} {program_mem_addr_in[7]} {program_mem_d_in[13]} {program_mem_addr_in[6]} {program_mem_d_in[4]} {program_mem_addr_in[4]} {program_mem_d_in[2]} {program_mem_d_in[9]} {program_mem_d_in[10]} {program_mem_addr_in[11]} {program_mem_d_in[0]} {program_mem_d_in[7]} program_mem_we {program_mem_d_in[12]} {program_mem_addr_in[1]}"
change_selection [all_outputs]
set_output_delay -clock clk  -max -rise 2 "{portb[0]} {porta[0]} {portb[2]} {porta[2]} {portb[1]} {porta[1]} {portb[4]} {porta[4]} {portb[3]} {porta[3]} {portb[6]} {portb[5]} {portb[7]}"
set_output_delay -clock clk -max -fall 2 "{portb[0]} {porta[0]} {portb[2]} {porta[2]} {portb[1]} {porta[1]} {portb[4]} {porta[4]} {portb[3]} {porta[3]} {portb[6]} {portb[5]} {portb[7]}"
set_output_delay -clock clk -min -rise 2 "{portb[0]} {porta[0]} {portb[2]} {porta[2]} {portb[1]} {porta[1]} {portb[4]} {porta[4]} {portb[3]} {porta[3]} {portb[6]} {portb[5]} {portb[7]}"
set_output_delay -clock clk  -min -fall 2 "{portb[0]} {porta[0]} {portb[2]} {porta[2]} {portb[1]} {porta[1]} {portb[4]} {porta[4]} {portb[3]} {porta[3]} {portb[6]} {portb[5]} {portb[7]}"
set_max_area 0
ungroup -all -flatten
compile_ultra
uplevel #0 { report_area }
uplevel #0 { report_power -analysis_effort low }
uplevel #0 { report_constraint -all_violators -significant_digits 6 }
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 10 -significant_digits 2 -sort_by group }
change_names -rules verilog -hierarchy
write -hierarchy -format verilog -output /home/pt/lkivikun/digi2/pic16f84a/netlist/pic16f84a.v
write_sdc ../timing/prelayout.sdc
