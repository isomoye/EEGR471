module #(parameter DATA_WIDTH_BITS = 8 ) shift(
    input logic clk_i,
    input logic rst_i,
    input logic ena_i,
    input logic [DATA_WIDTH_BITS-1:0] data_i,
    output logic [DATA_WIDTH_BITS-1:0] data_o

);


logic [DATA_WIDTH_BITS-1:0] data_r;


always_ff @( clk_i ) begin : shifter
    if(rst_i) begin
        data_r <= '0;
    end else if(ena_i) begin
        data_r <= data_i<<1;
    end
end

assign data_o = data_r;

endmodule