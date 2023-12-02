//Engineers involved : Omer Olloumou, Brooke Price, Ifeanyichukwu Iwobi
module asmd_multiplier_tb;


// Parameters
localparam word_length = 4;


  //Ports
  wire [2*word_length-1:0] product;
  wire  ready;
  reg [word_length-1:0] word0;
  reg  [word_length-1:0] word1;
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
