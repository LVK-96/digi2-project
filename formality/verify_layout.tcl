read_verilog -container r -libname WORK -05 { ../netlist/pic16f84a.v } 
read_db { ../techlibs/slow.db } 
set_top r:/WORK/top 
read_verilog -container i -libname WORK -05 { ../netlist/pic16f84a_layout.v } 
set_top i:/WORK/top 
match 
verify
