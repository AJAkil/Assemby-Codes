.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH, 1
    INT 21H
    MOV CL, AL
    
    CMP CL, 0
    JL NEGATIVE
    JE ZERO
    JG POSITIVE
    
    
    NEGATIVE:
        MOV BX, -1
    
    ZERO:
        MOV BX, 0
    
    POSITIVE:
        MOV BX, 1
    
    END_CASE:
        
        MOV AH, 2
        MOV DL, BX
        INT 21H
    
MAIN ENDP

END MAIN