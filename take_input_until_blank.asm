; PROGRAM TO READ CHARS UNTIL A BLANK IS READ
.MODEL SMALL
.STACK 100H
.CODE
    MAIN PROC
        ; LOOP
        REPEAT_LOOP:
            MOV AH, 1
            INT 21H  
            MOV BL, AL
            MOV AH, 2
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            CMP BL, ' '
            JNE REPEAT_LOOP
        ; RETURN TO DOS
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN