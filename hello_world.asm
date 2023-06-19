section .data ;where init data is stored 
	hello db 'Hello, World !', 0 
	
	;hello is written as label to mark the start of a string
	; db is used to define a byte sized data item
	; 0 tells the termination of the string and is a null

section .text ;program instructions are stored
	global _start

_start: ;same as int main() in c which marks the start excution of the program

;Wrting a message to stdout
	mov eax,4 ;mov is used to move the values into the registers
		  ;eax is the register type and the number 4 we used to perform the write operation in the register (difer from OS to OS)
	mov ebx,1 ; corresponds to stdout
	mov ecx,hello ;is used to move the memory address of the 'hello' string into the ecx register.
	mov edx,13; is used to tell the regitser the size of the string
	int 0x80  ;call the kernel which creates a software interrupt to the opratin system to execute the system call

;exiting the program

	mov eax,1 ;system call number for exit
	xor ebx,ebx ;same as return 0 in c 
	int 0x80 ; again generating a software interrupt to exit the program

