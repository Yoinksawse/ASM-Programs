section .text
    global _start
_start:

var: dw 100
    mov ax, var
    mov ax, [var]

mov eax, 4
mov ebx, 1
mov ecx, var
mov edx, 2
int 0x80