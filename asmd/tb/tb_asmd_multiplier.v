 

module asmd_multiplier_tb;

// Parameters
localparam word_length = 4; //confirm word length by inspection

// Ports (inputs and outputs)
wire [2*word_length-1:0] product;
wire ready;
reg [word_length-1:0] word0;
reg [word_length-1:0] word1;
reg start;
reg clk = 0;
reg reset;
reg [2*word_length-1:0] model_product;


// ASMD multiplier design-under-test (DUT)
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


always @ (posedge clk) begin
  if (reset) begin
    @(posedge clk)
      if (ready !=1'b1)
      $error("ready is not asserted when reset is deasserted");
      if (product != 0)
      $error("product is not set to 0");
    end
  end
  

initial begin
  if($bits(asmd_multiplier_inst.datapath_module0.product) != $bits(product)) begin
    $error("TP002: product bitwidth incorrect, %d",$bits(asmd_multiplier_inst.datapath_module0.product));
  end
  else begin
    $display("TP002: pass");
  end
end


// Monitor Ready and Product signals for both RTL and Netlist



always #5 clk = !clk; //init clock

// Testbench logic
initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);

  // Initialize inputs ---TP001: inspect inputs at initialization
  //                   ---TP002: check that word length is as specified by visual inspection bin val
  start = 1'b0;
  reset = 1'b1;
  word0 = 4'h4;   // Set word0 = 4
  word1 = 4'h5;   // Set word1 = 5
  model_product = word0 * word1; // Expected product (4 * 5 = 20 decimal)

// Clock Generation    ---TP003: setup clock, visual inspect accurate period


  // Wait for some cycles with reset asserted
  #20;
  reset = 1'b0;  // Deassert reset after initialization and watch for ready bit & word inputs
  #10;

  // Start the multiplication
  start = 1'b1;
  #10;
  start = 1'b0;
  
  // Wait for ready to become low and then high (to ensure calculation completes)
  wait (!ready);  // Wait until ready goes low (indicating processing started)
  wait (ready);   // Wait until ready goes high (indicating processing complete)
  #10;            // Add a small delay to ensure product has time to settle

  reset = 1'b1;
  #10
  reset = 1'b0;
  #20
  word0 = 15;   // Set word0 = 15
  word1 = 15;   // Set word1 = 15
  start = 1'b1;
  #10;
  start = 1'b0;
  model_product = word0 * word1;
  wait (!ready);  // Wait until ready goes low (indicating processing started)
  wait (ready);   // Wait until ready goes high (indicating processing complete)


  // Check product value after ready is high
  if (model_product != product) begin
    $error("TP001: Model product (%d) not equal to product (%d) at time %0t when ready is 1", model_product, product, $time);
  end else begin
    $display("TP001: Success! product is %d at time %t", product, $time);
  end


  #100;
  $finish;
end

endmodule