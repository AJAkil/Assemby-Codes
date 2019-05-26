; WEIGHTED SUM
.MODEL SMALL
.STACK 100H
.DATA
    GRADE DB ?
    WEIGHT DB ?
    SUM DW 0
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX, 3
                
    LOOP_:
        MOV AH, 1
        INT 21H
        SUB AL, 48
        MOV GRADE, AL
        INT 21H
        SUB AL, 48
        MOV WEIGHT, AL
        MOV AL, GRADE
        MUL WEIGHT
        ADD SUM, AX
        DEC CX
        JNZ LOOP_
    MOV DX, SUM
    MOV AH, 2
    INT 21H
    
    
MAIN ENDP
    END MAIN
         