section .bss
    ans resb 1

section .data
    arr db 1, 2, 3, 4, 5

section .text
    global _start

; test the method of declaring a segment (using label) to initialise variable
;var: dw 100

macros:
    %macro print 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 0x80
    %endmacro
    
_start:
    mov al, [arr + 2 * 1]
    add al, '0'
    mov [ans], al

    print ans, 1

exit:
    mov eax, 1
    int 0x80