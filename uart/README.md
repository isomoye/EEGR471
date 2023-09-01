Simple verilog UART.

A simple UART for use in an FPGA as a debug engine.  Requires a 50MHz input
clock that gets divided into clock enables for a 16x oversampling receiver
clock enable and 115200 baud transmission clock enable.

