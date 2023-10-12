
module asmd_multiplier_tb;

  // Parameters
  localparam word_length = 0;

  //Ports
  wire [2*word_length-1:0] product;
  wire  ready;
  reg [word_length-1:0] word0;
  reg  [word_length-1:0] word1;
  reg  start;
  reg  clk=0;
  reg  reset;

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
    #100;
    //assert reset
    reset = 1'b1;
    
    #100;
    //check product and ready value
    if(product != 8'b0) begin
      $error("product not zeros");
    end
    if(ready!= 1'b1) begin
      $error("ready not asserted");
    end


    //deassert reset

    //set word0 and word1

    //set start

    //wait for ready


    //check product value

    
    $finish();

end

endmodule