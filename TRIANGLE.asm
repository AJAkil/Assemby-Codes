.MODEL SMALL
.STACK 100H

.DATA
NEWLINE DB 0DH,0AH,"$"

.CODE

MOV AX,@DATA
MOV DS,AX

MAIN PROC
MOV CL,1 ;i = 1
MOV BL,5 ;N = 3

MOV AH,2
MOV DL,'*'
LOOP1:
MOV DL,'*'
MOV BH,1 ;j = 1
LOOP2:
INT 21H
INC BH
CMP BH,CL
JNG LOOP2

MOV AH,2
MOV DL,0DH
INT 21H
MOV DL,0AH
INT 21H

INC CL
CMP CL,BL
JNG LOOP1

    
MAIN ENDP

END MAIN