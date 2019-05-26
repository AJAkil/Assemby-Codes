.MODEL SMALL
.STACK 100H
.CODE


MAIN PROC
    
     MOV BL,0
     MOV AH,1
     INT 21H
     
  WHILE_:
     CMP AL,0DH
     JE END_WHILE
     INC BL
     INT 21H
     JMP WHILE_
  
  END_WHILE:
  
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
     
    
     MOV DL,BL
     INT 21H
     
     MOV AH,4CH
     INT 21H

    
MAIN ENDP

END MAIN