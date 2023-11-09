# Instructions for Lab 6.

## The purpose of this lab is to generate and simulate ATPG vectos

First do a ``git pull`` to ensure that your branch is up to date

Working in the same 2 person group as lab 4.

First: 

Ensure that you are in the top projects directory i.e ```cd ~/projects```

Use *FAULT* to generate ATPG vectors

Simulate vectors with scan-chain netlist in lab 5.

Set test_jtag.sh as executable
```chmod +x test_jtag.sh```

run test_jtag.sh
```source test_jtag.sh```

A vcd will now be present in the projects directory.

open the VCD file with gtkwave and analyze.

Submit the value of test data out "tdo" at time increment 31. i.e "i" = 31.



