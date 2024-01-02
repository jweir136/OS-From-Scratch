; print "Hello!" to the screen on boot
mov ah, 0x0e	; enter tty mode
; 'H'
mov al, 'H'
int 0x10
; run in infinite loop
jmp $
; pad with zeros
times 510-($-$$) db 0
; add magic number
dw 0xaa55
