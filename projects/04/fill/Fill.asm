// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(RESTART)
  @SCREEN
  D=A
  @0
  M=D

(KEYCHECK)
  @KBD
  D=M
  @BLACK
  D;JGT                 // jump to black if D > 0 
  @WHITE
  D;JEQ
  
  @KEYCHECK
  0;JMP

///////////////////////

(BLACK)
  @1
  M=-1
  @CHANGE
  0;JMP


(WHITE)
  @1
  M=0
  @CHANGE
  0;JMP


////////////////////////

(CHANGE)

  @1    //CHECK WHAT TO FILL SCREEN WITH
  D=M    //D CONTAINS BLACK OR WHITE
  
  @0
  A=M    //GET ADRESS OF SCREEN PIXEL TO FILL
  M=D    //FILL IT
  
  @0
  D=M+1    //INC TO NEXT PIXEL
  @KBD
  D=A-D    //KBD-SCREEN=A
  
  @0
  M=M+1    //INC TO NEXT PIXEL
  A=M
  
  @CHANGE
  D;JGT    //IF A=0 EXIT AS THE WHOLE SCREEN IS BLACK

  @RESTART
  0;JMP

