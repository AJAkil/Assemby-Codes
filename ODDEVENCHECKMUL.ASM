.MODEL SMALL
.STACK 100H

.DATA
    
     N3 DB ?
     N4 DB ?
     
     NEWLINE DB 0DH,0AH,"$"
     EVENMSG DB "EVEN$"
     ODDMSG DB "ODD$"
     
.CODE

MAIN PROC
     MOV AX,@DATA                         
     MOV DS,AX

    MOV AH,1
    INT 21H
    INT 21H
    
    MOV BL,AL
    
    ;FOR PRINTING STRINGS
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    INT 21H
    
    MOV CL,AL
    
    ;CHECKING ODD OR EVEN
    
    SUB BL,48
    SUB CL,48
        
    MOV N3,0D
    MOV N4,0D
    
    LOOP1:
        CMP BL,0
        JE LOOP2
        ADD N3,2
        CMP N3,BL
        JE LOOP2
        JG END_LOOP
        JNE LOOP1
        
      
        
    LOOP2:
        
        CMP CL,0
        JE LOOP2
        ADD N4,2
        CMP N4,CL
        JE EVEN
        JG END_LOOP
        JNE LOOP2
        
        
    EVEN:
        
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
        LEA DX,EVENMSG
        MOV AH,9
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
        JMP FINISH
        
     END_LOOP:
        
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
        LEA DX,ODDMSG
        MOV AH,9
        INT 21H
        JMP FINISH
        
     FINISH:
        MOV AH,4CH
        INT 21H   
     
     

MAIN ENDP

END MAIN
        