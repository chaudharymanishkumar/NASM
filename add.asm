section .data
msg db 'Please enter 1st:'
len equ $ - msg
msg1 db 'Please enter 2nd:',0xa
len1 equ $ - msg
msg2 db 'Result :',0xa
len2 equ $ - msg

section .bss
num1 resb 5
num2 resb 5
result resb 10

section .text
global _start

_start:
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,5
	mov ecx,num1
	mov ebx,0
	mov eax,3
	int 0x80

	mov edx,len1
	mov ecx,msg1
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,5
	mov ecx,num2
	mov ebx,0
	mov eax,3
	int 0x80

	mov eax,[num1]
	sub eax,'0'

	mov ebx,[num2]
	sub ebx,'0'

	add eax,ebx
	add eax,'0'
	mov [result],eax

	mov edx,len2
	mov ecx,msg2
	mov ebx,1
	mov eax,4
	int 0x80

	mov edx,10
	mov ecx,result
	mov ebx,1
	mov eax,4
	int 0x80

	mov eax,1
	int 0x80



