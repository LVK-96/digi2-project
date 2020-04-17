-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.pic16f84a.all;

entity ram is
  port (
    clk        : in  std_logic;
    --
    d_in       : in  std_logic_vector(n - 1 downto 0);
    status_in  : in  std_logic_vector(n - 1 downto 0);
    pc_in      : in  std_logic_vector(pc_n - 1 downto 0);
    addr       : in  std_logic_vector(n - 1 downto 0);
    we         : in  std_logic;
    status_we  : in  std_logic;
    pc_we      : in  std_logic;
    reset      : in  std_logic;
    --
    d_out      : out std_logic_vector(n - 1 downto 0);
    pc_out     : out std_logic_vector(pc_n - 1 downto 0);
    status_out : out std_logic_vector(n - 1 downto 0);
    porta      : out std_logic_vector(porta_n - 1 downto 0);
    portb      : out std_logic_vector(portb_n - 1 downto 0)
  );
end entity ram;

architecture rtl of ram is
  signal memory : mem_array_8;
  constant indf_addr   : integer := 16#00#;
  constant pcl_addr    : integer := 16#02#;
  constant status_addr : integer := 16#03#;
  constant fsr_addr    : integer := 16#04#;
  constant porta_addr  : integer := 16#05#;
  constant portb_addr  : integer := 16#06#;
  constant pch_addr    : integer := 16#0A#;
begin
  status_out <= memory(status_addr);
  pc_out <= pc_in when pc_we = '1' else memory(pch_addr)(4 downto 0) & memory(pcl_addr);

  porta <= memory(porta_addr)(porta_n - 1 downto 0);
  portb <= memory(portb_addr);

  with to_integer(unsigned(addr)) select d_out <=
    memory(to_integer(unsigned(memory(fsr_addr)))) when indf_addr,
    "00000000" when pch_addr, -- pch is not explicitly readable
    memory(to_integer(unsigned(addr))) when others;

  process(clk, reset)
    variable addr_int : integer;
  begin
    if (reset = '1') then
      memory <= (others => (others => '0'));
    end if;
    if rising_edge(clk) then
      if status_we = '1' then
        memory(status_addr)(2 downto 0) <= status_in(2 downto 0);
      end if;

      if pc_we = '1' then
        memory(pcl_addr) <= pc_in(n - 1 downto 0);
        memory(pch_addr)(4 downto 0) <= pc_in(pc_n - 1 downto n);
      end if;

      addr_int := to_integer(unsigned(addr));
      if we = '1' and addr_int /= pch_addr then -- pch is not explicitly writeable
        -- According to the datasheet, write to 3 low status bits is disabled if the instruction affects status
        -- and bits 3 and 4 of the status register are not writeable
        if addr_int = status_addr then
          assert false report "Writing result to status register" severity note;
          if status_we = '1' then
            memory(status_addr)(n - 1 downto 5) <= d_in(n - 1 downto 5);
          else
            memory(status_addr)(n - 1 downto 5) <= d_in(n - 1 downto 5);
            memory(status_addr)(2 downto 0) <= d_in(2 downto 0);
          end if;
        else
          memory(addr_int) <= d_in;
        end if;
      end if;
    end if;
  end process;
end architecture rtl;
