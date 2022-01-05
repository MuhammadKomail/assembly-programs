.model small
.stack 100h  


.data 

    msg db "Welcome to your game$"
    msg0 db "you have only 3 livs to complite your game-$"                                 ;add

    msg1 db "What is your mane? "     ;add
    msg2 db "Type a letter: $"     ;add
    newline db 13, 10, "$"    ;add
    msg3 db "YOU WIN$"       ;add
    msg4 db "YOU LOSE$"       ;add
      
    word1 db "saimun$"        ;add
    discoverword db 6 dup("-"), "$" ;add
    size1 db 6       ;
    lives db 3        ;           
    hits db 0          ;
    errors db 0          ;add



wid dw ? 
len dw ?

vx dw ?
vy dw ?
hx dw ?
hy dw ? 
 
b_x dw ?
b_y dw ?  

left_x dw ?
left_y dw ?

right_x dw ?

right_y dw ?

hand_leg_len dw 20



stick_x dw  240
stick_y dw  240
stick_len dw 240 

bar_x dw 240
bar_y dw 240
bar_len dw 100


rop_x dw 340
rop_y dw 240
rop_len dw 50


head_x dw 330
head_y dw 290
head_len dw 20
head_wid dw 20


body_x dw 340
body_y dw 310
body_len dw 50


l_leg_x dw 340
l_leg_y dw 360 

r_leg_x dw 340
r_leg_y dw 360

l_hand_x dw 340
l_hand_y dw 330 

r_hand_x dw 340
r_hand_y dw 330






.code



    
    
main proc
    mov ax,@data
    mov ds,ax   
    
    
    
    
    
    
    mov ah,0
    mov al,12h
    int 10h 
    
     mov al,4
    
  
            
            
    lea     dx,  msg   ;add
    call    print  
    lea     dx, newline
    call    print
    
             
    lea     dx,  msg0   ;add
    call    print  
    lea     dx, newline
    call    print  
    
           
mainloop:               ;add to code here     ;add
      
    lea     dx, newline  ;
    call    print         ;
    lea     dx,  msg1      ;
    call    print           ;
    lea     dx, newline      ;
    call    print             ;
    call    print              ;
    lea     dx, discoverword    ;
    call    print                ;
                                  ;
    lea     dx, newline            ;
    call    print                   ;
    call    print                    ;
                                      ;
    call    chk                        ;
                                        ;
    lea     dx,  msg2                    ;
    call    print                         ;
                                           ;
    call    input                           ;
    call    update                           ;
                                              ;
    call    clear_screen 
    mov al,4
    
    call hang                      ;
    jmp    mainloop                            ;
          
                                                 ;
chk:  ;check         ;add                         ;
                                                   ;
                                                    ;;
    mov     bl, ds:[lives]                            ;
    mov     bh, ds:[errors]                            ;
    cmp     bl, bh                                                   ;
                                                          ;
    je      game_over                                      ;
                                                            ;
    mov     bl, ds:[size1]                                   ;
    mov     bh, ds:[hits]                                     ;
    cmp     bl, bh                                             ;
                                                                ;
    je      gamewin                                              ;
                                                                  ;
                                                                   ;
                                                                    ;
                                                                     ;
    ret                                                               ;
                                                                       ;
                                                                        ;
update:            ;add                                                  ;
    lea     si, word1                                                     ;
    lea     di, discoverword                                               ;
    mov     bx, 0                                                           ;
        
    updateloop:     ;add

   
    
    cmp     byte ptr [si], "$"
    je      endword
    
  
    cmp     [di], al      ; chk if letter is already taken
    je      increment
    
      
    cmp     [si], al  ; chk if letter is on the word  
    je      equals
                 
    increment:
    
         
    inc     si
    inc     di   
    jmp     updateloop    
                 
    equals: 
            
    mov     [di], al
    inc     hits
    mov     bx, 1
    jmp     increment             
    
    endword:         ;add 
    
    cmp     bx, 1
    je      endupdate

    
    inc     errors 
    call hang
    
    
    
    
    
          
    
    endupdate:       ;add
    ret
       
game_over:      ;add
   lea     dx,  msg4
   call    print
   
   
   
   
    
   ; call hang_man
    
    
   jmp     fim       
 

gamewin:         ;add
    lea     dx,  msg3
    call    print
    
    
    jmp     fim
    
    
 
    
clear_screen:   ; get and set video mode      ;add
    mov     ah, 0fh
    int     10h   
    
    mov     ah, 0
    int     10h
    
    ret
  
    
input:  ; input & read keyborad and return in al      ;add
    mov     ah, 1
    int     21h
    
    ret
    

print:   ;add
    mov     ah, 9
    int     21h
    
    ret

     
fim:
    jmp     fim   ;add   
            
            
    jmp exit     ;add
             
             
      ; call stage      ;add
;       call hang_man   ;add      
             
             
             
             
    
   


endp
;;;;;;;;;;;;;;;;;;;;;;  user function     ;;;;;;;;;;;;;;;;;;;;;;;;; 


hang proc
    
    cmp errors,1
    jge head_c
    jmp done1
    
      
    head_c: 
    
     call stage
    
  
    
    
    
    done1:
    cmp errors,2
    jge body_c
    jmp done2
    
    
    body_c:
    

    mov dx,head_x
    mov b_x,dx
    mov dx,head_y
    mov b_y,dx    
    mov dx,head_len
    mov len,dx
    mov cx,len   
    mov dx,head_wid
    mov wid,dx 
    call box  
     

    
    
    done2:
    cmp errors,3
    jge part_c
    jmp done3    
    
    part_c:


    mov dx,body_x
    mov vx,dx
    mov dx,body_y
    mov vy,dx
    mov cx,body_len
    call vartical    
    
    
  ;;;;;;;;; left leg ;;;;;
   
    mov dx,l_leg_x
    mov left_x,dx
    mov dx,l_leg_y
    mov left_y,dx
    mov cx,hand_leg_len
    call left
                       
  ;;;;;; left hand ;;;;;                     
                       
    mov dx,l_hand_x
    mov left_x,dx
    mov dx,l_hand_y
    mov left_y,dx
    mov cx,hand_leg_len
    call left
    
    
;;;;;;;; right hand ;;;;;;      
    
    mov dx,r_hand_x
    mov right_x,dx
    mov dx,r_hand_y
    mov right_y,dx
    mov cx,hand_leg_len
    call right 
    
    
;;;;;;;; right leg ;;;;;
    
    mov dx,r_leg_x
    mov right_x,dx
    mov dx,r_leg_y
    mov right_y,dx
    mov cx,hand_leg_len
    call right    
    
      
    
    done3: 
    
    
        
    
    
ret
endp









stage proc

;;;;;; stick ;;;;;;;;;;
 stick:
    mov dx,stick_x
    mov vx,dx
    mov dx,stick_y
    mov vy,dx
    mov cx,stick_len
    call vartical
    
    
;;;;;;;; bar ;;;;;;;

    mov dx,bar_x
    mov hx,dx
    mov dx,bar_y
    mov hy,dx
    mov cx,bar_len
    call horizon 
   ; call updateloop 
;;;;;;; rop ;;;;;;
  roop: 
    mov dx,rop_x
    mov vx,dx
    mov dx,rop_y
    mov vy,dx
    mov cx,rop_len
    call vartical
    
    
    
    
ret
endp

hang_man proc
     
     
  ;;;;; head ;;;;;;   
     
    mov dx,head_x
    mov b_x,dx
    mov dx,head_y
    mov b_y,dx    
    mov dx,head_len
    mov len,dx
    mov cx,len   
    mov dx,head_wid
    mov wid,dx 
    call box     
   ;;;; body ;;;;;
     
    mov dx,body_x
    mov vx,dx
    mov dx,body_y
    mov vy,dx
    mov cx,body_len
    call vartical
    
    
   ;;;;;;;;; left leg ;;;;;
   
    mov dx,l_leg_x
    mov left_x,dx
    mov dx,l_leg_y
    mov left_y,dx
    mov cx,hand_leg_len
    call left
                       
  ;;;;;; left hand ;;;;;                     
                       
    mov dx,l_hand_x
    mov left_x,dx
    mov dx,l_hand_y
    mov left_y,dx
    mov cx,hand_leg_len
    call left
    
    
;;;;;;;; right hand ;;;;;;      
    
    mov dx,r_hand_x
    mov right_x,dx
    mov dx,r_hand_y
    mov right_y,dx
    mov cx,hand_leg_len
    call right 
    
    
;;;;;;;; right leg ;;;;;
    
    mov dx,r_leg_x
    mov right_x,dx
    mov dx,r_leg_y
    mov right_y,dx
    mov cx,hand_leg_len
    call right    
        
    
ret
endp



left proc
    
  l_lp: 
    
    push cx 
    
    mov ah,0ch
    mov bh,0
    mov cx,left_x
    mov dx,left_y
    int 10h 
    
    
    dec left_x
    inc left_y
    
     
    pop cx
    loop l_lp  
    
    
    
ret
endp


right proc
    
  r_lp: 
    
    push cx 
    
    mov ah,0ch
    mov bh,0
    mov cx,right_x
    mov dx,right_y
    int 10h 
    
    
    inc right_x
    inc right_y
    
     
    pop cx
    loop r_lp  
    
    
    
ret
endp





vartical proc
    
  vr_lp: 
    
    push cx  
    
    mov ah,0ch
    mov bh,0           
    mov cx,vx
    mov dx,vy
    int 10h   
    
    inc vy
    
     
    pop cx
    loop vr_lp  
    
ret    
endp



horizon proc
    
  hz_lp: 
    
    push cx  
    
    mov ah,0ch
    mov bh,0           
    mov cx,hx
    mov dx,hy
    int 10h   
    
    inc hx
    
     
    pop cx
    loop hz_lp  
    
ret    
endp 
      
      
      
      
box proc
    
    box_lp:
        push cx
          
        mov dx,b_x
        mov hx,dx 
        mov dx,b_y
        mov hy,dx 
        mov cx,wid 
        call horizon
            
        
        
        inc b_y
        
        pop cx
     loop box_lp
    
    
ret
endp      
      
      
      
;;;;;;;;;;;;;;;;;;;;  end user function  ;;;;;;;;;;;;;;;;;;;;      
      
  
    exit:


    mov ah,4ch 
    int 21h         
      
      
end main