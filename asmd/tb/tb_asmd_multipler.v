
module asmd_multiplier_tb;

  // Parameters
  localparam  word_length = 4;

  //Ports
  wire [2*word_length-1:0] product;
  wire  ready;
  reg [word_length-1:0] word0;
  reg [word_length-1:0]  word1;
  reg  start;
  reg  clk;
  reg  reset;


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

always #5  clk = ! clk ;
initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0,asmd_multiplier_tb);
end
initial begin
  clk = 0;
  reset = 1;
  start = 0;
  word0 = 4'b0000;
  word1 = 4'b0000;
  #100;
  reset = 0;
  word0 = 4'b0011;
  word1 = 4'b0010;
  start = 1;
  #65;
  start = 0;
  wait(ready == 1);
  $display("3*2 = %d, product = %b", word0 * word1,product);
  #10;
  $finish;
end

endmodule