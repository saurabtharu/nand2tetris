// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


  @R2             
  M=0                     // Clearing result value at R2

  @R0
  D=M                     // for checking if it is greater than 0 i.e. R0 >= 0
  @END
  D;JLE
  
  @R1
  D=M                     // for checking if it is greater than 0 i.e. R0 >= 0
  @END
  D;JLE

(LOOP)
  @R0
  D=M                     // loading value in R0 into D register

  @R2
  M=M+D                   // R2 = R2 + R0
  D=M                     // D = content of R2

  @32678                  // A <- 32678
  D=D-A                   // (R2-32678)
  @ZERO         
  D;JGE                   // if (R2-32678) >= 0 i.e. R2 >= 32678, then JUMP to ZERO 
                          // R1*R2 must be < R2-32678

  @END
  D;JEQ

  @R1                     // 
  M=M-1                   // Modifying content of R1 by subtracting 1 from it i.e. R1 = R1 - 1
  D=M                     // 
  @END                    // 
  D;JEQ                   // if R1=0, jump to END 
  @LOOP
  0;JMP

(ZERO)
  @R2
  M=0

(END)
  @END
  0;JMP
