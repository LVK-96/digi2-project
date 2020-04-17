-- Leo Kivikunnas 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.pic16f84a.all;

entity idec is
  port (
    clk            : in std_logic;
    enable         : in std_logic;
    reset          : in std_logic;
    pc_in          : in std_logic_vector(pc_n - 1 downto 0);
    instruction_in : in std_logic_vector(instruction_n - 1 downto 0);
    fl_out         : out std_logic_vector(n - 1 downto 0);
    bit_select_out : out std_logic_vector(select_n - 1 downto 0);
    operation_out  : out operation;
    ram_we         : out std_logic;
    status_we      : out std_logic;
    alu_enable     : out std_logic;
    literal_flag   : out std_logic;
    pc_we          : out std_logic;
    w_reg_we       : out std_logic;
    pc_out         : out std_logic_vector(pc_n - 1 downto 0)
  );
end entity idec;

architecture rtl of idec is
  signal state                   : idec_state;
  signal executing_byte_oriented : std_logic := '0';
  signal executing_bit_oriented  : std_logic := '0';
  signal affects_status          : std_logic := '0';
begin
  process(clk, reset)
    variable next_state : idec_state;
    --
    procedure decode_byte_oriented (
      signal instruction             : in std_logic_vector(instruction_n - 1 downto 0);
      signal fl_out                  : out std_logic_vector(n - 1 downto 0);
      signal executing_byte_oriented : out std_logic
    ) is
    begin
      fl_out <= '0' & instruction(n - 2 downto 0);
      executing_byte_oriented <= '1';
    end procedure decode_byte_oriented;

    procedure decode_literal (
      signal instruction  : in std_logic_vector(instruction_n - 1 downto 0);
      signal fl_out       : out std_logic_vector(n - 1 downto 0);
      signal literal_flag : out std_logic
    ) is
    begin
      fl_out <= instruction(n - 1 downto 0);
      literal_flag <= '1';
    end procedure decode_literal;

    procedure decode_bit_oriented (
      signal instruction            : in std_logic_vector(instruction_n - 1 downto 0);
      signal fl_out                 : out std_logic_vector(n - 1 downto 0);
      signal bit_select_out         : out std_logic_vector(select_n - 1 downto 0);
      signal executing_bit_oriented : out std_logic
    ) is
    begin
      fl_out <= '0' & instruction(n - 2 downto 0);
      bit_select_out <= instruction(instruction_n - 5 downto n - 1);
      executing_bit_oriented <= '1';
    end procedure decode_bit_oriented;

    procedure decode_instruction (
      signal instruction    : in std_logic_vector(instruction_n - 1 downto 0);
      variable next_state   : out idec_state;
      signal affects_status : out std_logic
    ) is
    begin
      if std_match(instruction, ADDWF_OPCODE) then
        operation_out <= ADDWF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, ADDLW_OPCODE) then
        operation_out <= ADDLW;
        next_state := Execute;
        decode_literal(instruction, fl_out, literal_flag);
        affects_status <= '1';
      elsif std_match(instruction, SUBWF_OPCODE) then
        operation_out <= SUBWF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, SUBLW_OPCODE) then
        operation_out <= SUBLW;
        next_state := Execute;
        decode_literal(instruction, fl_out, literal_flag);
        affects_status <= '1';
      elsif std_match(instruction, INCF_OPCODE) then
        operation_out <= INCF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, DECF_OPCODE) then
        operation_out <= DECF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, ANDWF_OPCODE) then
        operation_out <= ANDWF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, ANDLW_OPCODE) then
        operation_out <= ANDLW;
        next_state := Execute;
        decode_literal(instruction, fl_out, literal_flag);
        affects_status <= '1';
      elsif std_match(instruction, IORWF_OPCODE) then
        operation_out <= IORWF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, IORLW_OPCODE) then
        operation_out <= IORLW;
        next_state := Execute;
        decode_literal(instruction, fl_out, literal_flag);
        affects_status <= '1';
      elsif std_match(instruction, XORWF_OPCODE) then
        operation_out <= XORWF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, XORLW_OPCODE) then
        operation_out <= XORLW;
        next_state := Execute;
        decode_literal(instruction, fl_out, literal_flag);
        affects_status <= '1';
      elsif std_match(instruction, COMF_OPCODE) then
        operation_out <= COMF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, CLRF_OPCODE) then
        operation_out <= CLRF;
        next_state := Execute;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, CLRW_OPCODE) then
        operation_out <= CLRW;
        next_state := Execute;
        affects_status <= '1';
      elsif std_match(instruction, BCF_OPCODE) then
        operation_out <= BCF;
        next_state := MRead;
        decode_bit_oriented(instruction, fl_out, bit_select_out, executing_bit_oriented);
      elsif std_match(instruction, BSF_OPCODE) then
        operation_out <= BSF;
        next_state := MRead;
        decode_bit_oriented(instruction, fl_out, bit_select_out, executing_bit_oriented);
      elsif std_match(instruction, RLF_OPCODE) then
        operation_out <= RLF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, RRF_OPCODE) then
        operation_out <= RRF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
        affects_status <= '1';
      elsif std_match(instruction, MOVWF_OPCODE) then
        operation_out <= MOVWF;
        next_state := Execute;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
      elsif std_match(instruction, MOVF_OPCODE) then
        operation_out <= MOVF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
      elsif std_match(instruction, MOVLW_OPCODE) then
        operation_out <= MOVLW;
        decode_literal(instruction, fl_out, literal_flag);
        next_state := Execute;
      elsif std_match(instruction, SWAPF_OPCODE) then
        operation_out <= SWAPF;
        next_state := MRead;
        decode_byte_oriented(instruction, fl_out, executing_byte_oriented);
      elsif std_match(instruction, NOP_OPCODE) then
        operation_out <= NOP;
        next_state := iFetch;
      else
        operation_out <= UNDEFINED;
        next_state := iFetch;
      end if;
    end procedure decode_instruction;
  begin
    if reset = '1' then
      fl_out <= "00000000";
      bit_select_out <= "000";
      operation_out <= UNDEFINED;
      ram_we <= '0';
      status_we <= '0';
      alu_enable <= '0';
      literal_flag <= '0';
      pc_we <= '0';
      pc_out <= "0000000000000";
      state <= iFetch;
    end if;
    if (rising_edge(clk)) then
      if (enable = '1') then
        case state is
          when iFetch =>
            pc_we <= '0';
            affects_status <= '0';
            executing_byte_oriented <= '0';
            executing_bit_oriented <= '0';
            literal_flag <= '0';
            decode_instruction(
              instruction_in,
              next_state,
              affects_status
            );
            state <= next_state;
            if next_state = Execute then
              alu_enable <= '1';
            elsif next_state = iFetch then
              -- It is a NOP or we failed to decode the instruction
              -- just increment pc and try the next one
              pc_we <= '1';
              pc_out <= std_logic_vector(unsigned(pc_in) + to_unsigned(1, pc_n));
            end if;
          when MRead =>
            alu_enable <= '1';
            state <= Execute;
          when Execute =>
            alu_enable <= '0';

            if executing_byte_oriented = '1' then
              ram_we <= instruction_in(7);
            else
              ram_we <= '0' xor executing_bit_oriented;
            end if;

            if executing_byte_oriented = '1' then
              w_reg_we <= not instruction_in(7);
            else
              w_reg_we <= '1' xor executing_bit_oriented;
            end if;

            status_we <= affects_status;
            pc_out <= std_logic_vector(unsigned(pc_in) + to_unsigned(1, pc_n));
            pc_we <= '1';
            state <= Mwrite;
          when Mwrite =>
            executing_byte_oriented <= '0';
            ram_we <= '0';
            w_reg_we <= '0';
            status_we <= '0';
            pc_we <= '0';
            state <= iFetch;
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;
end architecture rtl;
