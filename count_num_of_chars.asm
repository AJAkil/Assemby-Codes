; PROGRAM TO COUNT NUMBER OF CHARACTERS IN INPUT LINE
.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH
.CODE
    MAIN PROC
        ; INITIALIZE DS
        MOV AX, @DATA
        MOV DS, AX
        ; TAKE INPUT
        MOV AH, 1
        INT 21H
        ; INITIALIZE COUNTER
        MOV DX, 0
        WHILE_LOOP:
            CMP AL, CR
            JE END_WHILE
            INC DX
            INT 21H
            JMP WHILE_LOOP
        END_WHILE:
        ; DISPLAY COUNT  
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        ; PRINT THE COUNT 
        MOV AH, 9
        INT 21H 
        ; RETURN TO DOS
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN
        