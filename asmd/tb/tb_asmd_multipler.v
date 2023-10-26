
module asmd_multiplier_tb;

  // Parameters
  localparam word_length = 0;

  //Ports
  wire [2*word_length-1:0] product;
  wire [2*word_length-1:0] product_netlist;
  wire  ready;
  wire  ready_netlist;
  reg [word_length-1:0] word0;
  reg [word_length-1:0] word0_netlist;
  reg  [word_length-1:0] word1;
  reg  [word_length-1:0] word1_netlist;
  reg  start;
  reg  clk=0;
  reg  reset;
  reg [2*word_length-1:0] model_product;

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

  //asmd multiplier netlist design-under-test (DUT)
  asmd_multiplier_netlist 
   asmd_multiplier_netlist_inst (
    .product(product_netlist),
    .ready(ready_netlist),
    .word0(word0_netlist),
    .word1(word1_netlist),
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
    if(product != '0)begin
      $error("product not set to 0");
    end

    if(ready != 1'b0)begin
      $error("ready not set to 0");
    end

    //deassert reset
    reset = '0;

    //set word0 and word1
    word0 = word_length;
    word1 = word_length;
    #100

    //set start
    start = 1'b1;
    model_product = word0 * word1;
    //wait for ready
    wait (ready);


    //check product value
    if(product != word0 * word1)begin
      $error("product not equal to 2 * word length");
    end

    if(model_product != product)begin
      $error("model product not equal to product");
    end

    always @(*) begin
      if(product != product_netlist) begin
          $error("product mismatch\n");
      end
  end

    always@(*) begin
      if(ready != ready_netlist) begin
        $error("ready mismatch\n");
      end
    end

    //model signals

    
    $finish();

end

endmodule
