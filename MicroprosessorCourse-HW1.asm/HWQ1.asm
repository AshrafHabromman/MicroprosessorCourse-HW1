
; HW Q1

.model small 

.data 
.stack
 
.code 

	mov ah,02
	mov dl,35h  ;hwQ1 -> 35h=5 ->> 35d=23h => # // from ascii table .
	int 21h 
	
	mov al,35h;

	mov bl,al 
	mov ah,al    ; copy the value to the another register to separate it
 		     ; then multi the most 4bit by 10 and add th last 4bit . 
	and ah,0f0h  ; anding the value with 10h th make it ####0000
		     ; then it's look like that the most 4bit is multiplied by 16
	shr ah,1     ; shift it to the right by 1 then the most 4bit is multiplied by 8
	mov al,ah   
	shr al,1     ; not accepted to shift 2 step at the same time
	shr al,1     ; multiplied by 2 
	add ah,al    ; add the two values 2*X to 8*X = 10*X 
	
	and bl,0fh   ; anding with 00001111 to make it 0000####
	add ah,bl    ; adding the two values to each other 
        
	mov dl,ah 
	mov ah,02
	int 21h
	
.exit 
end