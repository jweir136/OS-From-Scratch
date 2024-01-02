[org 0x7c00]

int 0x11

jmp $

times 510-($-$$) db 0
dw 0xaa55
