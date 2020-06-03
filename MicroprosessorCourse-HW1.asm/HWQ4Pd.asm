.386
.model small


.data

	NI DQ 0FFFFFF40FFFFFFFFh
	

.code

	increment:			;repeat part b 

		mov ax,@data		;move address of data segment to ds
		mov ds,ax

		mov esi, offset NI 	;move offset of variable to esi 
		mov eax,[esi]		;move first 32-bit to eax
		mov ebx,[esi+4]		;move second 32-bit to ebx
		add eax,1		;inc 
		mov [esi],eax		;return it to the original position 

		adc ebx,0		;if there is carry add it to the next operation

		mov [esi+4],ebx		;return it to the original position 

	negate:				;repeat part c 
		
		mov ax,@data
		mov ds,ax
		
		mov esi, offset NI 
		mov eax, [esi]
		mov ebx, [esi+4]
		not eax
		not ebx 
	
		add eax,1
		adc ebx,0
		
		mov [esi],eax
		mov [esi+4],ebx




end