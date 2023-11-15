# Instructions for Lab 7.

## The purpose of this lab is to introduce students to professional JTAG Tools

We will be using the XJTAG XJLink2 — USB JTAG controller.

[XJLink2](https://www.xjtag.com/products/hardware/xjlink-xjlink2-controller/)

Normally we would apply boundary scan to the Circuit-Under-Test (CUT) which would be our fabricated
design chip. However, while the skywater chips have boundary scan inserted but the wires on the test board are routed to an ftdi chip only and there are no jumpers to mux them to the skywater chip, so that's out of the question. 

We will instead be using the [XJDemo Board](https://www.xjtag.com/products/capabilities/xjdemo-board/) which
is a fully populated demonstration board providing a kick-start an understanding of JTAG.


We will perform a standard JTAG scan chain test. Verifying that the scan-chain is connected from beginning to end.

