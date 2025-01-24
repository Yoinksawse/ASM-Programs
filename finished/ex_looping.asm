section .data
    msg db 'Hello', 0xA
    len equ ($ - msg)

section .text
    global _start
_start:
    mov ecx, 5
    loo:
        push ecx    ;temporarily move iterator from ecx to stack
        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, len
        int 0x80
        pop ecx     ;move iterator back from stack to ecx

        dec ecx     ;dec counter + activate zero flag once zero
        jnz loo     ;if zero flag not activated (jump not zero), go back to start of loop

_exit:
    mov eax, 1
    int 0x80