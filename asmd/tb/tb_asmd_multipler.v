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
reg  clk=1;
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
always #5  clk = ! clk ;

//TP003: Checking response to async reset
always @(posedge reset) begin
  #5 reset = 0;
  #5 start = 1;
  #5 start = 0;
  if (ready == 1) begin
    $display("Ready asserted after reset.");
    if (product == 0) begin
      $display("Product is equal to 0.");
    end else $display("Error. Product does not equal 0.");
end
end

// TP004: Upon assertion of start
task test1(input [word_length-1:0] temp0, input [word_length-1:0] temp1);
begin
    $display("Test1 started.");
    word0 = temp0;
    word1 = temp1;
    start = 1;
    #10 start = 0;

    if (ready == 0) $display("Ready deasserted after start.");
    
    // Display only once ready
    wait (ready) begin $display("Product is ready");
      if (product == 0) begin
        $display("Product is 0");
    end else begin
        $display("Product is equal to: %0d", product);
    end
end
end
endtask

initial begin
  word0 = 0;
  word1 = 0;
  reset = 0;
  start = 0;
end

initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);
  //Asserting reset for TP003
  #10 reset = 1;
  #100;
  //Calling task and passing words for TP004
  #5 test1(4'b1111, 4'b1100);
  #100;
  $finish();
end
endmodule
