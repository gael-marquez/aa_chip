    @0
    D=M         
    @n
    M=D

    @0
    M=0
    @1
    M=0

(LOOP)
    @n
    D=M
    @i
    D=D-M
    @END
    D;JEQ

    @i
    D=M
    D=D+M     
    D=D+1

    @1
    M=M+D

    @i
    M=M+1  

    @LOOP
    0;JMP 

(END)
    @END
    0;JMP