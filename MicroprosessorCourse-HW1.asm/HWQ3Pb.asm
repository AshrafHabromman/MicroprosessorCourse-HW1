
;HW Q3 part b using indirect addressing mode 

.model small

.data

	A dw 100 dup(80)	;80 as decimal = 'P'
	B dw 100 dup(14)	
	Cc dw 100 dup(?) 	;Cc[i]=A[i]-B[i] so 80 - 14 = 66 = 'B'  
				;according to ascii table 
.stack

.code 

	mov ax,@data
	mov ds,ax
	mov cx,100
	mov si,offset A
	mov bx,offset B
	mov di,offset Cc

	l1:
		mov ax,[si]	;move the data in A to store it and return it
		push ax		;store it in stack segment 
		sub ax,[bx]	;sub and store value in ax 
		mov [di],ax	;move value of subtraction to Cc
		pop ax 		
		mov [si],ax	;return the value of A to itself
		
		mov ax,[di]	;print the value of subtraction 	
		mov dl,al	;the values stored as 16-bit but I chose small 
		mov ah,2	;values to print it ...
		int 21h		;Print 'B'
		mov ax,[si]	
		mov ah,2
		mov dl,al
		int 21h		;print 'P' ,the orginal value of A variable .
		add si,2
		add di,2
		add bx,2

	loop l1

.exit
end 
		
		