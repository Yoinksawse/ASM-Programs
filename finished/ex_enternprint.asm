section .data
	userMsg db 'Please enter a number: '    ;Ask the user to enter a number
	lenUserMsg equ $-userMsg    		;message length
	dispMsg db 'You have entered: '         ;confirmation
	lenDispMsg equ $-dispMsg                ;confirmation length


section .bss
	num resb 500    				;resb declares uninit var of size 5 bytes


section .text
	global _start
macros:
	%macro print 2
		mov eax, 4			;sys.write is syscallno 4
		mov ebx, 1			;arg1 stdout
		mov ecx, %1			;arg2 is read destination
		mov edx, %2			;arg3 is length
		int 80h				;call kernel
	%endmacro

	%macro input 2
		mov eax, 3			;sys.read is syscallno 3
		mov ebx, 2			;arg1 is stdin
		mov ecx, %1			;arg2 is write destination
		mov edx, %2			;arg3 is length
		int 80h				;call kernel
	%endmacro

_start:
	print userMsg, lenUserMsg   		;userprompt (write from stdout)
	input num, 500		 				;Read and store the user input
	print dispMsg, lenDispMsg           ;Output msg 2
	print num, 500                        ;Output the number entered

	; Exit code
	mov eax, 1
	mov ebx, 0
	int 80h