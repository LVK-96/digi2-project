RESET CODE 0x000
  NOP

STATUS equ 03h
PORTA  equ 05h
PORTB  equ 06h

TEMP1  equ 08h
COUNT2 equ 09h

MOVLW 1
MOVWF PORTA
MOVLW 0
MOVWF PORTA

MOVLW 1
MOVWF 0ch
MOVF	0ch, 0
IORLW 00h
XORLW	0ffh
ANDLW	0f0h
SUBLW	0fh
MOVLW	0aah
ADDLW	02h
BSF	0ah,7
BCF	0ah,7
MOVLW 0a0h
BSF	0ah,0
BSF	0ah,7
XORWF 0ah,1
SWAPF 0ah,1
SUBWF 0ah,1
RRF	0ah,1
RRF	0ah,1
RRF	0ah,1
RLF	0ah,1
RLF	0ah,1
RLF	0ah,0
MOVWF	0bh
MOVF 	0ch, 1
IORWF	0ah, 1
INCF	0ah, 1
DECF	0ah, 1
COMF	0ah, 1
ADDWF	0ah, 1
ANDWF	0ah, 1
CLRW
CLRF	0ah

end
