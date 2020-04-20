RESET CODE 0x000
  nop

movlw 02h
movwf 0ch
addwf 0ch ; 2 + 2 is 4
movlw 01h
subwf 0ch ; -1 thats 3 quick mafs

end
