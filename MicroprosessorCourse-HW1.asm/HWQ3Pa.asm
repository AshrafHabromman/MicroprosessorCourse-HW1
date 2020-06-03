
;HW Q 3 part a , using relative addressing mode 

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
	mov bx,0

	l1:
		mov ax,A[bx]	;move the data in A to store it and return it
		push ax		;store it in stack segment 
		sub ax,B[bx]	;sub and store value in ax 
		mov Cc[bx],ax	;move value of subtraction to Cc
		pop ax 		
		mov A[bx],ax	;return the value of A to itself
		
		mov ax,Cc[bx]	;print the value of subtraction 	
		mov dl,al	;the values stored as 16-bit but I chose small 
		mov ah,2	;values to print it ...
		int 21h		;Print 'B'
		mov ax,A[bx]	
		mov ah,2
		mov dl,al
		int 21h		;print 'P' ,the orginal value of A variable .
		add bx,2

	loop l1

.exit
end 
		
		
