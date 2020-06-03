; HW 1 Q2 
.model small 

		;the value of all is 40 , and they 200 items 
		;then th avarge will be 40
		;and according to acsii table qoutient should be '(' and remainder should be 0
		;40 as decimal equal to '('


.data 

var1 db 200 dup(40)



.code 

	mov ax,@data
	mov ds,ax
	mov si, offset var1 	;get offset of the varible
	mov cx,200		;put 200 to cx for loop instruction
	mov ax,0
	mov bx,0
	mov dx,0

	l1 :
		mov al, [si]	;
		cbw 		;convert byte to word 
		add dx,ax	;add to dx 
		inc si		;si++ 
	loop l1
	
	mov ax,dx		;move the result to ax 
	mov bl,200		;move 200 to dl	;you can put it 202 then quotient equals to ''',and remainder equals to 'z'  
	div bl 		;;;;;;;;;;;; it should be idiv but masm doesn't accept it 
	
	mov bx,ax		;move the result of division to bx	
	mov dl,bl		;move quotient to dl to print it 	
	mov ah,2
	int 21h			
	mov dl,bh		;move reminder to dl to print it 
	int 21h

.exit
end
	

	
	
