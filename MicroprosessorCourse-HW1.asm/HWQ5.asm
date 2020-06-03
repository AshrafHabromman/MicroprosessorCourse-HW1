;HW Q5 
.model small 

; part a 


		; note : this code can't be executed because the data has not initialized

.code 
	mov ax,1000h	
	mov ds,ax
	mov si,0200h
	mov ax,2000h
	mov es,ax
	mov di,0100h
	mov cx,2048	;it 2KB 1kb=1024 , 2kb=2048
	cld		;set auto-incement

	rep movsb	;move es:[si]=ds:[di] ; si++ , di++
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; part b 

	mov ax,1000h	
	mov ds,axss
	mov si,0200h
	mov ax,2000h
	mov es,ax
	mov di,0100h
	mov cx,2048	;it 2KB 1kb=1024 , 2kb=2048
	
	l1:
		mov al,[si]
		mov es[di],al
		inc di 
		inc si
	loop l1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;.model flat	;flat because there is overlaping in data in part c 
;part c
	
	mov ax,1000h
	mov ds,ax
	mov si,0200h
	add si,2048 	;jump to last position of the data of 2KB
	mov ax,1000
	mov es,ax
	mov di,0300h
	add di,2048 	;jump to the last position i want to move data in it 
	mov cx,2048	;for loop
	std 		;set direction flag .. auto-increment 
	
	rep movsd






 