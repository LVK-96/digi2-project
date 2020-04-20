-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pic16f84a.all;
use work.read_intel_hex_pack.all;

entity program_mem is
  port (
    addr          : in    std_logic_vector(pc_n - 1 downto 0);
    reset         : in    std_logic;
    --
    d_out         : out   std_logic_vector(instruction_n - 1 downto 0)
  );
end entity program_mem;

architecture rtl of program_mem is
  signal memory : program_array;
begin
  d_out <= memory(to_integer(unsigned(addr)));

  process(reset)
    variable hex_prog_read : program_array := (others => (others => '0'));
  begin
    if reset = '1' then
    -- Read program from hexfile and write it to program memory
      read_ihex_file("../piklab/quickmafs/quickmafs.hex", hex_prog_read);
      memory <= hex_prog_read;
    end if;
  end process;
end architecture rtl;
