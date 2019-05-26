.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    MOV AH,1
    
 REPEAT:
    
    INT 21H
    
    CMP AL,' '
    JNE REPEAT
    
        
    
MAIN ENDP

END MAIN