section .data
    msg1 db 'Enter A:', 0xA, 0xD
    len1 equ ($ - msg1)
    msg2 db 'Enter B:', 0xA, 0xD
    len2 equ ($ - msg2)
    msg3 db 'Result:', 0xA, 0xD
    len3 equ ($ - msg3)

section .bss                  ;declare uninitialised variables
    a resb 8
    b resb 8
    ans resb 16

section .text
    global _start
macros:
    %macro print 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 0x80
    %endmacro
    %macro input 2
        mov eax, 3
        mov ebx, 2
        mov ecx, %1
        mov edx, %2
        int 0x80
    %endmacro
_start:
    print msg1, len1            ;prompt 1
    input a, 8
    print msg2, len2            ;prompt 2
    input b, 8   

    mov ax, [a]                   ;move a into ax register (multiplication with 16 bit source)
    sub ax, '0'                  ;convert a to int
    mov bx, [b]                   ;move b into bx register (the 16 bit source)
    sub bx, '0'                  ;convert a to int
    mul bx                      ;multiply

    add ax, '0'                 ;convert ax contents to ascii char
    mov [ans], ax               ;move result in ans to ans

    print msg3, len3            ;message print result
    print ans, 2                ;print result

    mov eax, 1                  ;exit
    int 0x80