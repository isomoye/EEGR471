interface uart_intf;
begin
  logic       wr_en;
  logic       tx;
  logic       tx_busy;
  logic       rx;
  logic       rdy;
  logic       clk_50m;
  logic       rdy_clr;
  logic [7:0] dout;
  logic [7:0] din;
  
end 
endinterface