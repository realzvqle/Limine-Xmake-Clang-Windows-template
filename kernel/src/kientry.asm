section .bss
    align 16
stack_bottom:
    resb 655360      
stack_top:

section .text
    global KiEntry
    extern KiMain
KiEntry:
    mov rsp, stack_top    
    call KiMain
    cli
.halt:
    hlt
    jmp .halt