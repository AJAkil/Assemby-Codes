.MODEL SMALL

.STACK 100H

.DATA
     RESULT DW 0    ;HOLDS THE RESULT
     MULTI  DW 1
     REM    DW ?
     COE    DW ?
     ORM    DW 1
     ERM    DW 0
     SUM    DW 0
     M      DW 2
     D      DW -2
     DIGIT  DW ?
     TOTAL  DW ?     ;CONTAINS THE TOTAL OF THE DECIMAL DIGITS
     OUTPUT DW ?
     CNTDG  DW ?     ;COUNTTS THE NUMBER OF DIGITS IN BASE -2 OUTPUT
     REVERSEOUT DW ?
     LOOPCO  DW ?    ;THE COUNTER FOR OUTER TEST CASE LOOP
     TESTCASE DW ?   ;NUMBER OF TESTCASES
     
     PROMPT1  DW 'ENTER NUMBER OF TESTCASES:$'
     PROMPT2  DW 'ENTER NUMBER:$'
     PROMPT3  DW 'OUTPUT:$'   
     
.CODE        
    MAIN PROC
        MOV AX,@DATA   ;SETTING UP SEGMENTS
        MOV DS,AX  
        
    ;INPUT STARTS HERE
    
    ;A INPUT-LOOP FOR TEST CASES
        LEA DX,PROMPT1
        MOV AH,9
        INT 21H
        
        XOR BX,BX ;BX HOLDS TOTAL
    
        ;READ A CHARACTER
        MOV AH,1
        INT 21H
        
        
        INPUT_LOOP1:
            CMP AL,'0'
            JNGE NOT_DIGIT1
            CMP AL,'9'
            JNLE NOT_DIGIT1
            
            ;CONVERT CHARACTER TO A DIGIT
            AND AX,000FH
            MOV DIGIT,AX
            
            ;TOTAL = TOTAL*10+DIGIT
            MOV AX,10
            MUL BX ;AX = TOTAL*10
            ADD DIGIT,AX ;DIGIT = AX+DIGIT(TOTAL)
            MOV BX,DIGIT ;BX = TOTAL
           
            
            ;READ A CHARACTER
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JNE INPUT_LOOP1
            
            ;UNTIL CR
            MOV TOTAL,BX ;STORE THE NUMBER IN TOTAL VARIABLE
                  
            JMP EXIT1

        NOT_DIGIT1:
            MOV AH,2
            MOV DL,0DH
            INT 21H
            MOV DL,0AH
            INT 21H
            JMP INPUT_LOOP1
            
        EXIT1:
            MOV AH,2
            MOV DL,0DH
            INT 21H
            MOV DL,0AH
            INT 21H
    
    ;THE TEST-CASE INPUT LOOP ENDS HERE
        MOV BX,TOTAL
        MOV TESTCASE,BX
        
        START:
        MOV TOTAL,0
        MOV DIGIT,0
        MOV LOOPCO,0
        
        INSIDE_LOOP:
            INC LOOPCO
            MOV BX,LOOPCO
            CMP BX,TESTCASE
            JG EXIT_INSIDE_LOOP
        
        ;MAIN CODE STARTS HERE
        LEA DX,PROMPT2
        MOV AH,9
        INT 21H
        
        XOR BX,BX ;BX HOLDS TOTAL
        XOR CX,CX ; CX HOLDS THE SIGN
         
        ;SETTING UP ALL THE VARIABLES 
        MOV RESULT,0
        MOV MULTI,1
        MOV SUM,0
        MOV M,2
        MOV D,-2
        MOV CNTDG,0
        MOV REVERSEOUT,0
        MOV OUTPUT,0
        
        ;READ A CHARACTER
        MOV AH,1
        INT 21H
        
        ;FIND OUT IF NEG OR POS
        CMP AL,'-'
        JE MINUS
        CMP AL,'+'
        JE PLUS
        JMP INPUT_LOOP
        
        MINUS:
            MOV CX,1 ;NEGETIVE TRUE
        PLUS:
            INT 21H  ;READ A CHARACTER
        ;END CASE
        
        INPUT_LOOP:
            CMP AL,'0'
            JNGE NOT_DIGIT
            CMP AL,'9'
            JNLE NOT_DIGIT
            
            ;CONVERT CHARACTER TO A DIGIT
            AND AX,000FH
            MOV DIGIT,AX
            
            ;TOTAL = TOTAL*10+DIGIT
            MOV AX,10
            MUL BX ;AX = TOTAL*10
            ADD DIGIT,AX ;DIGIT = AX+DIGIT(TOTAL)
            MOV BX,DIGIT ;BX = TOTAL
           
            ;READ A CHARACTER
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JNE INPUT_LOOP
            
            ;UNTIL CR
            MOV TOTAL,BX ;STORE THE NUMBER IN TOTAL VARIABLE
            
            ;IF NEGETIVE
            OR CX,CX
            JE EXIT           
            NEG TOTAL      
            JMP EXIT

        NOT_DIGIT:
            MOV AH,2
            MOV DL,0DH
            INT 21H
            MOV DL,0AH
            INT 21H
            JMP START
            
        EXIT:
    ;INPUT ENDS HERE
    CMP TOTAL,0
    JE  SETZERO
    JNE NORMALOP
    
    SETZERO:
        MOV CNTDG,1
        JMP EXITLOOP
    
    NORMALOP:
    MOV CX,TOTAL       ;TESTER VARIABLE N
    MOV COE,CX         ;MOVING TO COE FOR EVEN-ODD COMPARISON
    
    MOV MULTI,1        ;SETTING MULTIPLIER = 1
    
    MAIN_LOOP:
        
        CMP CX,0       
        JE EXITLOOP
        AND COE,1
        CMP COE,0
        JE EVEN
        JNE ODD
        
        EVEN:
             XOR AX,AX
             XOR DX,DX
             
             MOV AX,MULTI
             IMUL ERM
             MOV SUM,AX
             MOV BX,RESULT
             ADD BX,SUM
             MOV RESULT,BX
             MOV AX,MULTI
             MUL M
             MOV MULTI,AX
             
             INC CNTDG 
             
             CMP CX,0
             JG  POSE
             JL  NEGE
             
             POSE:
                MOV DX,0
                MOV AX,CX
                
                IDIV D
                
                MOV CX,AX
                
                MOV COE,CX
                
                JMP MAIN_LOOP
             
             NEGE:
                MOV DX,-1
                MOV AX,CX
                
                IDIV D
                
                MOV CX,AX
                
                MOV COE,CX
 
                JMP MAIN_LOOP
            
        ODD:    
                XOR AX,AX
                XOR DX,DX
                
                MOV AX,MULTI
                IMUL ORM
                MOV SUM,AX
                MOV BX,RESULT
                ADD BX,SUM
                MOV RESULT,BX
                MOV AX,MULTI
                MUL M
                MOV MULTI,AX
                
                INC CNTDG
                
                CMP CX,0
                JG  POSO
                JL  NEGO
                
                POSO:
                    MOV DX,0
                    MOV AX,CX
                
                    IDIV D
                
                    MOV CX,AX
                
                    MOV COE,CX
                
                    JMP MAIN_LOOP
                    
                 NEGO:
                    
                    MOV DX,-1
                    MOV AX,CX
                
                    IDIV D
                
                    MOV CX,AX
                    ADD CX,1
                    
                    MOV COE,CX
 
                    JMP MAIN_LOOP
    
    EXITLOOP:
    
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        ;OUTPUT GOES HERE
        
        XOR BX,BX
        MOV BX,RESULT
        MOV OUTPUT,BX
        XOR BX,BX
                 
        MOV RESULT,0    
        MOV RESULT,16D
        MOV BX,CNTDG
        SUB RESULT,BX         
        MOV CX,16
        
        ;THIS LOOP REVERSES THE OUTPUT
        REVERSE:
            SHL OUTPUT,1
            RCR REVERSEOUT,1
            LOOP REVERSE
        
        MOV BX,REVERSEOUT    
        MOV OUTPUT,BX   
        
        MOV SUM,0
        
        LEA DX,PROMPT3
        MOV AH,9
        INT 21H
            
        OUTPUT_PRINT:
            INC SUM
            CMP SUM,16
            JG EXIT_PROGRAM
            
            MOV BX,OUTPUT
            MOV M,BX
            SHR OUTPUT,1
            AND M,1
            
            MOV CX,RESULT
            CMP SUM,CX
            JNG OUTPUT_PRINT
            
            ADD M,48
            MOV AH,2
            MOV DX,M
            INT 21H
            JMP OUTPUT_PRINT
    
    EXIT_PROGRAM:
            MOV AH,2
            MOV DL,0DH
            INT 21H
            MOV DL,0AH
            INT 21H
            JMP INSIDE_LOOP
    
    EXIT_INSIDE_LOOP:
            MOV AX,4CH
            INT 21H
            
            
    MAIN ENDP
END MAIN
    
