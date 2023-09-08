module asmd_multiplier #(parameter word_length = 4)(
    output  [2*word_length-1:0] product,
    output                      ready,
    input   [word_length-1:0]   word0, word1,
    input                       start, clk, reset
);

wire            flush, shift, add_shift, load_words, empty, m_is_1, m0;
control_unit    control_module0  (.flush(flush), .shift(shift), .addshift(add_shift), .load_words(load_words),
                    .ready(ready), .start(start),
                    .empty(empty), .m_is_1(m_is_1), .m0(m0),
                    .clk(clk), .reset(reset));
datapath_unit   datapath_module0  (.product(product), .empty(empty), .m_is_1(m_is_1),
                     .m0(m0), .word0(word0), .word1(word1),
                     .flush(flush), .shift(shift), .addshift(add_shift), .load_words(load_words),
                     .clk(clk), .reset(reset));
endmodule