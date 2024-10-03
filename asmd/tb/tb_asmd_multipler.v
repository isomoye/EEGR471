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
reg  clk=0;
reg  reset;
// reg  [2*word_length-1:0] model_product;


//additional port to link the netlist
// wire ready_netlist;
// wire [2*word_length-1:0] product_netlist;


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

// always @(posedge clk) begin
//   if(reset) begin
//     @(posedge clk)
//     if(ready != 1'b1) begin
//       $error("Ready not Asserted")
//     end
//     if(product != '0) begin
//       $error("Product")
//     end
//   end
// end

initial begin
  @(posedge clk)
  forever begin
    @(posedge clk)
    if(ready != 1'b1) begin
      $fatal(0, "Ready not Asserted");
    end
    if(product != 1'b0) begin
      $error("Product");
    end
  end
end

initial begin
  clk = 0;
  reset = 1;
  start = 0;
  word0 = 4'b0000;
  word1 = 4'b0000;

  if (product != 1) begin
    $fatal(0, "Product not 0");
  end
  #10

  reset = 0;
  start = 1;
  word0 = 4'b0011;
  word1 = 4'b0011;

  if (ready == 0) begin
    $fatal();
  end
  start = 0;
  wait(ready == 1);

  $display("3*3 = %d, product = %d", word0*word1, product);

end


initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);

  #100;
  $finish();
end


endmodule
