section .bss
    cur resb 4
    ans resb 4
section .text
    global main:
main:
    ;input
    mov eax, 3
    mov ebx, 0
    mov ecx, cur
    mov edx, 4
    int 0x80
    ;set up ebx for function parameter
    mov ebx, [cur]
    sub ebx, '0'

    cmp ebx, 0
    jl end                  ;cannot conduct factorial
    je output1              ;output 1 if input is 0

    call factorial

    output1:                ;set ans to 1
    mov [ans], word 1

    output:                 ;output ans
    add [ans], word '0'
    ;output
    mov eax, 4
    mov ebx, 1
    mov ecx, ans
    mov edx, 4
    int 0x80
    ;end
    end:
    mov eax, 1
    int 0x80

factorial:
    cmp ebx, 0
    jnz calc
    dec ebx
    ret
calc:
    mov eax, [ans]
    mul ebx
    mov [ans], eax
    jmp factorial