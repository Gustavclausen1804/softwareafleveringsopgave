//TESTVÆRDIER
// @9 //Number1
// D=A
// @R0
// M=D



//Check om n matcher 0
@R0
D=M  //Lægger n i D
@BASISRETURN0 //Lægger END i A
D;JEQ //Hop til END hvis D=0

//Check om n mathcer 1
@R0
D=M
@1
D=D-A
@BASISRETURN1
D;JEQ





//////////////////////////////////////////////////////////////////////
//Basistilfælder

@0
D=A
@POPN-2
M=D

@1
D=A 
@POPN-1
M=D

AD=0 //CLEAR


///////////////////////////////////////////////////////////////////
(MULTI)

//INIT MULTIPLIKATIONS-DEKREMENTER
@9
D=A
@MULTIDEC
M=D

AD=0 //CLEAR


(MULTILOOP)

@MULTIDEC //Address for 9 times multiplication
D=M
@DEVIS
D;JEQ //Tjek om incrementering er 0

AD=0 //CLEAR

@POPN
D=M //Aktuel værdi for P(N)
@POPN-1
D=D+M //Læg P(n-1) til
@POPN
M=D //Læg det tilbage i P(n)

AD=0 //CLEAR

@MULTIDEC
D=M-1
@MULTIDEC
M=D

AD=0 //CLEAR

@MULTILOOP
0;JMP

///////////////////////////////////////////////////////////

(DEVIS)
//INIT DIVISIONS-INCREMENTER
@0
D=A
@DEVIINC
M=D

AD=0 //CLEAR



(DEVISLOOP)

//Check om Pop(n) er større end 4
@POPN
D=M
@4
D=D-A
@DEVISREPLACE
D;JLT //HVis POPN er mindre end 0, og der dermed ikke kan fratrækkes 4, så hoppes til sub 

AD=0 //CLEAR

//Fratræk 4
@POPN
D=M
@4
D=D-A
@POPN
M=D

AD=0 //CLEAR

//Inkrement
@DEVIINC
D=M
D=D+1
@DEVIINC
M=D

AD=0 //CLEAR

@DEVISLOOP
0;JMP

/////////////////////////////////////////////////////////

(DEVISREPLACE)

@DEVIINC
D=M
@POPN
M=D

AD=0 //Clear

@SUB
0;JMP

///////////////////////////////////////////////////////////

(SUB)

@POPN
D=M
@POPN-2
D=D-M
@POPN
M=D

AD=0 //Clear

@RETURN
0;JMP

///////////////////////////////////////////////
 
(RETURN)

//Placer Pop(n) i R1
@POPN
D=M
@R1
M=D

AD=0

//Vurder om antallet af rekursioner er nået.
@R0
D=M
@2 //Offset, fordi vi allerede har inddraget de to forregående værdier.
D=D-A
@END
D;JLE //D er 0 eller negativ, hvis den bare skal indsætte værdien i R1

AD=0

@SHIFT
0;JMP


(SHIFT)

AD=0

@R0
D=M
D=D-1
@R0
M=D

AD=0 //Clear

@POPN-1
D=M
@POPN-2
M=D

AD=0 //Clear

@POPN
D=M
@POPN-1
M=D

AD=0

//Clear PopN

@POPN
M=0
@DEVIINC
M=0
@MULTIDEC
M=0

AD=0

@MULTI
0;JMP

////////////////////////////////////////////
//Her kommer scenarierne 
(BASISRETURN0)
M[1]=0
@END
0;JMP

(BASISRETURN1)
M[1]=1
@END
0;JMP

(END)