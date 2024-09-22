module asmd_multiplier_tb;

// Parameters
localparam word_length = 4;

// Ports (inputs and outputs)
wire [2*word_length-1:0] product; 
wire ready;
reg [word_length-1:0] word0;
reg [word_length-1:0] word1;
reg start;
reg clk;
reg reset;
reg [2*word_length-1:0] model_product;

// Additional port to link the netlist
wire ready_netlist;
wire [2*word_length-1:0] product_netlist;

// asmd multiplier design-under-test (DUT)
asmd_multiplier #(
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

// asmd multiplier netlist design-under-test (DUT)
asmd_multiplier_netlist
asmd_multiplier_netlist_inst (
  .product(product_netlist),
  .ready(ready_netlist),
  .word0(word0_netlist),
  .word1(word1_netlist),
  .start(start_netlist),
  .clk(clk),
  .reset(reset)
);

// Clock Generation
always #5 clk = !clk;

// Confirm that netlist product and rtl product output are equivalent.
always @(*) begin
  if (product != product_netlist) begin
    $error("Netlist / RTL product mismatch");
  end
  if (ready != ready_netlist) begin
    $error("Netlist / RTL ready mismatch");
  end
end

initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);
 

  // Initial reset
  
  clk = 1'b0;
  reset = 1'b1;
  start = 1'b0;

 

  // Apply reset
  #100;
  
  // Set inputs
  word0 = 4'h4;  // 4
  word1 = 4'h5;  // 5
  model_product = word0 * word1;
  // Deassert reset after some time
  reset = 1'b0;
  #50;
  
  // Start operation
  start = 1'b1;
  #10 
  start = 1'b0;
  // Wait for ready to go low (operation starts)

 
  wait (!ready);

  // Deassert start
 

  // Wait for ready to go high (operation completes)
  wait (ready);

  // Compute expected model product after the operation finishes
  

  // Check if the products match
  if (model_product != product) begin
    $error("model product not equal to product");
    $error("content of model_product is %d", model_product);
  end

  #100;
  $finish();
end

endmodule
