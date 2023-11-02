interface uart_intf;
  logic       wr_en;
  logic       tx;
  logic       tx_busy;
  logic       rx;
  logic       rdy;
  logic       clk_50m;
  logic       rdy_clr;
  logic [7:0] dout;
  logic [7:0] din;
  
  modport uart_rx(input clk_50m, rx,rdy_clr output dout,rdy );

  modport uart_tx(input clk_50m, din,wr_en, output tx,tx_busy );
  
endinterface



property  rdy_clr_rst;
    rdy_clr |-> ##1 (!rdy);
endproperty

property  tx_active_busy;
    tx_active |-> ##1 (tx_busy);
endproperty
