# Instructions for Lab 4.

## This lab is about verifying that the synthesis engine interpreted the RTL correctly

First do a ``git pull`` to ensure that your branch is up to date

Working in the same 2 person group as lab .

Open up the ASMD Multiplier from Lab 1 [ASMD_MULTIPLIER](../../asmd/src/asmd_multiplier_flat.v)

Open up the ASMD Multiplier netlist created in [ASMD_MULTIPLIER_NETLIST](../../asmd/netlist/asmd_multplier_netlist.v)

- Inspect the verilog code for functionality.

- Instantiate the netlist module in the testbench created in lab 3 [testbench](../../asmd/tb/tb_asmd_multipler.v).

### I.E
```
//asmd multiplier netlist design-under-test (DUT)
  asmd_multiplier_netlist 
   asmd_multiplier_netlist_inst (
    .product(product_netlist),
    .ready(ready_netlist),
    .word0(word0_netlist),
    .word1(word1_netlist),
    .start(start_netlist),
    .clk(clk),
    .reset(reset)
  );

```

- *NOTE* : netlist does not have word_length parameter... Why not?

- Verify that the RTL and Netlist have similar functionality

### i.e

```
//confirm that netlist product and rtl product output are equivalent.
always @(*) begin
    if(product != product_netlist) begin
        $error("product mismatch\n");
    end
end

```

- Do this for all other outputs

