
;HW Q4 part a,b and c using 8088

.model small 	

.data 
	NI DQ 0FFFFFFFFFFFFFFFEh		; so the program will print 4times the next string 
	StrThereIsCarry DB  "There is carry... $"

.code 

	mov ax,@data		;get the address of data segment
	mov ds,ax

	mov si,offset NI	;get offset of the variable
	mov ax,[si]		;move the value of valriable to register
	add ax,1		;add 1
	mov [si],ax		;return it to the same place of memory
	mov bx,0	
	jc thereIsCarry		;jump to thereIsCarry label if add instrction set carry 
	jmp exitLabel


thereIsCarry:
	mov dx,offset StrThereIsCarry	;get offset of string to print it 
	mov ah,09h
	int 21h
	add bx,2			;add 2 to base index because the variable 64-bit and registers in 8088 equals to 16 bit ,
					; so 64/16=4 ,< two by two >,because memory store 8-bit (slots)
	mov ax,[si+bx]			
	add ax,1 
	mov [si+bx],ax
	;cmp bx,6
	;je exitLabel
	jc thereIsCarry


exitLabel:


.exit
end