section .data:
	s1 db 'Hello, hello, hello!', 0xa    ;declare msg1
	s1len equ ($ - s1)		     ;msg1 length
	s2 db 'This is my story.', 0xa       ;declare msg2
	s2len equ ($ - s2)                 ;msg2 length
	s3 db 'Goodbye world!', 0xa          ;declare msg3
	s3len equ ($ - s3)                 ;msg3 length


section .text:
	global _start:
_start:
	%macro printmsg 2                    ;define macro printmsg with 2 args
		mov eax, 4		     ;sys call no 4 (sys.write)
		mov ebx, 1                   ;arg1 is file descriptor (stdout)
		mov ecx, %1		     ;arg2 is message
		mov edx, %2		     ;arg3 is messagelength
		int 80h			     ;call kernel
	%endmacro

	printmsg s1, s1len
	printmsg s2, s2len
	printmsg s3, s3len
	
	mov eax, 1                           ;sys.exit
	int 80h
