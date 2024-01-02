; start with the 8 null bytes at the start of the table
gdt_start:
    dd 0x0
    dd 0x0

; create the code segment with a base of 0x0 and a segment size of 0xfffff
code_segment:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

; create the data segment with the same parameters as the code segment above
data_segment:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

; create a blank label to mark the end of the table
gdt_end:

; The GDT Descriptor
gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

; Define constants related to the gdt
CODE_SEG equ code_segment - gdt_start
DATA_SEG equ data_segment - gdt_start