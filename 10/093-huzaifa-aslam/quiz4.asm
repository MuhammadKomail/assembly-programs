NL macro
mov ah , 2
mov dl,0AH
int 21h
mov dl,0dh
int 21h
endm

.model huge
.stack 100h
.data
ms1 db "..............***Welcome to Quiz Developed by Huzaifa Aslam***...............$"
ms2 db "                    *Our Policy*$"
ms3 db "              1.Your Correct Answer will add 1 in your score$"
ms4 db "              2.Yout Wrong Answer will minus 1 from your score$"
ms5 db "please Press Enter to contunue$"
ms6 db "Wow its Correct$"
ms7 db "Sorry Its Wrong$"
ms8 db "Successfully Completed$"
ms9 db "Your score is : $"
ms10 db "Press 1 for Continue and 0 for Quit$"
ms11 db "Best of Luck$"
Q1 db "1. Instructions which won’t appear in the object program are called as?$"
QA1 db " a)Redundant instructions b)Exceptions c)Comments d)Assembler Directives$" 
Q2 db "2. The directive used to perform initialization before the execution of the code is$"
QA2 db " a)Reserve b)Dataword c)Store d)EQU$" 
Q3 db "3. what directive is used to specify and assign the memory required for the block of code$"
QA3 db " a)Reserve b)Set c)Assign d)Allocate$" 
Q4 db "4. what directive specifies the end of execution of a program$"
QA4 db " a)Return b)Terminate c)Stop d)End$" 
Q5 db "5. The last statement of the source program should be$"
QA5 db " a)Stop b)Return c)OP d)End$" 

.code
main proc

mov ax,@data
mov ds,ax

lea dx, ms1
mov ah,09
int 21h

NL

lea dx, ms2
mov ah,09
int 21h

NL

lea dx, ms3
mov ah,09
int 21h

NL 

lea dx, ms4
mov ah,09
int 21h

start:

NL

;calling message
lea dx,ms5
mov ah, 9
int 21h
;taking input
mov ah,1
int 21h

cmp al,0dh ;will campare either input is "enter" or not
je Que1 ;test the condition
jne start

;   "start of Q1 and its option" 

;   "Q1"
Que1:
;call nl

NL

;   "calling Q1"
lea dx,Q1
mov ah,09
int 21h

NL

;   "calling Q1 options"
lea dx,QA1
mov ah,09
int 21h

NL

mov ah,01 ;taking input
int 21h
cmp al, 'd' ;comparing input
je True1
jne False1 

True1:

NL

lea dx,ms6
mov ah,09
int 21h

inc bl
;call nl

call Que2
;call input
NL
mov ah , 01
int 21h
cmp al , 'd'
je True2
jne False2

False1:

NL

lea dx,ms7
mov ah,09
int 21h

dec bl
;call nl

call Que2
;call input

Que2:

NL

lea dx,Q2
mov ah,09
int 21h

NL

lea dx,QA2
mov ah,09
int 21h
NL
mov ah,01
int 21h

cmp al, 'b'
je True2
jne False2

True2:

NL

lea dx,ms6
mov ah,09
int 21h

inc bl

NL

call Que3



False2:

NL

lea dx,ms7
mov ah,09
int 21h

dec bl
NL

call Que3

Que3:

NL

lea dx,Q3
mov ah,09
int 21h

NL

lea dx,QA3
mov ah,09
int 21h

NL

mov ah,01
int 21h
cmp al, 'a'
je True3
jne False3


True3:

NL

lea dx,ms6
mov ah,09
int 21h

inc bl

NL

call Que4

False3:

NL

lea dx,ms7
mov ah,09
int 21h

dec bl

NL

call Que4

Que4:

NL

lea dx,Q4
mov ah,09
int 21h

NL

lea dx,QA4
mov ah,09
int 21h

NL

mov ah,01
int 21h
cmp al, 'd'
je True4
jne false4

True4:

NL

lea dx,ms6
mov ah,09
int 21h

inc bl

NL

call Que5

False4:

NL

lea dx,ms7
mov ah,09
int 21h

dec bl

NL

call Que5

Que5:
NL

lea dx,Q5
mov ah,09
int 21h

NL

lea dx,QA5
mov ah,09
int 21h

NL

mov ah,01
int 21h
cmp al, 'd'
je Exit
jne ExitW


Exit:

NL

lea dx, ms6
mov ah,09
int 21h

inc bl
NL
NL

lea dx,ms8
mov ah,09
int 21h

NL

lea dx, ms9
mov ah, 09
int 21h

add bl,48
cmp bl,57
je Irt
mov ah,02
mov dl,bl
int 21h
jmp Exit1
ret

ExitW :
NL

lea dx,ms7
mov ah,09
int 21h

dec bl
NL
NL

lea dx,ms9
mov ah,09
int 21h

add bl,48
mov dl,bl
mov ah,02
int 21h
jmp Exit1
ret

Irt:
mov ah,02
mov dl, "1"
int 21h
;mov dl,"0"
;int 21h
jmp Exit1
ret


Exit1:
NL
NL

lea dx,ms10
mov ah,09
int 21h
NL

mov ah,01
int 21h

cmp al,'0'
je close
jmp start

close:
NL
lea dx, ms11
mov ah,09
int 21h

mov ah,4ch
int 21h


main endp
end main 
