section .bss
    num resb 1

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

_start:
    mov ecx, 9           ;set up loop iteration counter
    mov al, '1'          ;set up number to be printed
    mov [num], al
    loo:
        ;print
        push ecx         ;push loop iteration counter from ecx to stack
        print num, 1
        pop ecx          ;pop loop iteration counter from stack to ecx

        ;convert num back to char, increment
        mov al, [num]
        inc al
        mov [num], al
    loop loo

    mov eax, 1
    int 80h