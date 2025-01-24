section .bss
    ans resb 1

section .text
    global _start:

_start:
    mov eax, '3'         ;set up 16 bit registers to store sum values
    mov ebx, '2'
    sub eax, '0'         ;convert data in 16 bit registers (cur ascii char) to binary integer
    sub ebx, '0'
    add eax, ebx          ;add up, stores sum in ax register (1st operand)
    add eax, '0'         ;convert sum back from binary integer to ascii char
    mov [ans], al

    mov eax, 4
    mov ebx, 1
    mov ecx, ans
    mov edx, 1
    int 0x80

    mov eax, 1
    int 0x80