.MODEL SMALL
.STACK 100H

.DATA

.CODE

MAIN PROC
    MOV CL,1;i=1
    MOV CH,4;N=4
    MOV DL,'*'
    
    MOV AH,2
    LOOP1:
    MOV DL,'*'
    MOV BH,1;j = 1
    LOOP2:
    INT 21H
    INC BH
    MOV BL,CH
    SUB BL,CL
    ADD BL,1
    CMP BH,BL
    JNG LOOP2
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    INC CL
    CMP CL,CH
    JNG LOOP1
    
MAIN ENDP

END MAIN