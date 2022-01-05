.model small
.stack 10h
.data
number db (?)
digit db 0,0,'$'
.code
    mov ax,@data
    mov ds,ax
    mov ax,3
    int 10h
    mov ah,1
    int 21h
    mov bl,al
    sub bl,30h
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov ah,1
    int 21h
    mov number[0],al
    sub number[0],30h
    mov ch,0
    mov cl,number[0]
    mov al,bl
    mov bl,0
balik:
    add bl,al
    loop balik
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov bh,0
    mov cx,bx
digit_0:
    cmp bl,0Ah
    jl digit_1
    sub bl,0Ah
    inc digit[0]
    loop digit_0
digit_1:

    mov digit[1],bl
    add digit[1],30h
    add digit[0],30h
    mov ah,2
    mov dl,digit[0]
    int 21h
    mov ah,2
    mov dl,digit[1]
    int 21h
    mov ah,4ch
    int 21h
    end
