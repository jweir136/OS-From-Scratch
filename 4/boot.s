[org 0x7c00]

mov bx, my_name
call print
call print_nl

%include "print.asm"

my_name:
	db "Jacob", 0

times 510-($-$$) db 0
dw 0xaa55
