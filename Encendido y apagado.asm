// Brandon Trejo Hernandez
// si es impar se pinta de negro si es par de blanco

(init)
    @8192
    D=A
    @inc
    M=D 

(start)
    @inc
    M=M-1
    D=M
    @init
    D;JLT 

    @KBD
    D=M
    @start
    D;JEQ 
    @1
    D=D&A
    @paint_black
    D;JNE 

    @paint_white
    0;JMP

(paint_black)
    @SCREEN
    D=A
    @inc
    A=D+M
    M=-1 

    @start
    0;JMP

(paint_white)
    @SCREEN
    D=A
    @inc
    A=D+M
    M=0 
    @start
    0;JMP
