.model small
.stack 100h
.data
     deci  db  'Enter a decimal number : $'
     invi  db   'Invalid entry $'
     bina  db   'Its binary is  $'
	 
.code
main proc

   mov   ax,@data
   mov   ds,ax
   mov ah,02
   mov dl,10	  ;print new line
   int 21h
   lea   dx,deci
   mov   ah,9     ;print message
   int   21h
   mov   ah,1
   int   21h      ;read data from user
   cmp   al,30h   ;check whether user enter number or something else
   jnge  invalid  ;jump if any invalid entry
   cmp   al,39h
   jnle  invalid
   lea   dx,bina  ;print message
   mov   ah,9
   int   21h
   and   al,0fh   ;clear upper four bits of al register
   mov   cl,3     ;cl used as counter in shifting bits
   mov   bl,al    ;save value in bl register
   mov   bh,bl    ;move contents of bl into bh
   shr   bh,cl    ;right shift bh register three times by using cl as a counter
   add   bh,30h   ;make binary value visible as 0 or 1 
   mov   ah,2     ;print binary value
   mov   dl,bh
   int   21h
   xor   bh,bh    ;clear bh register
   mov   bh,bl   
   mov   cl,2     ;make cl counter value equals to two
   and   bh,04h   ;clear all bits except third last bit
   shr   bh,cl
   add   bh,30h
   mov   ah,2     ;print binary value of third last bit
   mov   dl,bh
   int   21h
   xor   bh,bh
   mov   bh,bl
   and   bh,02h   ;clear all bits except second last bit
   shr   bh,1
   add   bh,30h
   mov   ah,2     ;print second last bit
   mov   dl,bh
   int   21h
   xor   bh,bh
   mov   bh,bl
   and   bh,01h   ;clear all bits except the last bit
   add   bh,30h
   mov   ah,2     ;print last bit in binary
   mov   dl,bh
   int   21h
   mov ah,02
   mov dl,10	  ;print new line
   int 21h
   jmp   exit

invalid:
   lea   dx,invi   ;used to print message of invalid entry
   mov   ah,9
   int   21h
   

exit:
   mov   ah,4ch
   int   21h 

main endp
end main
