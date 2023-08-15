
module datapath_unit    #(parameter word_length=4)(
                        output reg [2*word_length-1:0]  product,
                        output empty, m_is_1, m0,
                        input flush, shift, addshift, load_words,
                        input [word_length-1:0] word0, word1,
                        input clk, reset
);

    reg [2*word_length-1:0] multiplicand;
    reg [word_length-1:0]   multiplier;

    assign m0 =  multiplier[0];
    assign m_is_1 = (multiplier == 1);
    assign empty = ((word0 == 0) || (word1 == 0));

    always@(posedge clk, posedge reset)
        if (reset == 1'b1) begin
            product <= 0;
            multiplier <= 0;
            multiplicand <= 0;
        end
        else begin
            if (flush == 1) product <= 0;
            else if(load_words == 1) begin
                multiplicand <= word0;
                multiplier <= word1;
            end
            else if (addshift) begin
                product <= product+multiplicand;
                multiplicand <= multiplicand << 1;
                multiplier <= multiplier >> 1;
            end
            else if (shift) begin
                multiplicand <= multiplicand << 1;
                multiplier <= multiplier >> 1;
            end
        end
endmodule
