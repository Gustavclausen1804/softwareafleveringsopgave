// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm


// Put your code here.


//Load numbers into RAM

@5 //Number1
D=A
M[0]=D

@3 //Number2
D=A
M[1]=D

(LOOP)
D=M[1] //Hent incrementering
@END
D;JEQ //Tjek om incrementering er 0

D=M[0]  //Hent hvad der adderes
A=M[2]  //Hent summen
D=D+A   //Foretag adderingen
M[2]=D  //Gem den nye sum

D=M[1] //Hent incrementering
D=D-1 //Opdater incrementering
M[1]=D //Gem ny incrementering i register

@LOOP
0;JMP

(END)


