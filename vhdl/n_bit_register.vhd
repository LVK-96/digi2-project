-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use work.pic16f84a.all;

entity n_bit_register is
  generic (
    n : natural
  );
  port (
    clk           : in    std_logic;
    --
    d_in          : in    std_logic_vector(n - 1 downto 0);
    we            : in    std_logic;
    reset         : in    std_logic;
    --
    d_out         : out   std_logic_vector(n - 1 downto 0)
  );
end entity n_bit_register;

architecture rtl of n_bit_register is
  signal reg : std_logic_vector(n - 1 downto 0);
begin
  d_out <= reg;

  process(clk, reset)
  begin
    if reset = '1' then
      reg <= (others => '0');
    end if;
    if rising_edge(clk) then
      if we = '1' then
        reg <= d_in;
      end if;
    end if;
  end process;
end architecture rtl;
