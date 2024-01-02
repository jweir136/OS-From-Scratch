; this file contains operations that make low-level disk operations easier
[org 0x7c00]

; function to load a given sector from disk
;       dh => sectors to load
;       dl => drive to load from
disk_load:
    pusha

    push dx

    mov ah, 0x02
    mov al, dh
    mov ch, 0x00        ; load the first cylinder
    mov cl, 0x02        ; read the first sector that is available to us
    mov dh, 0x00        ; move the head to the start
    int 0x13            ; use the bios interrupt to run the disk read
    jc _print_disk_err  ; if an error occured, print out an error message

    pop dx

    cmp al, dh          ; compare the number of sectors read to the expected number of sectors read
    jne _print_sector_err

    popa
    ret

_print_disk_err:
    mov bx, DISK_ERROR_MSG
    call print
    call print_nl   ; this still prob doesn't work
    jmp $           ; go into an infinite loop

_print_sector_err:
    mov bx, SECTOR_ERROR_MSG
    call print
    call print_nl
    jmp $

DISK_ERROR_MSG: db "Disk read error", 0
SECTOR_ERROR_MSG: db "Sector read error", 0
