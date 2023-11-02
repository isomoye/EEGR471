module _tb;

  // Parameters

  // Ports
  reg clk_i = 0;
  reg rst_i = 0;
  reg ena_i = 0;
  reg [DATA_WIDTH_BITS-1:0] data_i;
  wire [DATA_WIDTH_BITS-1:0] data_o;

   
  _dut (
    .clk_i (clk_i ),
    .rst_i (rst_i ),
    .ena_i (ena_i ),
    .data_i (data_i ),
    .data_o  ( data_o)
  );

  initial begin
    begin
      $finish;
    end
  end

  always
    #5  clk_i = ! clk_i ;

endmodule
