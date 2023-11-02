# Instructions for Lab 5.

## This lab is to install and verify the ATPG and DFT insertion tool

First do a ``git pull`` to ensure that your branch is up to date

Working in the same 2 person group as lab 4.

First: 

Ensure that you are in the top projects directory i.e ```cd ~/projects```

Download a copy of the tool:

```git clone https://github.com/AUCOHL/Fault.git```

AND

```git clone https://github.com/YosysHQ/yosys.git```

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

Navigate to top project directory

```cd ~/projects```

Use *FAULT* to add DFT scan chain to the ASMD design

```fault chain -l yosys/examples/cmos/cmos_cells.lib -c yosys/examples/cmos/cmos_cells.v --clock clk --reset reset EEGR471/asmd/netlist/asmd_multiplier_netlist.v```

