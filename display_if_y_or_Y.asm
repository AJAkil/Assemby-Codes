; PROGRAM TO DISPLAY A CHARACTER IF UPPER CASE
.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DB ?
    MSG1 DB 'ENTER A CHARACTER : $'
.CODE
    MAIN PROC
        ; INITIALIZE DS
        MOV AX, @DATA
        MOV DS, AX
        ; PRINT MSG1
        LEA DX, MSG1
        MOV AH, 9
        INT 21H
        ; TAKE INPUT
        MOV AH, 1
        INT 21H
        MOV VAR1, AL
        ; CHECK IF y OR Y
        CMP VAR1, 'y'
        JE DISPLAY
        CMP VAR1, 'Y'
        JE DISPLAY
        JMP END_IF
        ; DISPLAY CHARACTER  
        DISPLAY:
        ; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        ; PRINT VAR1
        MOV DL, VAR1
        INT 21H
        END_IF: 
        ; RETURN TO DOS
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN
        