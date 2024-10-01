all: clean lint sim

lint:	$(wildcard *.v)
	verilator --lint-only src/*.v

SRC_FILE=src/*.v
INC_DIR= +incdir+=/src/*

testbench:
	iverilog -c file_list.txt -Wall tb/tb_asmd_multiplier.v -o $@ 

tb_layered:
	iverilog -Wall -g2012  -c file_list.txt -Wall tb tb/tb_asmd_multiplier.v -o $@

tb_class:clean_vcs
	vcs +vc -cm line -sverilog -f file_list.txt -f class_list.txt -debug \
		+define+ASSERT_ON+COVER_ON \
		-y $(VCS_HOME)/packages/sva/ \
		+libext+.sv \
		+incdir+$(VCS_HOME)/packages/sva 
	./simv -cm line +NUM+5

sim_vcs: clean_vcs
	vcs +vc -cm line -sverilog -f file_list.txt -Wall tb tb/tb_asmd_multiplier.v -debug \
		+define+ASSERT_ON+COVER_ON \
		-y $(VCS_HOME)/packages/sva/ \
		+libext+.sv \
		+incdir+$(VCS_HOME)/packages/sva 
	./simv -cm line +NUM+5
	#assertCovReport
	#vcs -cov_text_report tb_asmd_multiplier.db


sim: clean testbench
	vvp ./testbench

sim_layered: clean tb_layered
	vvp ./tb_layered

sim_class: clean tb_class
	vvp ./tb_class

clean:
	rm -f testbench tb_layered tb_class *.vcd

clean_vcs:
	rm -rf simv* *.log *.vpd *.dump csrc *.sim *.mra *.log ucli.key session* *.db vcs.key urgRe
