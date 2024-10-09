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
reg  clk = 1;
reg  reset;
//Added registers
reg  gen;
reg  [2*word_length-1:0] model_product;
reg  [word_length-1:0] rand_word0;
reg  [word_length-1:0] rand_word1;
reg  [2*word_length-1:0] exp_product;
//additional port to link the netlist
wire ready_netlist;
wire [2*word_length-1:0] product_netlist;

//asmd multiplier design-under-test (DUT)
asmd_multiplier # (
  .word_length(word_length)
)

//TP001: Visual inspection of ports
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
always #5  clk = ! clk ;

//Random number generation
always @(gen) begin
  rand_word0 = $urandom_range(0,15);
  rand_word1 = $urandom_range(0,15);
  $display ("First random number: %0d", rand_word0);
  $display ("Second random number: %0d", rand_word1);
end

//TP002: Verify correct word length
always @(posedge reset) begin
  if (word_length == 4) begin
    $display ("The word length is : %0d", word_length);
  end else begin
    $display ("Incorrect word length: %0d. Word length should be 4", word_length);
  end
end

//TP003: Checking response to async reset
always @(posedge reset) begin
  #5 reset = 0;
  #5 start = 1;
  #5 start = 0;
  if (ready == 1) begin
    $display("Ready asserted after reset.");
  end
  if (product == 0) begin
      $display("Product is equal to 0.");
    end else $display("Error. Product does not equal 0.");
end

// TP004: Upon assertion of start
task test4(input [word_length-1:0] temp0, input [word_length-1:0] temp1);
  begin
    $display("Test1 started.");
    word0 = temp0;
    word1 = temp1;
    start = 1; 
    exp_product = rand_word0 * rand_word1;
    #10 start = 0;

    if (ready == 0) $display("Ready deasserted after start.");
    
    // Display once ready and test product to expected product
    wait (ready) begin $display("Product is ready");
      if (product == 0) begin
        $display("Product is 0");
      end if (product == exp_product) begin
        $display("Product: %0d. Expected product: %0d", product, exp_product);
      end if (product != exp_product) begin
        $display("Error! Products do not match. Product: %0d. Expected product: %0d", product, exp_product);
      end
    end
  end
endtask

initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);
  
  gen = 1; #5 gen = 0; #5 gen = 1;
//TP003: Checking response to async reset
  reset = 1; #30;

  //Calling task and passing words for TP004
  test4(rand_word0, rand_word1);
  $finish();
end
endmodule
