section .data:
	msg db 'messagelold', 0xa    ;set message
	len equ ($ - msg)            ;set message length between now and start
	stars times 9 db '*'         ;set 9 stars (for 9 times, declare byte * to stars)

section .text:
	global _start
_start:
	mov edx, len 		     ;send msg length to edx register (for io ops)
	mov ecx, msg                 ;send msg to eax register (for io ops)
	mov ebx, 1		     ;file descriptor (sysout)
	mov eax, 4		     ;system call message (sys write)
	int 0x80		     ;call kernel
	mov edx, 9	    	     ;send msg length to edx register (for io ops)
	mov ecx, stars               ;send msg to ecx register
	mov ebx, 1		     ;system call number (sysout)
	mov eax, 4                   ;system call number (sys write)
	int 0x80                     ;call kernel
	mov eax, 1                   ;system call number (sys exit)
	int 0x80
