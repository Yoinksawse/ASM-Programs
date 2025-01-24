section .data
    a db 1
section .bss
    b resb 1

section .text
    global _start
_start:
    mov ebx, a 
    ;or 
    ;inc byte [b]
    ;mov ebx, b

    mov eax, [ebx]
    mov eax, ebx 
    lea eax, [ebx]

exit:
    mov eax, 1
    int 0x80