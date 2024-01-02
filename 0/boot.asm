; this is the most simple boot sector. It just goes in an infinite loop upon boot
loop:
	jmp loop

; pad the file with 0 bytes so that is is length 510 (saving last 2 bytes for magic number)
times 510-($-$$) db 0

; pad the file with the bytes 0xaa55 (the magic number for a boot sector)
dw 0xaa55
