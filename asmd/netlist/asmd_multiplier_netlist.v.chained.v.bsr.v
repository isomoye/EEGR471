module BoundaryScanRegister_input (
    din,
    dout,
    sin,
    sout,
    clock,
    reset,
    testing,
    shift
);
    input din; output dout;
    input sin; output sout;
    input clock, reset, testing, shift;

    reg store;
    always @ (posedge clock or posedge reset) begin
        if ( reset) begin
            store <= 1'b0;
        end else begin
            store <= shift ? sin: dout;
        end
    end
    assign sout = store;
    assign dout = testing ? store : din;
endmodule
    
module BoundaryScanRegister_output (
    din,
    dout,
    sin,
    sout,
    clock,
    reset,
    testing,
    shift
);
    input din; output dout;
    input sin; output sout;
    input clock, reset, testing, shift;
    reg store;
    always @ (posedge clock or posedge reset) begin
        if ( reset) begin
            store <= 1'b0;
        end else begin
            store <= shift ? sin: dout;
        end
    end
    assign sout = store;
    assign dout = din;
endmodule
    
