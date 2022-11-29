extrn ExitProcess : proc

node STRUCT
	value DWORD ?
	left  DWORD ?
	right DWORD ?
node ENDS

.DATA
head node <10, ?, ?>

.CODE
asmMain PROC

mov eax, head.value
ret
asmMain ENDP
END