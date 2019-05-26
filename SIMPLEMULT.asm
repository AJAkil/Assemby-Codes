.MODEL SMALL
.STACK 100H

.DATA
    P DB ?

.CODE

    MOV AX,DATA
    MOV DS,AX

    MOV AH,1
    INT 21H
    SUB AL,'0'
    MOV BL,AL
    MOV CL,-1
    
    MOV P,0D
    
    LOOP1:
    
    
    MULTIPLY:
        ADD P,CL
        DEC BL
        CMP BL,0
        JE RESULT
        JMP MULTIPLY
        
    RESULT:
        MOV BL,P     
        MOV AH,4CH
        INT 21H