all:	lint testbench

lint:	$(wildcard *.v)
	verilator --lint-only uart.v

SRC_FILE=src/*.v
INC_DIR= +incdir+=../eegr_417/src

testbench:	$(wildcard *.v)
	iverilog -Wall -y src  src/uart.v -o $@

tb_class:	$(wildcard *.v) $(wildcard *.sv) $(wildcard *.svh)
	iverilog -Wall -g2012 -y tb tb/tb_uart_class.sv -o $@

check:	clean testbench
	vvp ./testbench

check_class: clean tb_class
	vvp ./tb_class

clean:
	rm -f testbench tb_class *.vcd
