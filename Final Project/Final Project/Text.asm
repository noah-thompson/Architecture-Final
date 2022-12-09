extrn ExitProcess : proc

node STRUCT
	value QWORD ?
	left  QWORD ?
	right QWORD ?
node ENDS

.DATA
head node <10, ?, ?>
intArr QWORD ?,?,?,?
space QWORD 4

.CODE
inOrder PROC var1:QWORD

xor rax, rax
mov rsi, space
mov rdi, 0


mov rdx, var1
mov rdx, [rdx+4]
cmp rdx, 0
jnz left
mov rdx, [rdx+8]
cmp rdx, 0
jnz right
jmp value


parent:
	

headNode:
	mov  rdx, var1

value:
	mov rax, [rdx] ;  value
	jmp final

left:
	;if left go left else
	mov rbx, [rdx+4]; left address
	mov rbx, [rbx]
	mov intArr, rbx;   left value
	add rdi, rsi
	;if right go right else parent
	jmp parent
right:
	;if left go left else
	mov rcx, [rdx+12]; right address
	mov rax, [rdx];    right value
	add rdi, rsi
	;if right go right else parent
	jmp final

final:
	

ret

inOrder ENDP


asmMain PROC

mov rax, head.value
ret
asmMain ENDP
END