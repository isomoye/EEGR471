module control_unit(output reg flush, shift, addshift, load_words, ready,
                    input empty, m_is_1, m0, start,
                    input clk, reset);
       reg state, next_state;
       parameter s_idle = 0, s_running = 1;

       always@(posedge clk, posedge reset)
        if(reset == 1'b1)
            state <= s_idle;
        else
            state <= next_state;

       always @(state, start, empty, m_is_1, m0) begin
       //default condition
        next_state = s_idle;
        flush = 0;
        shift = 0;
        addshift = 0;
        load_words = 0;
        ready = 0;
        case(state)
            s_idle: begin
                if (reset == 1'b1) next_state = s_idle;
                else begin
                    ready = 1;
                    if (start == 1'b1) begin
                        if (empty == 1'b1) begin
                            flush = 1;
                            next_state = s_idle;
                            end
                        else begin
                            load_words = 1;
                            next_state = s_running;
                        end
                    end
                    else next_state = s_idle;
                end
            end
            s_running: begin
                if (m_is_1 == 1'b1) begin
                    addshift = 1;
                    next_state =s_idle;
                end
                else begin
                    if (m0 == 1'b1) begin
                        addshift = 1;
                        next_state = s_running;
                    end
                    else begin
                        shift = 1;
                        next_state = s_running;
                    end
                end
            end
           default: next_state = s_idle;
        endcase
       end
endmodule