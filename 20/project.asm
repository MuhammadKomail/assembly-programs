.model small
.stack 100h
.code 

start:

mov ah,0 ;set mode
mov al,13h ;mode=13VGA High resolution
int 10h ;invoke the interrupt to change to video mode

;S starts
mov cx,114 ;;start line at column=114 
mov dx,125  ;row=125 
s1: 

mov ah,0ch ;ah=0ch to draw a line 
mov al,04h ;pixels=Red color                ;color change karta hai
int 10h    ;invoke the interrupt
dec dx      ;Decreament the vertical position 
cmp dx,100  ;draw line until row=100

jnz s1


mov cx,114
mov dx,100

s2: 

mov ah,0ch  ;ah=0ch to draw a line 
mov al,04h  ;pixels=Red color
int 10h     ;invoke the interrupt
inc cx      ;increment the horizontal position 
cmp cx,150  ;draw line until colunm=150
jnz s2


 mov cx,114
 mov dx,125
 
 s3: 
 
 mov ah,0ch ;ah=0ch to draw a line 
 mov al,04h ;pixels=Red color
 int 10h    ;invoke the interrupt
 inc cx     ;increment the horizontal position 
 cmp cx,150 ;draw line until colunm=150
 
 jnz s3


mov cx,150 ;;start line at column=150 
mov dx,150  ;row=150 
s4: 

mov ah,0ch ;ah=0ch to draw a line 
mov al,04h ;pixels=Red color                ;color change karta hai
int 10h    ;invoke the interrupt
dec dx      ;Decreament the vertical position 
cmp dx,125  ;draw line until row=125

jnz s4


mov cx,114
mov dx,150
 
s5: 
 
mov ah,0ch ;ah=0ch to draw a line 
mov al,04h ;pixels=Red color
int 10h    ;invoke the interrupt
inc cx     ;increment the horizontal position 
cmp cx,150 ;draw line until colunm=150
 
jnz s5
 
;S ends
 
;M starts
 
mov cx,164 ;;start line at column=154 
mov dx,150  ;row=125 
m1: 

mov ah,0ch ;ah=0ch to draw a line 
mov al,03h ;pixels=Red color                ;color change karta hai
int 10h    ;invoke the interrupt
dec dx      ;Decreament the vertical position 
cmp dx,100  ;draw line until row=100

jnz m1

mov cx,212 ;;start line at column=154 
mov dx,150  ;row=125 
m2: 

mov ah,0ch ;ah=0ch to draw a line 
mov al,03h ;pixels=Red color                ;color change karta hai
int 10h    ;invoke the interrupt
dec dx      ;Decreament the vertical position 
cmp dx,100  ;draw line until row=100

jnz m2
 
mov cx,189
mov dx,124 

m3: 

mov ah,0ch  ;ah=0ch to draw a line 
mov al,03h  ;pixels=Light Blue color
int 10h     ;invoke the interrupt
inc cx      ;increment the horizontal position 
dec dx      ;Decreament the vertical position 
cmp cx,216  ;draw line until column=100
cmp dx,100  ;draw line until row=100
jnz m3

mov cx,164
mov dx,100

m4: 

mov ah,0ch
mov al,03h
int 10h
inc cx
inc dx
cmp cx,236
cmp dx,125
jnz m4 


;M ends

;I starts 


mov cx,234 ;;start line at column=154 
mov dx,150  ;row=125 
I1: 

mov ah,0ch ;ah=0ch to draw a line 
mov al,06h ;pixels=Red color                ;color change karta hai
int 10h    ;invoke the interrupt
dec dx      ;Decreament the vertical position 
cmp dx,100  ;draw line until row=100

jnz I1


;U Starts

mov cx,260
mov dx,150

U1: 

mov ah,0ch
mov al,09h
int 10h
dec dx
cmp dx,100

jnz U1

mov cx,290
mov dx,150

U2: 

mov ah,0ch
mov al,09h
int 10h
dec dx
cmp dx,100
jnz U2


mov cx,260
mov dx,150

U3: 

mov ah,0ch
mov al,09h
int 10h
inc cx
cmp cx,290

jnz U3



; read keyboard 
Mov ah,0
int 16h			; int 16h will communicate with keyboard
; set text mode
Mov ax,3
int 10h

Mov ah,4ch
int 21h

end start