.MODEL SMALL
.STACK 100H
.CODE


MAIN PROC
    
     MOV DX,0
     MOV AH,1
     INT 21H
     
  WHILE_:
     CMP AL,0DH
     JE END_WHILE
     INC DX
     INT 21H
     JMP WHILE_
  
  END_WHILE:
     
     MOV AH,4CH
     INT 21H
    
MAIN ENDP

END MAIN