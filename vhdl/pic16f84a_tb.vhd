-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.pic16f84a.all;

entity pic16f84a_tb is
end entity pic16f84a_tb;

architecture behav of pic16f84a_tb is
  signal pc_reset          : std_logic;
  signal w_reg_reset       : std_logic;
  signal ram_reset         : std_logic;
  signal idec_reset        : std_logic;
  signal program_mem_reset : std_logic;
  signal idec_enable       : std_logic;
  signal porta             : std_logic_vector(porta_n - 1 downto 0);
  signal portb             : std_logic_vector(portb_n - 1 downto 0);
begin
  DUT : entity work.top
  port map (
    pc_reset          => pc_reset,
    w_reg_reset       => w_reg_reset,
    ram_reset         => ram_reset,
    idec_reset        => idec_reset,
    program_mem_reset => program_mem_reset,
    idec_enable       => idec_enable,
    porta             => porta,
    portb             => portb
  );

	run_sim : process is
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
    -- Enable idec and let the program run
    idec_enable <= '1';
    wait;
  end process run_sim;
end architecture behav;
