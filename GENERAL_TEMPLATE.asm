.MODEL SMALL
.STACK 100H

.DATA
;NEWLINE DB 0DH,0AH,"$"

.CODE
MAIN PROC
;MOV AX,@DATA
;MOV DS,AX

;CODE FOR NEW LINE
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
        
;; PRINT NEWLINE
        MOV AH, 2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH       
        
MOV AH,4CH
INT 21H
   
MAIN ENDP

END MAIN
