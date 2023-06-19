section .data
	ask1 db 'Enter num1 : ',0 ;13
	ask2 db ' Enter num2 : ',0 ;14
	show db ' Sum is : ',0 ;10
	num1 dd 0
	num2 dd 0
	result dd 0

section .text
	global _start
_start:
	
	;asking for num1
	mov eax,4
	mov ebx,1
	mov ecx,ask1
	mov edx,13
	int 0x80
	
	;accepting num1 from the terminal
	mov eax,3 ;read
	mov ebx,0 ;stdin
	mov ecx,num1
	mov edx,4
	int 0x80

	;asking for num2
	mov eax,4
	mov ebx,1
	mov ecx,ask2
	mov edx,14
	int 0x80

	;accepting num2 from the terminal
	mov eax,3 ;read
	mov ebx,0 ;stdin
	mov ecx,num2
	mov edx,4
	int 0x80

	;conversion of num1
	mov eax,[num1]
	sub eax,48
	mov [num1],eax

	mov eax,[num2]
	sub eax,48
	mov [num2],eax

	;adding num1 and num2
	mov eax,[num1]
	add eax,[num2]
	mov [result],eax
	
	;conversion of result before displayig
	mov eax,[result]
	add eax,48
	mov [result],eax

	;printing the result
	mov eax,4
	mov ebx,1
	mov ecx,show
	mov edx,10
	int 0x80
	

	mov eax,4
	mov ebx,1
	mov ecx,result
	mov edx,1
	int 0x80
	
	;exiting the program
	mov eax,1
	xor ebx,ebx
	int 0x80
