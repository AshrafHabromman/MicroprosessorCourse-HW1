;HW Q 4 part e 
.686
.model small 

.data 

	NI DQ  ? 

.code 

	increment: 
	
		mov rax, NI 	;rax register = 64bit 
		inc rax
		mov NI,eax
	
	negate:
	
		mov rbx, NI
		not rbx
		mov NI,rbx
.exit 
	
end 