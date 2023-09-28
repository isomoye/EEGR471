
module asmd_multiplier_tb;

  // Parameters
  localparam  int word_length = 0;

  //Ports
  wire [2*word_length-1:0] product;
  wire  ready;
  reg [word_length-1:0] word0;
  wire  word1;
  reg  start;
  wire  clk;
  wire  reset;

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

//clock
always #5  clk = ! clk ;

initial begin
    //assert reset

    //check product and ready value


    //deassert reset

    //set word0 and word1

    //set start

    //wait for ready


    //check product value


end

endmodule