.MODEL large
.stack 100h
.data
CHAR DB " "
  MESSAGE1 DB 0AH,0DH,'                       ------  A SIMPLE CALCULATOR ------ ','$'
  MESSAGE2 DB 0AH,0DH,'                           Made by: Danella Patrick   ','$'
  Space1 DB 0AH,0DH,'','$'
  Space2 DB 0AH,0DH,'','$'
MESSAGE3 DB 0AH,0DH,'             ------ Choose the operation you want to perform------ ','$'
MESSAGE4 DB 0AH,0DH,'                                -Press "1" to Add ','$'
MESSAGE5 DB 0AH,0DH,'                                -Press "2" to Sub ','$'
MESSAGE6 DB 0AH,0DH,'                                -Press "3" to Multiply ','$'
ADDm DB 0AH,0DH,'                              --Your result of Addition will be -- ','$'
SUBm DB 0AH,0DH,'                              --Your result of Subtraction will be-- ','$'
MULm DB 0AH,0DH,'                              --Your result of Multiplication will be -- ','$'

MESSAGE8 DB 10,13,' Choose Any One:$'
INPUT1 DB 10,13,10,13,' Enter 1st Number:$'
INPUT2 DB 10,13,' Enter 2nd Number:$'
RES DB 10,13,10,13,' The Result is:$' 
THANKS DB 10,13,10,13,'                                  ***THANK YOU ***$'
NUM1 DB ?
NUM2 DB ?
RESULT DB ?

.CODE
start:
mov ah,0 ; screen mode 
mov al,14 ; number of VGA 
int 10h

mov ah,0bh
mov bh,00h ;background color 
mov bl,05 ; color pixel 
int 10h

mov bh,1 ; palette
mov bl,1 ; no palette
int 10h

MOV AX,@DATA
MOV DS,AX
   
 LEA DX, MESSAGE1
 mov ah,09
 int 21h

  LEA DX, MESSAGE2
  mov ah,09
  int 21h
 
  LEA DX, space1
  mov ah,09
  int 21h

  LEA DX, space2
  mov ah,09
  int 21h

  LEA DX, MESSAGE3
  mov ah,09
  int 21h
  
  LEA DX, MESSAGE4
  mov ah,09
  int 21h

  LEA DX, MESSAGE5
  mov ah,09
  int 21h

  LEA DX, MESSAGE6
  mov ah,09
  int 21h

 
  LEA DX, MESSAGE8
  mov ah,09
  int 21h 
  
    MOV AH,01
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    Je ADD
    CMP BH,2
    JE SUB
    CMP BH,3
    JE MUL    
ADD:
LEA DX,ADDm;
    MOV AH,9
    INT 21H 
LEA DX,INPUT1  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV BL,AL
    LEA DX,INPUT2    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV CL,AL
    ADD AL,BL
    MOV AH,0
    AAA ;ASCII adjust after addition
    MOV BX,AX 
    ADD BH,48 ;converting Ascii to character 
    ADD BL,48  
    LEA DX,RES
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    JMP EXIT_P 
         
   SUB:
LEA DX,SUBm;
    MOV AH,9
    INT 21H 
 

    LEA DX,INPUT1  ;ENTER 1ST NUMBER
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    LEA DX,INPUT2    ;ENTER 2ND NUMBER
    MOV AH,9
    INT 21H 
    
    
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    SUB BL,CL
    ADD BL,48    
    LEA DX,RES
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
       
    JMP EXIT_P 
    
   MUL:
LEA DX,MULm;
    MOV AH,9
    INT 21H 

 
    LEA DX,INPUT1
    MOV AH,9
    INT 21H
   
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL
    
    
    LEA DX,INPUT2
    MOV AH,9
    INT 21H 
    
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL
    
    
    MUL NUM1
    MOV RESULT,AL
    AAM  
    
    
    ADD AH,30H
    ADD AL,30H
    
    
    MOV BX,AX 
    
    
    LEA DX,RES
    MOV AH,9
    INT 21H 
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
    
    
    JMP EXIT_P  
    
   
    EXIT_P:
    
        LEA DX,THANKS
        MOV AH,9
        INT 21H  
  
            
        
    EXIT:
    
mov ah,4ch
int 21h
    



end start                      