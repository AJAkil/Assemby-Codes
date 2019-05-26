.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AL, 2
    
    CMP AL,1
    JE ODD
    CMP AL,3
    JE ODD
    
    CMP AL,2
    JE EVEN
    CMP AL,4
    JE EVEN
    
 ODD:
    MOV DL,'O'
    JMP DISPLAY
    
 EVEN:
    MOV DL,'E'
    JMP DISPLAY
 
 
 DISPLAY:
    MOV AH,2
    INT 21H
    
 END_CASE:
    
    MOV AH, 4CH
    INT 21H
        
    
MAIN ENDP

END MAIN