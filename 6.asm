.MODEL SMALL
.STACK 100H 
.DATA
.CODE
MAIN PROC 
    
    MOV AH, 1      
    INT 21H
    SUB AL, 48
    MOV CL, AL     
    MOV CH, 0
    MOV BL, 0     

LOL:
    MOV AH, 1
    INT 21H        
    SUB AL, 48
    ADD BL, AL
    LOOP LOL

    
    ADD BL, 48
    MOV DL, BL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN