-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pic16f84a.all;

entity program_mem is
  port (
    addr          : in    std_logic_vector(n - 1 downto 0);
    reset         : in    std_logic;
    --
    d_out         : out   std_logic_vector(instruction_n - 1 downto 0)
  );
end entity program_mem;

architecture rtl of program_mem is
  signal memory : mem_array_14 := init_inst;
begin
  d_out <= memory(to_integer(unsigned(addr)));

  process(reset)
  begin
    if reset = '1' then
      memory <= (others => (others => '0'));
    end if;
  end process;
end architecture rtl;
