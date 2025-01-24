section .text 
    global _start  
_start:
    mov ecx, [num1]
    cmp ecx, [num2]           ;compare num1 & num2
    jg num3_vs_num1           ;num1 > num2
    jmp num3_vs_num2           ;num2 > num1
num3_vs_num2:
    mov ecx, [num2]
    cmp ecx, [num3]
    jg _exit
    jmp mvnum3
    mvnum3:
        mov ecx, [num3]
        jmp _exit
num3_vs_num1:
    cmp ecx, [num3]           ;compare num1 and num3
    jg _exit                  ;num1 > num3: num1 is greatest so leave
    mov ecx, [num3]           ;num1 < num3: num3 is greatest so move it to ecx
    jmp _exit

_exit: 
    sub eax, '0'
    mov [largest], dword ecx

    mov ecx, msg 
    mov edx, len 
    mov ebx,1 ;file descriptor (stdout) 
    mov eax,4 ;system call number (sys_write) 
    int 0x80 ;call kernel 
    mov ecx, largest 
    mov edx, 2 
    mov ebx,1 ;file descriptor (stdout) 
    mov eax,4 ;system call number (sys_write) 
    int 0x80 ;call kernel 
    mov eax, 1 
    int 80h 
section .data 
    msg db "The largest digit is: ", 0xA,0xD 
    len equ $- msg 
    num1 dd 99
    num2 dd 21 
    num3 dd 20
segment .bss 
    largest resb 2