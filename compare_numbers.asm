section .data
	num1 dd 5
	num2 dd 15
	show1 db 'Num1 is smaller',0 ;15
	show2 db 'Num2 is smaller',0 ;15

section .text
   global _start
_start:
	mov eax,[num1]
	cmp eax,[num2]
	jge num2_is_smaller
	
num1_is_smaller:
	mov eax,4
	mov ebx,1
	mov ecx,show1
	mov edx,15
	int 0x80
	jmp end

num2_is_smaller:
	mov eax,4
	mov ebx,1
	mov ecx,show2
	mov edx,15
	int 0x80

end:
	mov eax,1
	xor ebx,ebx
	int 0x80
