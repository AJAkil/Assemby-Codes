.model small
.stack 100h
.data 
    t db ?
.code
    
    mov AX,@DATA
    mov ds,Ax
    
    main proc
    mov cx,5
    mov bl,11011B
    
    loop1:
        
        mov t,bl
        shr bl,1
        AND t,1b
        add t,48
    
        mov ah,2
        mov dl,t
        int 21h
        LOOP loop1    
     
    
    
    main endp
end main     

    