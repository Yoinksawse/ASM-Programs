section .bss
    sum resb 4

section .data               ;print all elements of arr (works only for 1-digit result. 
    arr dw 1, 2, 2, 1, 3    ;need to learn string handling before printing larger numbers

section .text
    global _start
_start:
    mov eax, arr            ;position of arr
    mov ecx, 0              ;iterator
    mov ebx, 0              ;store sum

loo:
    add ebx, [eax + ecx]    ;add cur element 
    add ecx, 2              ;update iterator
    cmp ecx, dword 10
    jne loo

output:
    add ebx, '0'
    mov [sum], dword ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 2
    int 0x80

exit:
    mov eax, 1
    int 0x80