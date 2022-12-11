extrn ExitProcess : proc

.DATA
intArr QWORD 0,0,0,0,0,0,0,0,0,0
space QWORD 8
count DWORD 0
node DWORD 0

.CODE
nodeCount PROC var1:QWORD

xor rax, rax
xor rbx, rbx
mov rsi, space
mov rdi, 0


mov rdx, rcx
mov rbx, [rdx]
mov count, ebx
mov rcx, [rdx+4]
cmp rdx, 0
jnz left
mov rcx, [rdx+8]
cmp rdx, 0
jnz right
jmp final

left:
	mov rdx, [rdx+4]

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;add current
	mov rax, [rdx]
	add node, 1

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right


	;return to parent
	jmp parentAfterLeft

right:
	mov rdx, [rdx+12]

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;add current
	mov rax, [rdx]
	add node, 1

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right


	;return to parent
	jmp parentAfterRight

parentAfterLeft:
	mov rdx, [rdx+20]

	;addcurrent
	mov rax, [rdx]
	add node, 1
	
	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;check parent
	mov rcx, [rdx+20]
	cmp ecx, count
	jl parentAfterLeft
	jmp final

parentAfterRight:
	mov rdx, [rdx+20]
	mov rcx, [rdx]
	cmp ecx, count
	jg final
	jmp parentAfterLeft


final:
	mov eax, node

xor rcx, rcx
ret
nodeCount ENDP




inOrder PROC var1:QWORD, var2:DWORD

mov var2, edx
xor rbx, rbx
mov rsi, space
mov rdi, 0


mov rdx, rcx
mov rbx, [rdx]
mov count, ebx
mov rcx, [rdx+4]
cmp rdx, 0
jnz left
mov rcx, [rdx+8]
cmp rdx, 0
jnz right
jmp final

left:
	mov rdx, [rdx+4]

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;add current
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right


	;return to parent
	jmp parentAfterLeft

right:
	mov rdx, [rdx+12]

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;add current
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right


	;return to parent
	jmp parentAfterRight

parentAfterLeft:
	mov rdx, [rdx+20]

	;addcurrent
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi
	
	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;check parent
	mov rcx, [rdx+20]
	cmp ecx, count
	jl parentAfterLeft;
	jmp final

parentAfterRight:
	mov rdx, [rdx+20]
	mov rcx, [rdx]
	cmp ecx, count
	jg final
	jmp parentAfterLeft


final:
	lea rcx, intArr
	mov esp, var2
	mov rax, [rcx + rsp]

xor rcx, rcx
ret

inOrder ENDP



postOrder PROC var1:QWORD, var2:DWORD

mov var2, edx
xor rbx, rbx
mov rsi, space
mov rdi, 0


mov rdx, rcx
mov rbx, [rdx]
mov count, ebx
mov rcx, [rdx+4]
cmp rdx, 0
jnz left
mov rcx, [rdx+8]
cmp rdx, 0
jnz right
jmp final

left:
	mov rdx, [rdx+4]

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;add current
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi


	;return to parent
	jmp parentAfterLeft

right:
	mov rdx, [rdx+12]

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;add current
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi


	;return to parent
	jmp parentAfterRight

parentAfterLeft:
	mov rdx, [rdx+20]
	
	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;addcurrent
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi

	;check parent
	mov rcx, [rdx+20]
	cmp ecx, count
	jl parentAfterLeft;
	jmp final

parentAfterRight:
	mov rdx, [rdx+20]

	;addCurrent
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi

	mov rcx, [rdx]
	cmp ecx, count
	jg final
	jmp parentAfterLeft


final:
	mov [intArr + rdi], rbx
	add rdi, rsi
	lea rcx, intArr
	mov esp, var2
	mov rax, [rcx + rsp]

xor rcx, rcx
ret

postOrder ENDP



preOrder PROC var1:QWORD, var2:DWORD

mov var2, edx
xor rbx, rbx
mov rsi, space
mov rdi, 0


mov rdx, rcx

;add head
mov rax, [rdx]
mov [intArr + rdi], rax
add rdi, rsi

;check left
mov rbx, [rdx]
mov count, ebx
mov rcx, [rdx+4]
cmp rdx, 0
jnz left

;check right
mov rcx, [rdx+8]
cmp rdx, 0
jnz right
jmp final

left:
	mov rdx, [rdx+4]

	;add current
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right


	;return to parent
	jmp parentAfterLeft

right:
	mov rdx, [rdx+12]

	;add current
	mov rax, [rdx]
	mov [intArr + rdi], rax
	add rdi, rsi

	;check left
	mov rcx, [rdx+4]
	cmp rcx, 0
	jnz left

	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;return to parent
	jmp parentAfterRight

parentAfterLeft:
	mov rdx, [rdx+20]
	
	;check right
	mov rcx, [rdx+12]
	cmp rcx, 0
	jnz right

	;check parent
	mov rcx, [rdx+20]
	cmp ecx, count
	jl parentAfterLeft;
	jmp final

parentAfterRight:
	mov rdx, [rdx+20]

	mov rcx, [rdx]
	cmp ecx, count
	jg final
	jmp parentAfterLeft


final:
	lea rcx, intArr
	mov esp, var2
	mov rax, [rcx + rsp]

xor rcx, rcx
ret

preOrder ENDP



END