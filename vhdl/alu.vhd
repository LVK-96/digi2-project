-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.pic16f84a.all;

entity alu is
  port (
    enable      : in  std_logic;
    --
    w           : in  std_logic_vector(n - 1 downto 0);
    fl          : in  std_logic_vector(n - 1 downto 0);
    operation   : in  operation;
    bit_select  : in  std_logic_vector(select_n - 1 downto 0);
    status_in   : in  std_logic_vector(n - 1 downto 0);
    --
    result      : out std_logic_vector(n - 1 downto 0);
    status      : out std_logic_vector(n - 1 downto 0)
  );
end entity alu;

architecture rtl of alu is
begin
  process(w, fl, operation, bit_select, status_in, enable) is
    variable res : std_logic_vector(n downto 0);
    variable tmp : std_logic;

    procedure status_c (
      variable res  : in std_logic_vector(n downto 0);
      --
      signal status : out std_logic_vector(n - 1 downto 0)
    ) is
    begin
      status(0) <= res(res'length - 1);
    end procedure status_c;

    procedure status_dc (
      variable res    : in std_logic_vector(n - 1 downto 0);
      signal   w      : in std_logic_vector(n - 1 downto 0);
      signal   fl     : in std_logic_vector(n - 1 downto 0);
      --
      signal   status : out std_logic_vector(n - 1 downto 0)
    ) is
    begin
      if (w(4) = '0' and fl(4) = '0' and res(4) = '1') then
        status(1) <= '1';
      else
        status(1) <= '0';
      end if;
    end procedure status_dc;

    procedure status_z (
      variable res  : in std_logic_vector(n - 1 downto 0);
      --
      signal status : out std_logic_vector(n - 1 downto 0)
    ) is
    begin
      if (to_integer(unsigned(res)) = 0) then
        status(2) <= '1';
      else
        status(2) <= '0';
      end if;
    end procedure status_z;

    procedure add_inst (
      signal w          : in    std_logic_vector(n - 1 downto 0);
      signal fl         : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n downto 0);
    begin
      res := std_logic_vector(('0' & fl) + ('0' & w));
      status_c(res, status);
      status_dc(res(n - 1 downto 0), w, fl, status);
      status_z(res(n - 1 downto 0), status);
      result <= res(n - 1 downto 0);
    end procedure add_inst;

    procedure sub_inst (
      signal w          : in    std_logic_vector(n - 1 downto 0);
      signal fl         : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n downto 0);
    begin
      res := std_logic_vector(('0' & fl) - ('0' & w));
      status_c(res, status);
      status_dc(res(n - 1 downto 0), w, fl, status);
      status_z(res(n - 1 downto 0), status);
      result <= res(n - 1 downto 0);
    end procedure sub_inst;

    procedure incf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := std_logic_vector(f + "00000001");
      status_z(res, status);
      result <= res;
    end procedure incf_inst;

    procedure decf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := std_logic_vector(f - "00000001");
      status_z(res, status);
      result <= res;
    end procedure decf_inst;

    procedure and_inst (
      signal w          : in    std_logic_vector(n - 1 downto 0);
      signal fl         : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := fl and w;
      status_z(res, status);
      result <= res;
    end procedure and_inst;

    procedure ior_inst (
      signal w          : in    std_logic_vector(n - 1 downto 0);
      signal fl         : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := fl or w;
      status_z(res, status);
      result <= res;
    end procedure ior_inst;

    procedure clr_inst (
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := "00000000";
      status_z(res, status);
      result <= res;
    end procedure clr_inst;

    procedure movfl_inst (
      signal fl         : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := fl;
      status_z(res, status);
      result <= res;
    end procedure movfl_inst;

    procedure movwf_inst (
      signal w          : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0)
    ) is
    begin
      result <= w;
    end procedure movwf_inst;

    procedure xor_inst (
      signal w          : in    std_logic_vector(n - 1 downto 0);
      signal fl         : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := fl xor w;
      status_z(res, status);
      result <= res;
    end procedure xor_inst;

    procedure comf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := not f;
      status_z(res, status);
      result <= res;
    end procedure comf_inst;

    procedure bcf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      signal bit_select : in    std_logic_vector(select_n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := f;
      res(to_integer(unsigned(bit_select))) := '0';
      result <= res;
    end procedure bcf_inst;

    procedure bsf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      signal bit_select : in    std_logic_vector(select_n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
    begin
      res := f;
      res(to_integer(unsigned(bit_select))) := '1';
      result <= res;
    end procedure bsf_inst;

    procedure rlf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      signal status_in  : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable shift    : std_logic_vector(n - 1 downto 0);
      variable tmp      : std_logic;
    begin
      shift := std_logic_vector(shift_left(unsigned(f), 1));
      tmp := f(n - 1);
      status(0) <= tmp;
      result <= shift(n - 1 downto 1) & status_in(0);
    end procedure rlf_inst;

    procedure rrf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      signal status_in  : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable shift    : std_logic_vector(n - 1 downto 0);
      variable tmp      : std_logic;
    begin
      shift := std_logic_vector(shift_right(unsigned(f), 1));
      tmp := f(0);
      status(0) <= tmp;
      result <= status_in(0) & shift(n - 2 downto 0);
    end procedure rrf_inst;

    procedure swapf_inst (
      signal f          : in    std_logic_vector(n - 1 downto 0);
      --
      signal result     : out   std_logic_vector(n - 1 downto 0);
      signal status     : out   std_logic_vector(n - 1 downto 0)
    ) is
      variable res      : std_logic_vector(n - 1 downto 0);
      variable tmp      : std_logic_vector(n / 2 - 1 downto 0);
    begin
      tmp := f(n / 2 - 1 downto 0);
      res(n / 2 - 1 downto 0) := f(n - 1 downto n / 2);
      res(n - 1 downto n / 2) := tmp;
      result <= res;
    end procedure swapf_inst;
  begin
    if enable = '1' then
      status <= status_in;
      case operation is
        when ADDWF =>
          add_inst(w, fl, result, status);
        when ADDLW =>
          add_inst(w, fl, result, status);
        when SUBWF =>
          sub_inst(w, fl, result, status);
        when SUBLW =>
          sub_inst(w, fl, result, status);
        when INCF =>
          incf_inst(fl, result, status);
        when DECF =>
          decf_inst(fl, result, status);
        when ANDWF =>
          and_inst(w, fl, result, status);
        when ANDLW =>
          and_inst(w, fl, result, status);
        when IORWF =>
          ior_inst(w, fl, result, status);
        when IORLW =>
          ior_inst(w, fl, result, status);
        when XORWF =>
          xor_inst(w, fl, result, status);
        when XORLW =>
          xor_inst(w, fl, result, status);
        when COMF =>
          comf_inst(fl, result, status);
        when CLRF =>
          clr_inst(result, status);
        when CLRW =>
          clr_inst(result, status);
        when BCF =>
          bcf_inst(fl, bit_select, result, status);
        when BSF =>
          bsf_inst(fl, bit_select, result, status);
        when RLF =>
          rlf_inst(fl, status_in, result, status);
        when RRF =>
          rrf_inst(fl, status_in, result, status);
        when MOVWF =>
          movwf_inst(w, result);
        when MOVF =>
          movfl_inst(fl, result, status);
        when MOVLW =>
          movfl_inst(fl, result, status);
        when SWAPF =>
          swapf_inst(fl, result, status);
        when NOP =>
          null;
        when others =>
          null;
      end case;
    end if;
  end process;
end architecture rtl;
