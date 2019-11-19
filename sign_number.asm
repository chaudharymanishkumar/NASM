section .data
msg db 'Please enter an input:'
len equ $ - msg
negative db 'Negative',0xa
len1 equ $ - negative
positive db 'positive',0xa
len2 equ $ - positive

section .bss
num resb 5

section .text
global _start

_start:
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,5
	mov ecx,num
	mov ebx,0
	mov eax,3
	int 0x80

	mov edx,5
	mov ecx,num
	mov ebx,1
	mov eax,4
	int 0x80

	mov ax,[num]
	sub ax,'0'
	cmp ax,0
	jnc skip
	mov edx,len1
	mov ecx,negative
	mov ebx,1
	mov eax,4
	int 0x80
	jmp exit
skip:
	mov edx,len2
	mov ecx,positive
	mov ebx,1
	mov eax,4
	int 0x80

exit:	mov eax,1
	int 0x80

