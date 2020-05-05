-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pic16f84a.all;

entity program_mem is
  port (
    clk           : in    std_logic;
    we            : in    std_logic;
    addr          : in    std_logic_vector(pc_n - 1 downto 0);
    d_in          : in    std_logic_vector(instruction_n - 1 downto 0);
    reset         : in    std_logic;
    --
    d_out         : out   std_logic_vector(instruction_n - 1 downto 0)
  );
end entity program_mem;

architecture rtl of program_mem is
  signal memory : program_array;
begin
  d_out <= memory(to_integer(unsigned(addr)) mod inst_mem_size);

  process(clk, reset, d_in, we, addr)
  begin
    if reset = '1' then
      memory <= (others => (others => '0'));
    end if;
    if rising_edge(clk) and we = '1' then
      memory(to_integer(unsigned(addr)) mod inst_mem_size) <= d_in;
    end if;
  end process;
end architecture rtl;
