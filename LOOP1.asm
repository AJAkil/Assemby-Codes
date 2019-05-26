.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    MOV CX,10
    MOV AH,2
    MOV DL,'*'
    
    JCXZ SKIP
    
 TOP:   
    INT 21H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV DL, '*'
    
    LOOP TOP
    
 SKIP:
    
 
  MOV AH,4CH
  INT 21H

MAIN ENDP

END MAIN