.MODEL SMALL
.STACK 100H

.CODE
    

MAIN PROC

    MOV CX,49
    MOV BX,3
    MOV AX,1 ;FIRST TERM
    
    ;SUM_LOOP:
        ;DEC CX
        ;JE END_LOOP
        ;ADD AX,BX
        
    
               
    SUM:
        ADD AX,BX
        CMP AX,148
        JE END_LOOP
        LOOP SUM    
     
     END_LOOP:
        MOV AH,4CH
        INT 21H
    
MAIN ENDP

END MAIN