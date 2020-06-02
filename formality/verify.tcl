set_svf -append { ../synthesis/default.svf }
read_vhdl -container r -libname WORK -2008 { ../vhdl/alu.vhd ../vhdl/idec.vhd ../vhdl/n_bit_register.vhd ../vhdl/pic16f84a_pkg.vhd ../vhdl/program_mem.vhd ../vhdl/ram.vhd ../vhdl/top.vhd }
set_top r:/WORK/top
read_verilog -container i -libname WORK -05 { ../netlist/pic16f84a.v }
read_db { ../techlibs/slow.db }
set_top i:/WORK/top
match
verify
