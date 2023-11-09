cd ../../../

docker run -tiv "$(pwd)":"$(pwd)" -w "$(pwd)" --rm ghcr.io/aucohl/fault:latest fault synth -t asmd_multiplier -l Fault/Tech/osu035/osu035_stdcells.lib EEGR471/asmd/src/asmd_multiplier_flat.v

docker run -tiv "$(pwd)":"$(pwd)" -w "$(pwd)" --rm ghcr.io/aucohl/fault:latest fault cut Netlists/asmd_multiplier.netlist.v

docker run -tiv "$(pwd)":"$(pwd)" -w "$(pwd)" --rm ghcr.io/aucohl/fault:latest fault --cellModel Fault/Tech/osu035/osu035_stdcells.v --ignoring reset --clock clk -v 100 -r 50 -m 15 --ceiling 5000 Netlists/asmd_multiplier.netlist.v.cut.v

docker run -tiv "$(pwd)":"$(pwd)" -w "$(pwd)" --rm ghcr.io/aucohl/fault:latest fault chain --cellModel Fault/Tech/osu035/osu035_stdcells.v --liberty Fault/Tech/osu035/osu035_stdcells.lib --clock clk --reset reset Netlists/asmd_multiplier.netlist.v

docker run -tiv "$(pwd)":"$(pwd)" -w "$(pwd)" --rm ghcr.io/aucohl/fault:latest fault asm Netlists/asmd_multiplier.netlist.v.cut.v.tv.json Netlists/asmd_multiplier.netlist.v.chained.v

docker run -tiv "$(pwd)":"$(pwd)" -w "$(pwd)" --rm ghcr.io/aucohl/fault:latest fault tap --cellModel Fault/Tech/osu035/osu035_stdcells.v --liberty Fault/Tech/osu035/osu035_stdcells.lib --clock clk --reset reset --testVectors Netlists/asmd_multiplier.netlist.v.cut.v.tv.json.vec.bin --goldenOutput Netlists/asmd_multiplier.netlist.v.cut.v.tv.json.out.bin --ignoring reset Netlists/asmd_multiplier.netlist.v.chained.v

iverilog -g2012 -DVCD -Wall Netlists/asmd_multiplier.netlist.v.chained.v.jtag.v.tb.sv -o jtag_test

vvp jtag_test
