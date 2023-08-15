`include "uart_test_base.svh"

module tb_uart_class ();
  localparam int c_CLOCK_PERIOD_NS = 40;
  localparam c_CLKS_PER_BIT = 217;
  localparam C_BIT_PERIOD = 50000000 / 115200;

  // `include "../src/uart.v"
  // `include "../src/transmitter.v"
  // `include "../src/receiver.v"
  // `include "../src/baud_rate_gen.v"
//  `include "uart_intf.sv"

  //clk
  logic       clk_50m = 0;

  //uart signals
  uart_intf uart_if();

  //testbench queues
  //holder for generated data
  logic [7:0] uart_rx_gen_data[$];
  //holder for monitored data
  logic [7:0] uart_rx_mon_data[$];

  //number of test packets
  int         num_pkts = 20;

  assign uart_if.clk_50m = clk_50m;

  //toggle clk
  always begin
    #(c_CLOCK_PERIOD_NS / 2) clk_50m <= !clk_50m;
  end

  //instanciate uart dut
  uart uart_dut (
    .din    (uart_if.din),
    .wr_en  (uart_if.wr_en),
      .clk_50m(clk_50m),
    .tx     (uart_if.tx),
    .tx_busy(uart_if.tx_busy),
    .rx     (uart_if.rx),
    .rdy    (uart_if.rdy),
    .rdy_clr(uart_if.rdy_clr),
    .dout   (uart_if.dout)
  );

  uart_test_base uart_tst;

  initial begin : start_test
    $dumpfile("uart.vcd");
    $dumpvars(0, tb_uart);
    #10;
    uart_tst = new(C_BIT_PERIOD, num_pkts,uart_if);
    uart_tst.test();
    $display("done test");
    #1;
    $finish;
  end



endmodule
