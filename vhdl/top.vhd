-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.pic16f84a.all;

entity top is
  port (
    signal pc_reset          : in std_logic;
    signal w_reg_reset       : in std_logic;
    signal ram_reset         : in std_logic;
    signal idec_reset        : in std_logic;
    signal program_mem_reset : in std_logic;
    signal idec_enable       : in std_logic;
    signal porta             : out std_logic_vector(porta_n - 1 downto 0);
    signal portb             : out std_logic_vector(portb_n - 1 downto 0)
  );
begin
end entity top;

architecture rtl of top is
  -- Common
  signal clk: std_logic := '1';

  -- Program counter
  signal pc_we       : std_logic;
  signal pc_d_out    : std_logic_vector(pc_n - 1 downto 0);

  -- W register
  signal w_reg_we    : std_logic;
  signal w_reg_d_out : std_logic_vector(n - 1 downto 0);

  -- RAM
  signal ram_d_out         : std_logic_vector(n - 1 downto 0);
  signal ram_status_out    : std_logic_vector(n - 1 downto 0);
  signal ram_we            : std_logic;
  signal status_we         : std_logic;
  signal ram_pc_out        : std_logic_vector(pc_n - 1 downto 0);

  -- Program memory
  signal program_mem_d_out : std_logic_vector(instruction_n - 1 downto 0);

  -- ALU
  signal alu_enable     : std_logic;
  signal alu_fl_in      : std_logic_vector(n - 1 downto 0);
  signal alu_result     : std_logic_vector(n - 1 downto 0);
  signal alu_operation  : operation;
  signal alu_bit_select : std_logic_vector(select_n - 1 downto 0);
  signal alu_status_out : std_logic_vector(n - 1 downto 0);

  -- Instruction decoder
  signal idec_fl_out     : std_logic_vector(n - 1 downto 0);
  signal idec_pc_out     : std_logic_vector(pc_n - 1 downto 0);
  signal literal_flag    : std_logic;
begin
  clk <= not clk after half_period;
  alu_fl_in <= idec_fl_out when literal_flag = '1' else ram_d_out;

  pc : entity work.n_bit_register
  generic map (pc_n)
  port map (
    clk   => clk,
    d_in  => ram_pc_out,
    we    => pc_we,
    reset => pc_reset,
    d_out => pc_d_out
  );

  w_reg : entity work.n_bit_register
  generic map (n)
  port map (
    clk   => clk,
    d_in  => alu_result,
    we    => w_reg_we,
    reset => w_reg_reset,
    d_out => w_reg_d_out
  );

  ram : entity work.ram
  port map (
    clk        => clk,
    d_in       => alu_result,
    status_in  => alu_status_out,
    pc_in      => idec_pc_out,
    addr       => idec_fl_out,
    we         => ram_we,
    pc_we      => pc_we,
    status_we  => status_we,
    reset      => ram_reset,
    d_out      => ram_d_out,
    status_out => ram_status_out,
    pc_out     => ram_pc_out,
    porta      => porta,
    portb      => portb
  );

  program_mem : entity work.program_mem
  port map (
    addr  => pc_d_out,
    reset => program_mem_reset,
    d_out => program_mem_d_out
  );

  alu : entity work.alu
  port map (
    enable     => alu_enable,
    w          => w_reg_d_out,
    fl         => alu_fl_in,
    operation  => alu_operation,
    bit_select => alu_bit_select,
    status_in  => ram_status_out,
    result     => alu_result,
    status     => alu_status_out
  );

  idec : entity work.idec
  port map (
    clk            => clk,
    enable         => idec_enable,
    reset          => idec_reset,
    pc_in          => pc_d_out,
    instruction_in => program_mem_d_out,
    fl_out         => idec_fl_out,
    bit_select_out => alu_bit_select,
    operation_out  => alu_operation,
    ram_we         => ram_we,
    status_we      => status_we,
    alu_enable     => alu_enable,
    literal_flag   => literal_flag,
    pc_we          => pc_we,
    w_reg_we       => w_reg_we,
    pc_out         => idec_pc_out
  );
end architecture rtl;
