.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    INT 21H
    MOV CH,AL
    SUB CH,48
    
    MOV CL,0
    
    LOOP1:
        ADD CL,2
        CMP CL,BH
        JL LOOP1
        JE DISPLAYE
        JG DISPLAYO
    
    DISPLAYE:
        MOV AH,2
        MOV DL,'E'
        INT 21H
        JMP ENDER
    DISPLAYO:
        MOV AH,2
        MOV DL,'O'
        INT 21H
        JMP ENDER
     
    ENDER:
        MOV AH,4CH
        INT 21H
    
   
    

MAIN ENDP

END MAIN