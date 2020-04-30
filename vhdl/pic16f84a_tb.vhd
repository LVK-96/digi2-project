-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.pic16f84a.all;
use work.read_intel_hex_pack.all;

entity pic16f84a_tb is
end entity pic16f84a_tb;

architecture behav of pic16f84a_tb is
  signal clk                  : std_logic := '1';
  signal pc_reset             : std_logic;
  signal w_reg_reset          : std_logic;
  signal ram_reset            : std_logic;
  signal idec_reset           : std_logic;
  signal program_mem_reset    : std_logic;
  signal idec_enable          : std_logic;
  signal porta                : std_logic_vector(porta_n - 1 downto 0);
  signal portb                : std_logic_vector(portb_n - 1 downto 0);
  signal program_mem_we       : std_logic;
  signal program_mem_d_in     : std_logic_vector(instruction_n - 1 downto 0);
  signal program_mem_addr_in  : std_logic_vector(pc_n - 1 downto 0);
begin
  clk <= not clk after half_period;

  DUT : entity work.top
  port map (
    clk                  => clk,
    pc_reset             => pc_reset,
    w_reg_reset          => w_reg_reset,
    ram_reset            => ram_reset,
    idec_reset           => idec_reset,
    program_mem_reset    => program_mem_reset,
    idec_enable          => idec_enable,
    porta                => porta,
    portb                => portb,
    program_mem_we       => program_mem_we,
    program_mem_d_in     => program_mem_d_in,
    program_mem_addr_in  => program_mem_addr_in
  );

	run_sim : process is
    variable hex_prog_read : program_array := (others => (others => '0'));
	begin
    -- Reset things
    pc_reset          <= '1';
    w_reg_reset       <= '1';
    ram_reset         <= '1';
    idec_reset        <= '1';
    program_mem_reset <= '1';
    idec_enable       <= '0';
    wait for 1 ns;
    pc_reset          <= '0';
    w_reg_reset       <= '0';
    ram_reset         <= '0';
    idec_reset        <= '0';
    program_mem_reset <= '0';
    wait for half_period - 1 ns;
    -- Read the hex file and write it to program memory
    read_ihex_file("../piklab/quickmafs/quickmafs.hex", hex_prog_read);
    program_mem_we <= '1';
    for i in 0 to inst_mem_size - 1 loop
      program_mem_addr_in <= std_logic_vector(to_unsigned(i, program_mem_addr_in'length));
      program_mem_d_in <= hex_prog_read(i);
      wait for period;
    end loop;
    program_mem_we <= '0';
    wait for half_period;

    -- Enable idec and let the program run
    idec_enable <= '1';
    wait;
  end process run_sim;
end architecture behav;
