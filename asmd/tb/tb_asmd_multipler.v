//Engineers involved : Omer Olloumou, Brooke Price, Ifeanyichukwu Iwobi
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




//asmd multiplier netlist design-under-test (DUT)
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


// *NOTE* : netlist does not have word_length parameter... Why not?
// The netlist does not contain word_length because it is not a port


//clock Generation
always #5  clk = ! clk ;


//confirm that netlist product and rtl product output are equivalent.
always @(*) begin
if(product != product_netlist) begin
    $error("Netlist / RTL product mismatch");
end
if(ready != ready_netlist)begin
    $error("Netlist / RTL ready mismatch");
end
end


initial begin
  $dumpfile("asmd_multiplier.vcd");
  $dumpvars(0, asmd_multiplier_tb);


  //start = 1'b0;
  #100;
  //assert reset
  reset = 1'b1;

  //set word0 and word1
  word0 = 4'h4; //4 (hexadecimal notation)
  word1 = 4'h5; //5
  #100

  //model signals
  model_product = (word0*word1); // 4 * 5 = 20 (hexadecimal notation = 14)

  #100;
  //check product and ready value
  if(product != 8'b0)begin
    $error("product not set to zero");
  end

  if(ready != 1'b0)begin
    $error("ready not set to zero");
  end


  //deassert reset
  reset = 1'b0;

  //set start
  start = 1'b1;

  //wait for !ready
  wait (!ready);

  //wait for ready
  wait (ready);

  //check product value
  if(model_product != product)begin
    $error("model product not equal to product");
    $error("content of model_product is %d",model_product);
  end

  #100;
  $finish();


end


endmodule
