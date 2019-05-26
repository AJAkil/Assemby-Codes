.MODEL SMALL
.STACK 100H
.DATA


.CODE 

MAIN PROC 
        
        
       MOV AL, 057
       MOV BL, 081
       
       MOV AH, 2
       
       CMP AL, BL
       JNBE ELSE_ ;JUMP IF AL IS NOT BIGGER THAN OR EQUAL TO BL
       
       MOV DL, AL
       JMP DISPLAY
       
       
   ELSE_:
        MOV DL, BL
   
   DISPLAY:
        INT 21H
        
   END_IF: 
   
        MOV AH, 4CH
        INT 21H    
    
    
MAIN ENDP


END MAIN