NL macro
mov ah,02
mov dl,0AH
int 21h
mov dl,0dh
int 21h
endm

Inp macro
mov ah,01 
int 21h
endm

.model huge
.stack 200h
.386 ;new learning
.data
ms1 db "..............*** WELCOME FOR THE QUIZ ***...............$"
ms2 db "Press Enter to Start$"
ms3 db "Correct$"
ms4 db "Incorrect$"
ms5 db "..............*** Successfully Completed ***...............$" 
ms6 db "Press 1 for Reattempt and 0 for Exit$"
ms11 db "Thank You $"
Q1 db "1. In java,a method is a container that holds classes?$"
QA1 db " a)True b)False$" 
Q2 db "2. What does HTML stand for?$"
QA2 db " a)Hyper Trainer Marking Language b)Hyper Text Marketing Language c)Hyper Text Markup Language d)Hyper Text Markup Leveler$" 
Q3 db "3. Name different types of errors which occur during the execution of program?$"
QA3 db " a)Runtime Errors b)Syntax Errors c)Logical Errors d)All of these$" 
Q4 db "4. Type of constant?$"
QA4 db " a)Numeric Constant b)String Constant c)Neutral Constant d)a and b$" 
Q5 db "5. 2+5=?"
QA5 db " a)4 b)5 c)6 d)7$" 

.code
main proc

mov ah,0
mov al,14
int 10h

mov ah,0bh
mov bh,00h
mov bl,06
int 10h

mov bh,1
mov bl,1
int 10h

mov ax,@data
mov ds,ax

lea dx, ms1
mov ah,09
int 21h
NL                        
start:

NL

;calling message
lea dx,ms2
mov ah, 9
int 21h

Inp
cmp al,0dh 			;will campare either input is "enter" or not
je Que1 			;test the condition
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

Inp

cmp al, 'a' ;comparing input
je True1
jne False1 

True1:

NL
lea dx,ms3
mov ah,09
int 21h
;call nl

call Que2
;call input
NL

Inp
cmp al , 'd'
je True2
jne False2

False1:

NL

lea dx,ms4
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

Inp
cmp al, 'c'
je True2
jne False2

True2:

NL

lea dx,ms3
mov ah,09
int 21h

NL

call Que3



False2:

NL

lea dx,ms4
mov ah,09
int 21h

NL
call Que3

Que3:

NL

lea dx,Q4
mov ah,09
int 21h

NL

lea dx,QA3
mov ah,09
int 21h

NL

Inp
cmp al, 'd'
je True3
jne False3


True3:

NL

lea dx,ms3
mov ah,09
int 21h

inc bl

NL

call Que4

False3:

NL

lea dx,ms4
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

Inp
cmp al, 'd'
je True4
jne false4

True4:

NL

lea dx,ms3
mov ah,09
int 21h

inc bl

NL

call Que5

False4:

NL

lea dx,ms4
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

Inp
cmp al, 'd'
je True5
jne False5

True5:

NL

lea dx,ms3
mov ah,09
int 21h

NL
jmp Exit

False5:

NL

lea dx,ms4
mov ah,09
int 21h
NL

Exit:
NL
lea dx,ms5
mov ah,09
int 21h

NL
lea dx,ms6
mov ah,09
int 21h
NL

Inp
cmp al,'1'
je start

close:
NL
lea dx, ms6
mov ah,09
int 21h

mov ah,4ch
int 21h

main endp
end main