read_verilog -container r -libname WORK -05 { /home/pt/lkivikun/digi2/pic16f84a/netlist/pic16f84a.v } 
read_db { /home/pt/lkivikun/digi2/pic16f84a/techlibs/slow.db } 
set_top r:/WORK/top 
read_verilog -container i -libname WORK -05 { /home/pt/lkivikun/digi2/pic16f84a/netlist/pic16f84a_layout.v } 
set_top i:/WORK/top 
match 
verify
