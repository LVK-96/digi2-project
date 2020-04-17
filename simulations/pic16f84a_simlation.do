vlib work
vcom -work work -2008 ../vhdl/pic16f84a_pkg.vhd ../vhdl/alu.vhd ../vhdl/ram.vhd ../vhdl/program_mem.vhd ../vhdl/n_bit_register.vhd ../vhdl/idec.vhd ../vhdl/top.vhd ../vhdl/pic16f84a_tb.vhd

vsim work.pic16f84a_tb
add wave -noupdate -divider common
add wave dut.clk
add wave idec_enable

add wave -noupdate -divider program_mem
add wave dut.program_mem.addr
add wave dut.program_mem.d_out

add wave -noupdate -divider ram
add wave dut.ram.we
add wave dut.ram.addr
add wave dut.ram.d_in
add wave dut.ram.d_out

add wave -noupdate -divider status_reg
add wave dut.ram.status_we
add wave dut.ram.memory(16#03)
add wave dut.ram.status_in
add wave dut.ram.status_out

add wave -noupdate -divider pc
add wave dut.pc.we
add wave dut.pc.reg
add wave dut.pc.d_in
add wave dut.pc.d_out

add wave -noupdate -divider w
add wave dut.w_reg.reg
add wave dut.w_reg.we
add wave dut.w_reg.d_in
add wave dut.w_reg.d_out

add wave -noupdate -divider alu
add wave dut.alu.enable
add wave dut.alu.w
add wave dut.alu.fl
add wave dut.alu.operation
add wave dut.alu.bit_select
add wave dut.alu.status_in
add wave dut.alu.result
add wave dut.alu.status

add wave -noupdate -divider idec
add wave dut.idec.pc_in
add wave dut.idec.instruction_in
add wave dut.idec.operation_out
add wave dut.idec.literal_flag
add wave dut.idec.fl_out
add wave dut.idec.bit_select_out
add wave dut.idec.pc_out
add wave dut.idec.state
run 6400ns
wave zoom full
