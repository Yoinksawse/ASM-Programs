section .bss
    s2 resb 16                              ;for movs test, stos test
    cmd resb 1

section .data
    msg0 db 'Hi! Enter:', 0xa, '1: test movs', 0xa, '2: test cmps', 0xa, '3: test scas', 0xa
    lenmsg0 equ ($ - msg0)
    s1 db 'Hello screw u!', 0xa             ;for movs test, cmps test, scas test
    lens1 equ ($ - s1)                      ;for movs test, cmps test, scas test
    ;s3 db 'Hello shrew u''                  ;for cmps test
    s3 db 'Hello screw u!'                  ;for cmps test
    lens3 equ ($ - s3)                      ;for cmps test
    s4 db 'c'                               ;for scas test
    lens4 equ ($ - s4)                      ;for scas test

    msg1 db 'Strings equal!'                ;for cmps test
    lenmsg1 equ ($ - msg1)                  ;for cmps test
    msg2 db 'Strings not equal!'            ;for cmps test
    lenmsg2 equ ($ - msg2)                  ;for cmps test
    msg3 db 'Found!'                        ;for scas test
    lenmsg3 equ ($ - msg3)                  ;for scas test
    msg4 db 'Not found.'                    ;for scas test
    lenmsg4 equ ($ - msg4)                  ;for scas test

section .text
    global main
macros:
    %macro print 2
        mov eax, 4
        mov ebx, 1 
        mov ecx, %1
        mov edx, %2
        int 0x80
    %endmacro
    %macro clr_regs 0
        ;clear registers
        xor eax, eax
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx
        xor esi, esi
        xor edi, edi
    %endmacro
main:
    input:
        print msg0, lenmsg0     ;print the message
        ;input to cmd
        mov eax, 3
        mov ebx, 2
        mov ecx, cmd
        mov edx, 1
        int 80h
        mov al, [cmd]
        demand_movs_test:
            cmp al, '1'
            je movs_test
        demand_cmps_test:
            cmp al, '2'
            je cmps_test
        demand_scas_test:
            cmp al, '3'
            je scas_test
        jmp exit
    movs_test:  ;clear!
        ;movs moves string from esi to edi
        mov ecx, lens1
        mov esi, s1
        mov edi, s2
        cld
        rep movsb
        print s2, 16
        clr_regs
        jmp exit
    cmps_test:  ;clear!
        ;cmps compares strings until similarity found
        mov ecx, lens1
        mov esi, s1
        mov edi, s3
        cld
        repe cmpsb
        jz eql1
        ;else jmp eql
        dif1:
            print msg2, lenmsg2
            clr_regs
            jmp exit
        eql1:
            print msg1, lenmsg1
            clr_regs
            jmp exit
    scas_test:  ;clear!
        mov ecx, lens3
        mov al, [s4]
        mov edi, s3
        cld
        repne scasb
        je found
        notfound:
            print msg4, lenmsg4
            clr_regs 
            jmp exit
        found:        
            print msg3, lenmsg3
            clr_regs
            jmp exit
    lods_test:  ;

    stos_test:  ;
        mov ecx, 16                         ;ecx: stores number of reps for rep
        mov edi, s2                         ;edi: stores destination variable
        mov esi, s4                         ;esi: source is s4 ('c')
        cld

        
        
exit:
    mov eax, 1
    int 0x80