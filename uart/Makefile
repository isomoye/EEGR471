all: clean lint sim

lint:	$(wildcard *.v)
	verilator --lint-only src/*.v

SRC_FILE=src/*.v
INC_DIR= +incdir+=/src/*

testbench:
	iverilog -c file_list.txt -Wall tb/testbench.v -o $@ 

tb_layered:
	iverilog -Wall -g2012  -c file_list.txt -Wall tb tb/tb_uart_layered.sv -o $@

tb_class:
	iverilog -Wall -g2012  -c file_list.txt -Wall tb tb/tb_uart_class.sv -o $@

sim: clean testbench
	vvp ./testbench

sim_layered: clean tb_layered
	vvp ./tb_layered

sim_class: clean tb_class
	vvp ./tb_class

clean:
	rm -f testbench tb_layered tb_class *.vcd
