.MODEL SMALL
.STACK 100H
.DATA
    
        CR EQU 0DH
        LF EQU 0AH
    
    MSG1 DB 'ENTER A LOWERCASE LETTER: $'
    MSG2 DB CR,LF,'THE UPPERCASE VERSION IS: '
    CHAR DB ?, '$'
    
.CODE 

MAIN PROC
    
    MOV AX, @DATA    ;GET DATA SEGMENT
    MOV DS,AX        ;INITIALIZE DS
    
    ;PRINT USER PROMPT
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    ;INPUT A CHARACTER FROM USER AND CONVERT IT INTO UPPERCASE LETTER
    MOV AH, 1
    INT 21H
    SUB AL, 20H
    MOV CHAR,AL
    
    ;DISPLAY THE UPPERCASE LETTER
    LEA DX, MSG2
    MOV AH,9
    INT 21H
    
    
    
    ;DOS EXIT
    MOV AX, 4CH
    INT 21H
    
    
MAIN ENDP

    END MAIN
   
    
    
 