//Clear registre mellem runs
@POPN
M=0
@POPN-1
M=0
@POPN-2
M=0
@DEVIINC
M=0
@MULTIDEC
M=0

//////////////////////////////////////////////////////////////////////

//Check n=0
@R0
D=M
@BASISRETURN0
D;JEQ

//Check n=1
@R0
D=M-1
@BASISRETURN1
D;JEQ

//////////////////////////////////////////////////////////////////////

//Indsæt basistilfælde i rekursionsskema
@POPN-2
M=0

@POPN-1
M=1

//////////////////////////////////////////////////////////////////////

//Initialize multiplikations-dekrementer
(MULTI)

@POPN-1
D=M
@MULTIDEC
M=D

(MULTILOOP)

//Check multiplikations-decrimentering er opfyldt
@MULTIDEC
D=M
@DEVISLOOP
D;JEQ 

//Multiplikation ved summering over Pop(n-1)
@9
D=A
@POPN
M=M+D

//Dekrementerings-step
@MULTIDEC
M=M-1

@MULTILOOP
0;JMP

//////////////////////////////////////////////////////////////////////

(DEVISLOOP)

//Check om der kan fratrække 4 fra multiplumet
@POPN
D=M
@4
D=D-A
@DEVISREPLACE
D;JLT

//Fratræk 4 fra multiplum
@4
D=A
@POPN
M=M-D

//Inkrementerings-step
@DEVIINC
M=M+1

@DEVISLOOP
0;JMP

/////////////////////////////////////////////////////////

(DEVISREPLACE)

//Swap rundt med devisions-inkrementeren
@DEVIINC
D=M
@POPN
M=D

@SUB
0;JMP

///////////////////////////////////////////////////////////

(SUB)

//Fratræk Pop(n-2)
@POPN-2
D=M
@POPN
M=M-D

@RETURN
0;JMP

///////////////////////////////////////////////
 
(RETURN)

//Løbende placer den aktuelle Pop(n) i R1
@POPN
D=M
@R1
M=D

//Check om antallet af rekursioner er nået.
@R0
D=M
@2 //Offset, fordi der ikke er foretaget rekursion på n=0 og n=1.
D=D-A
@END
D;JLE

@SHIFT
0;JMP

////////////////////

(SHIFT)

//Decrementer antallet af foretaget rekursioner.
@R0
M=M-1

//Shift rekursionsværdierne et step tilbage
@POPN-1
D=M
@POPN-2
M=D

@POPN
D=M
@POPN-1
M=D

//Clear varibale til næste rekursionsstep

@POPN
M=0
@DEVIINC
M=0
@MULTIDEC
M=0


@MULTI
0;JMP

////////////////////////////////////////////

//Værdier for de to basistilfælde.
(BASISRETURN0)
M[1]=0
@END
0;JMP

(BASISRETURN1)
M[1]=1
@END
0;JMP

////////////////////////////////////////////

//Loop som afslutning for at forbygge crash
(END)
@END
0;JMP