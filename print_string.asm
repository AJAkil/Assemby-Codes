.MODEL SMALL
.STACK
.DATA
    ;BH BL 8 BITS REGISTER 1 BYTE
    ;BX IS 16 BIT REGISTER OR 1 WORD
    
    NUM DB 49
    CHAR DB 'A'
    MSG DB "MY NAME IS AKIL$"
    B_ARRAY DB 10H,20H,30H
                                             
.CODE

MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX ;THIS PART IMPORTS ALL THE VARIABLE TO BE USED
        
        MOV AH, 2
        MOV DL, NUM
        INT 21H
        
        ;NEW LINE IS NECESSARY
        ;MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H 
        
        MOV DL, CHAR
        INT 21H
        
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
        MOV AH, 9 ; A STRING IS TO BE PRINTED
        LEA DX, MSG ; USED FOR THE STRING MESSAGE TO BE PRINTED
        INT 21H
          
      MOV AH, 4CH
      INT 21
      MAIN ENDP
END MAIN


