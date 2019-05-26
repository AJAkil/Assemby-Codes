.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
        MOV AH, 2                        ;DISPLAY CHARACTER FUNCTION
        MOV DL, '?'                      ;CHARACTER IS ?
        INT 21H                          ; DISPLAY IT
        
   ;INPUT A CHARACTER
        MOV AH, 1                        ;READ A CHARACTER FROM THE USER
        INT 21H                          ;DISPLAY THE CHARACTER
        MOV BL, AL                       ;MOVE THE CHARACTER TO BL FROM AL
        
   ;GO TO A NEW LINE
        MOV AH, 2                        ;DISPLAY CHARACTER FUNCTION
        MOV DL, 0DH                      ;CARRIAGE RETURN
        INT 21H                          ;EXECUTE CARRIAGE RETURN
        MOV DL, 0AH                      ;NEW LINE FUNCTION
        INT 21H                          ;EXECUTE NEW LINE FUNCTION
        
    ;DISPLAY THE NEW CHARACTER TAKEN FROM INPUT        
        MOV DL, BL                       ;MOVE THE CONTENT OF BL TO DL
        INT 21H                          ;DISPLAY IT 
        
    ;RETURN TO DOS
        MOV AH, 4CH                      ;DOS EXIT FUNCTION      
        INT 21H                          ;EXECUTE THE EXIT FUNCTION
        
    
MAIN ENDP
    END MAIN