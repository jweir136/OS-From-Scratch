[org 0x7c00] ; set the global offset for the boot sector program


; print the intial out
mov ah, 0x0e
mov al, [my_initial]
int 0x10

my_initial: ; create a data segment to store the letter 'J'
	db "J"

; pad the boot sector
times 510-($-$$) db 0
dw 0xaa55
