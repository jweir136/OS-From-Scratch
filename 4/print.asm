[org 0x7c00] ; add global offset that the boot sector expects

; create function to print string stored in bx register
_done:
	popa
	ret

print:
	pusha

	mov al, [bx]
	cmp al, 0
	je _done

	mov ah, 0x0e
	int 0x10

	add bx, 1
	jmp print

print_nl: ; this doens't seem to work for some reason :(
	pusha
	mov ah, 0x0e
	mov al, 0x0a
	int 0x10
	mov al, 0x0d
	int 0x10
	popa
	ret
