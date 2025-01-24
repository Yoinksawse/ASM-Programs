section .bss

section .data
    msg1 db 'hi!', 0xa           ;storing length by specifying length
    len1 equ ($ - msg1)
    msg2 db 'hello!', 0xa, 0     ;storing length by sentinel character

section .text
    global _start
macros:
    %macro print_length 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1 
        mov edx, %2
        int 0x80
    %endmacro
    %macro print_sentinel 1
        mov eax, 4
        mov ebx, 1 
        mov ecx, %1
        int 0x80
    %endmacro
_start:
    print_length msg1, len1
    print_sentinel msg1

    mov eax, 1
    int 0x80