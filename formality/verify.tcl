set_svf -append { /home/pt/lkivikun/digi2/pic16f84a/synthesis/default.svf }
read_vhdl -container r -libname WORK -2008 { /home/pt/lkivikun/digi2/pic16f84a/vhdl/alu.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/idec.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/n_bit_register.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/pic16f84a_pkg.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/program_mem.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/ram.vhd /home/pt/lkivikun/digi2/pic16f84a/vhdl/top.vhd }
set_top r:/WORK/top
read_verilog -container i -libname WORK -05 { /home/pt/lkivikun/digi2/pic16f84a/netlist/pic16f84a.v }
read_db { /home/pt/lkivikun/digi2/pic16f84a/techlibs/slow.db }
set_top i:/WORK/top
match
verify
