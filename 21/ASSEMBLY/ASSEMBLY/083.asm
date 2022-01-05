.model small
.stack 100h
.data
intro db 9,9,"*******MULTIPLICATION TABLE GENERATOR*******$"
msg db 10,"ENTER A NUMBER: $"
tab db 9
num db ?
num1 db ?
mul1 db 42
equal1 db 61
array db '01','02','03','04','05','06','07','08','09','10','11','12'
errormsg db 10,"THE INPUT IS NOT A NUMBER$"
.code
start:
mov ah,09H
mov bl,9
mov cx,1000
int 10h
xor cx,cx
mov ax,@data
mov ds,ax
mov si,offset array
mov ah,09
lea dx,intro
int 21h
lea dx,msg
int 21h
mov ah,01
int 21h
mov num,al
mov cl,10
mov bl,'0'

testinput:
   
cmp al,bl
je next
inc bl
loop testinput
jne error1
next:
sub al,48
mov num1,al
mov cl,1
mov al,0
mov bl,1

l1:

mov ah,02
mov dl,10
int 21h

mov ah,02
mov dl,tab
int 21h
int 21h
int 21h
int 21h
int 21h
mov dl,num
int 21h
mov dl,mul1
int 21h
mov dx,[si]
add si,2
mov ah,02
int 21h
mov dl,dh
int 21h
mov dl,equal1
int 21h
mov al,num1
MUL cl
AAM
ADD AH,30H
ADD AL,30H

MOV BX,AX

mov ah,02
mov dl,bh
int 21h
mov dl,bl
int 21h

inc cl
cmp cl,13

jne l1
jmp exit
error1:
mov ah,09
lea dx,errormsg
int 21h
exit:
mov ah,4ch
int 21h

end start
