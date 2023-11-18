# Instructions for Lab 8.

## The purpose of this lab is to introduce students HMI testing

We will be utilizing the Skywater [caravel board](https://github.com/efabless/caravel_board)

We will first be confirming basic functionality by running the ``hello world`` sample which in this case 
is called [blinky](https://github.com/efabless/caravel_board/tree/main/firmware/mpw2-5/blink).

Students will then be asked to utilize a collection of resources including, the [ASMD_Multiplier design](../../asmd/src/asmd_multiplier_flat.v), the [design instantiation](https://github.com/isomoye/msu_sub/blob/submission/verilog/rtl/user_project_wrapper.v), and the [board header files](https://github.com/efabless/caravel_board/blob/main/firmware/mpw2-5/defs.h) to create a c executable to implements the tests that were run in [lab 3](../lab3/instructions.md)

A C file is available in [asmd_test](asmd_test.c)

Read through to analyze and thoroughly understand the code. 

Then, search for ```TODO:``` to see parts of the code that need editing.

The executable must display ```pass or fail``` in string format through the uart port.

