
module asmd_multiplier_tb;

  // Parameters
  localparam  word_length = 4;
  localparam num_iterations=4;

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

always #5 clk = ! clk;

//
//ASMD Multiplier_TP001: Verify Table 1
//

initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0,asmd_multiplier_tb);
  $display("ASMD Multiplier_TP001: Design implemented");
end

always @(posedge clk) begin
  if (reset) begin
    @(posedge clk)
    if (product != 0) begin
      $fatal();
    end
  end
end

integer i;// add integer outside of initial begin
initial begin
  clk = 0;
  reset = 1;
  start = 0;
  word0 = 4'b0000;
  word1 = 4'b0000;
for (i = 0; i < num_iterations; i = i + 1) begin // for loop based on iterations set 
//ASMD Multiplier_TP004
  reset =1;
    //ASMD Multiplier_TP004: assert reset
  if (reset!=1) begin
    $fatal();
  end
  #10;
    //ASMD Multiplier_TP004: product is zero
  if (product!=0) begin
    $fatal();
  end
  reset = 0;
  word0 = 4'b0011;
  word1 = 4'b0010;
  start = 1;
  #30;
    //ASMD Multiplier_TP003
  if (ready == 0) begin
    $fatal();
  end
  start = 0;
  wait(ready == 1);
    //ASMD Multiplier_TP003
  if(ready!=1) begin
    $display("ready was not asserted correctly");
    $fatal();
  end
  //ASMD Multiplier_TP003
  $display("3*2 = %d, product = %b", word0 * word1,product);
  #100;// wait time so that the product resets correctly

end
$finish;// finish so that the loop wont continously loop ADD A SEMICOLON ISAIAH!!!
end
endmodule