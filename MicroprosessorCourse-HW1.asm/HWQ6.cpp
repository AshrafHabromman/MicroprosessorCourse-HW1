
//HW Q6 

#include <iostream>

 using namespace std;

int main(){
	
	int a[10] = {1,2,3,4,5,6,7,8,9,10}; 
	
	int x=0;
	
/*	for (int i=0 ; i<10 ; i++){
	for (int j=0; j<10; j++){
		if(a[j+1]<a[j])
		{
			x=a[j];
			a[j]=a[j+1];
			a[j+1]=x;
		}
	}
}
*/

_asm{
	
	//mov ax,@data
	//mov ds,ax
	
	mov ecx,10				;set 10 ecx to loop 10 times
	
	push esi
	push edi
	mov esi, offset a			;set address of to esi 
	mov ebx,0		
	
	
	LP: 
		check:
		
			mov eax,[esi+ebx]	;move the value of a[i] to eax
			add ebx,4		;increment i++
			mov edx,[esi+ebx]	;move a[i+1] to ebx 
			cmp eax,edx
			jb swap			;jmp to swap
			add ecx,4		;if ti is not bellow increment and return to check 
			jmp check
			
		swap:
			sub ebx,4		;decrement ebx to swap 
			mov [esi+ebx],edx	; a[i]=a[i+1]
			add ebx,4		;
			mov [esi+ebx],eax	;a[i+1]=a[i]
			cmp ebx,36		;if reach the last position of integer goto loop and decrement by 1  
			je looplabel		
			
		looplabel:
			loop LP
			
			
	pop edi 
	pop esi

}

for (int b=0 ; b<10; b++){
	printf("%d  ",a[b]);
}
	


return 0;
}







