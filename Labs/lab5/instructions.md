# Instructions for Lab 5.

## This lab is to install and verify the ATPG and DFT insertion tool

First do a ``git pull`` to ensure that your branch is up to date

Working in the same 2 person group as lab 4.

First: 

Ensure that you are in the top projects directory i.e ```cd ~/projects```

Download a copy of the tool:

```git clone https://github.com/AUCOHL/Fault.git```

Navigate to the  in the [ASMD_MULTIPLIER](../../asmd/src/) ```cd ~/projects/asmd```

Pull the tool docker image

```docker pull ghcr.io/aucohl/fault:latest```


Test the docker image 

```docker run -ti --rm ghcr.io/aucohl/fault:latest fault -V```


Add an alias to make FAULT tool usage easier

```vi ~/.bashrc```

Add the alias to your bash by copy and pasting the following command

``` alias fault='docker run -tiv `pwd`:`pwd` -w `pwd` --rm ghcr.io/aucohl/fault:latest fault' ```

*HINT*: In Vim / vi, hit "a" on you keyboard to add text

Read in the alias you just added:

``` source ~/.bashrc```

Test the install 

``` fault -V```



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

