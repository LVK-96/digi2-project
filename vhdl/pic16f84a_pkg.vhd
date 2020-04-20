-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

package pic16f84a is
  constant n             : integer   := 8;
  constant status_n      : integer   := 3;
  constant select_n      : integer   := 3;
  constant porta_n       : integer   := 5;
  constant portb_n       : integer   := 8;
  constant pc_n          : integer   := 13;
  constant instruction_n : integer   := 14;
  constant inst_mem_size : integer   := 1024;
  constant freq          : integer   := 20e6;
  constant period        : time      := 1000 ms / freq;
  constant half_period   : time      := period / 2;
  constant pc_start      : std_logic_vector(n - 1 downto 0) := "00000000";

  -- Opcodes
  constant ADDWF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "000111--------";
  constant ADDLW_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "111110--------";
  constant SUBWF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "000010--------";
  constant SUBLW_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "111100--------";
  constant INCF_OPCODE  : std_logic_vector(instruction_n - 1 downto 0) := "001010--------";
  constant DECF_OPCODE  : std_logic_vector(instruction_n - 1 downto 0) := "000011--------";
  constant ANDWF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "000101--------";
  constant ANDLW_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "111001--------";
  constant IORWF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "000100--------";
  constant IORLW_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "111000--------";
  constant XORWF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "000110--------";
  constant XORLW_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "111010--------";
  constant COMF_OPCODE  : std_logic_vector(instruction_n - 1 downto 0) := "001001--------";
  constant CLRF_OPCODE  : std_logic_vector(instruction_n - 1 downto 0) := "0000011-------";
  constant CLRW_OPCODE  : std_logic_vector(instruction_n - 1 downto 0) := "0000010-------";
  constant BCF_OPCODE   : std_logic_vector(instruction_n - 1 downto 0) := "0100----------";
  constant BSF_OPCODE   : std_logic_vector(instruction_n - 1 downto 0) := "0101----------";
  constant RLF_OPCODE   : std_logic_vector(instruction_n - 1 downto 0) := "001101--------";
  constant RRF_OPCODE   : std_logic_vector(instruction_n - 1 downto 0) := "001100--------";
  constant MOVWF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "0000001-------";
  constant MOVF_OPCODE  : std_logic_vector(instruction_n - 1 downto 0) := "001000--------";
  constant MOVLW_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "110000--------";
  constant SWAPF_OPCODE : std_logic_vector(instruction_n - 1 downto 0) := "001110--------";
  constant NOP_OPCODE   : std_logic_vector(instruction_n - 1 downto 0) := "0000000-------";

  -- Memory types
  type program_array is array(0 TO inst_mem_size - 1) of std_logic_vector(instruction_n - 1 downto 0);
  type mem_array_8 is array (0 to 2**n - 1) of std_logic_vector(n - 1 downto 0);

  type operation is (
    ADDWF,
    ADDLW,
    SUBWF,
    SUBLW,
    INCF,
    DECF,
    ANDWF,
    ANDLW,
    IORWF,
    IORLW,
    XORWF,
    XORLW,
    COMF,
    CLRF,
    CLRW,
    BCF,
    BSF,
    RLF,
    RRF,
    MOVWF,
    MOVF,
    MOVLW,
    SWAPF,
    NOP,
    UNDEFINED
  );

  type idec_state is (
    iFetch,
    Mread,
    Execute,
    Mwrite,
    UNDEFINED
  );
end package pic16f84a;
