[org 0x7c00] ; globally increment add pointers by the boot sector offset

; turn on tty mode
mov ah, 0x0e

; push the data 'hello' to the stack letter by letter
init_stack:
	push 'O'
	push 'L'
	push 'L'
	push 'E'
	push 'H'

; pop each letter from the stack and print it out
print_stack:
	pop bx
	mov al, bl
	int 0x10
	cmp bl, 'O'
	je done
	jmp print_stack

done:
	jmp $

; pad the boot file
times 510-($-$$) db 0
dw 0xaa55
