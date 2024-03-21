// program: Rectangle.asm
// Draw a filled rectangle at the 
// screen's top left corner, with
// width of 16 pixels and height of 
// RAM[0] pixels 
// Usage: put a non-negative number
// (rectangle's height) in RAM[0]



    @8192
    A=M
    M=-1

(END)
    @END          // program's end
    0;JMP         // infinite loop
