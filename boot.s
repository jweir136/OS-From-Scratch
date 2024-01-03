[org 0x7c00] ; create the global offset required by the bootloadefa-rotate-180

;;;;;;;;;;;; PRINT A MESSAGE IN 16-BIT RM AS A SANITY CHECK ;;;;;;;;;;;
mov bx, RM_SANITY_CHECK_MSG
call print

;;;;;;;;;;;; SWITCH OVER TO 32-BIT REAL MODE ;;;;;;;;;;;;
call switch_to_pm

;;;;;;;;;;; INCLUDE ALL THE REQUIRED FILES ;;;;;;;;;;;;;;;
%include "print.asm"
%include "gdt.s"
%include "print_pm.s"
%include "switch.s"

;;;;;;;;;;; THE KERNEL CODE THAT WILL START RUNNING ;;;;;;;;;;;;
begin_pm:
    mov ebx, PM_SANITY_CHECK_MSG
    call print_string_pm
    jmp $

;;;;;;;;;;; DEFINE DATA ;;;;;;;;;;;;;;
RM_SANITY_CHECK_MSG db "Running in 16-bit real mode", 0
PM_SANITY_CHECK_MSG db "Loaded into 32-bit protecte mode", 0

; create the bootsegment
times 510-($-$$) db 0
dw 0xaa55