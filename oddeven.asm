section .data
userMsg db 'Enter no: '
LenUM equ $-userMsg
even_msg db 'Even',0xa
LenEM equ $-even_msg
odd_msg db 'Odd',0xa
LenOM equ $-odd_msg


section .bss
	num1 resb 5

section .text
	global _start

_start:
	mov edx,LenUM
	mov ecx,userMsg
	mov eax,4
	mov ebx,1
	int 80h

	mov edx,5
	mov ecx,num1
	mov ebx,0
	mov eax,3
	int 80h

	mov ax,[num1+eax-2]
	and ax,1
	jnz odd

even:
	mov ecx,even_msg
	mov edx,LenEM
	mov ebx,1
	mov eax,4
	int 80h
	jmp exit
	
odd:
	mov ecx,odd_msg
	mov edx,LenOM
	mov ebx,1
	mov eax,4
	int 80h

exit:	mov eax,1
	int 80h

