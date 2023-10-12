
module asmd_multiplier_tb;

  // Parameters
  localparam word_length = 0;

  //Ports
  wire [2*word_length-1:0] product;
  wire  ready;
  reg [word_length-1:0] word0;
  reg [word_length-1:0]  word1;
  reg  start;
  reg  clk=0;
  reg  reset;

  //model signal
  reg [2*word_length-1:0] model_product

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
    $dumpfile("asmd_multiplier.vcd");
    $dumpvars(0, asmd_multiplier_tb);
    #100  //wait 100 time units
    
    //assert reset
    reset = 1'b1;
    #100 //wait 100 time units

    //check product and ready value
      if(product != 8'b0)begin
        $error("Product is not zero");
      end

      if(ready != 1'b1)begin
        $error("Ready not asserted");
      end
    //deassert reset
    reset = 1'b0;

    //set word0 and word1
    word0 = 4'b0100;
    word1 = 4'b0101;
    //set start
    start = 1'b1;
    
    //model_product = word0 * word1;
    product = word0 * word1;
    //wait for ready
    wait(ready);

    //check product value
    if(model_product != product) begin
      $error("Value of the product is not correct");
    end

    $finish();

end

endmodule