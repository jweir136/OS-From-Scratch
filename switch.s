; start by entering into 16-bit mode
[bits 16]
switch_to_pm:
    ; turn off interrupts
    cli

    ; load the gdt Descriptor
    lgdt [gdt_descriptor]
    mov eax, cr0

    ; set 32-bit mode using cr0
    or eax, 0x1
    mov cr0, eax

    ; far jump using the gdt code segment
    jmp CODE_SEG:init_pm

; enter 32-bit mode
[bits 32]
init_pm:
    ; update the segment registers
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    ; update the stack
    mov ebp, 0x90000
    mov esp, ebp

    ; call the kernel code
    call begin_pm