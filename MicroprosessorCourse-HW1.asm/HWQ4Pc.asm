
;HW Q 4 part c; negate 

.model small 

.data 
	NI DQ 0FFFFFFFFFFFFFF82H 
	message DB "Negated ! $ "

.code 
	mov ax,@data
	mov ds,ax
	
	mov si,offset NI
	mov ax,[si]
	not ax			;invert first 16-bit of the value
	inc ax 			;maybe it make a carry , so add it to the naxt 16-bit
	mov [si],ax
	mov ax,[si+2]
	not ax			;invert second 16=bit of the value 
	adc ax,0		;add with carry // after invert it 
	mov [si+2],ax
	mov ax,[si+4]
	not ax			;invert third 16=bit of the value
	adc ax,0		;add with carry // after invert it  and so on
	mov [si+4],ax		
	mov ax,[si+6]
	not ax
	adc ax,0
	mov [si+6],ax
	
	mov dx,offset message
	mov ah,09
	int 21h	
	mov ax,0

.exit
end 
	
	
	

 