.MODEL SMALL
.STACK 100H

.DATA

      DIGIT DW ?
      TOTAL DW ?
.CODE

    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
         
        MOV AH,2
        MOV DL,'?'
        INT 21H
        
        XOR BX,BX ;BX HOLDS TOTAL
        XOR CX,CX ; CX HOLDS THE SIGN
        
        ;READ A CHARACTER
        MOV AH,1
        INT 21H
        
        ;FIND OUT IF NEG OR POS
        CMP AL,'-'
        JE MINUS
        CMP AL,'+'
        JE PLUS
        JMP INPUT_LOOP
        
        MINUS:
            MOV CX,1 ;NEGETIVE TRUE
        PLUS:
            INT 21H  ;READ A CHARACTER
        ;END CASE
        
        INPUT_LOOP:
            CMP AL,'0'
            JNGE NOT_DIGIT
            CMP AL,'9'
            JNLE NOT_DIGIT
            
            ;CONVERT CHARACTER TO A DIGIT
            AND AX,000FH
            MOV DIGIT,AX
            
            ;TOTAL = TOTAL*10+DIGIT
            MOV AX,10
            MUL BX ;AX = TOTAL*10
            ADD DIGIT,AX ;DIGIT = AX+DIGIT(TOTAL)
            MOV BX,DIGIT ;BX = TOTAL
           
            
            ;READ A CHARACTER
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JNE INPUT_LOOP
            
            ;UNTIL CR
            MOV TOTAL,BX ;STORE THE NUMBER IN TOTAL VARIABLE
            
            
            ;IF NEGETIVE
            OR CX,CX
            JE EXIT
            
            NEG TOTAL
            
            JMP EXIT
        
        
               
        
        
        NOT_DIGIT:
            MOV AH,2
            MOV DL,0DH
            INT 21H
            MOV DL,0AH
            INT 21H
            JMP INPUT_LOOP
            
        EXIT:

    MAIN ENDP
END MAIN