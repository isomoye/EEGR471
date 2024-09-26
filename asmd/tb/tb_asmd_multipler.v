//Engineers involved
module asmd_multiplier_tb;


// Parameters
localparam word_length = 4;


//Ports (inputs and outputs)
wire [2*word_length-1:0] product; 
wire  ready;
reg  [word_length-1:0] word0;
reg  [word_length-1:0] word1;
reg  start;
reg  clk=0;
reg  reset;
reg  [2*word_length-1:0] model_product;


//additional port to link the netlist
wire ready_netlist;
wire [2*word_length-1:0] product_netlist;


//asmd multiplier design-under-test (DUT)
asmd_multiplier # (
  .word_length(word_length)
)
asmd_multiplier_inst (
  .product(product),
  .ready(ready),
  .word0(word0),
  .word1(word1),
  .start(start),
  .clk(clk),
  .reset(reset)
);


//clock Generation
always #7  clk = ! clk ;

initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);

  #100;
  $finish();
end


endmodule
