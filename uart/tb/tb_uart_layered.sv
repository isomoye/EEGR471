/*
 * Simple testbench for UART.  Loop the rx and tx pins to each other and send
 * incrementing bytes, make sure that we receive what we expected.
 */

module tb_uart_layered ();

  localparam int c_CLOCK_PERIOD_NS = 40;
  localparam c_CLKS_PER_BIT = 217;
  localparam C_BIT_PERIOD = 50000000 / 115200;

  //testbench queues
  //holder for generated data
  logic [7:0] uart_rx_gen_data[$];
  //holder for monitored data
  logic [7:0] uart_rx_mon_data[$];
  //number of test packets
  int         num_pkts = 20;

  //test signals
  logic       wr_en;
  logic       tx;
  logic       tx_busy;
  logic       rx;
  logic       rdy;
  logic       clk_50m = 0;
  logic       rdy_clr;
  logic [7:0] dout;
  logic [7:0] din;


  //instanciate uart dut
  uart uart_dut (
      .din    (din),
      .wr_en  (wr_en),
      .clk_50m(clk_50m),
      .tx     (tx),
      .tx_busy(tx_busy),
      .rx     (rx),
      .rdy    (rdy),
      .rdy_clr(rdy_clr),
      .dout   (dout)
  );


  //main initial block
  initial begin
    $dumpfile("tb_uart_layered.vcd");
    $dumpvars(0, tb_uart_layered);
    #10;
    //test fork.. run all these tasks in parallel
    fork
      uart_gen();
      uart_rx_drive();
      uart_rx_monitor();
      uart_rx_scoreboard();
    join_any
    disable fork;

    $display("done test");
    #1;
    $finish;
  end

  //toggle clk
  always begin
    #(c_CLOCK_PERIOD_NS / 2) clk_50m <= !clk_50m;
  end


  //*******************************************************************************
  //-------------------------------------------------------------------------------
  // TASKS AND FUNCTIONS
  //-------------------------------------------------------------------------------
  //*******************************************************************************
  //generate uart_packet
  task uart_gen();
    begin
      int delay;
      logic [7:0] temp_rx_data;
      int count = 0;
      delay = $urandom_range(0, 10);
      $display("starting pkt_gen");
      forever begin
        repeat (delay) @(posedge clk_50m);
        temp_rx_data = $urandom_range(1, 6000);
        uart_rx_gen_data.push_back(temp_rx_data);
      end
    end
  endtask


  //drive uart rx
  task uart_rx_drive();
    begin
      static int count = 0;
      logic [7:0] rx_drv_data;
      $display("starting uart_rx_drive");
      forever begin
        //clear ready
        @(posedge clk_50m);
        rdy_clr = '1;
        @(posedge clk_50m);
        rdy_clr = '0;
        //wait for packet from gen
        do begin
          @(posedge clk_50m);
        end while (uart_rx_gen_data.size() <= 0);
        //grab packet from gen
        rx_drv_data = uart_rx_gen_data.pop_back();
        @(posedge clk_50m);
        $display("driving uart_rx_pkt  %d", count);
        // Send Start Bit
        rx <= 1'b0;
        repeat (C_BIT_PERIOD) @(posedge clk_50m);
        // Send Data Byte
        for (int ii = 0; ii < 8; ii = ii + 1) begin
          rx <= rx_drv_data[ii];
          repeat (C_BIT_PERIOD) @(posedge clk_50m);
        end
        // Send Stop Bit
        rx <= 1'b1;
        repeat (C_BIT_PERIOD * 2) @(posedge clk_50m);
        //$display("driver drove data %x", rx_drv_data);
        count++;
      end
    end
  endtask

  //recieve monitor
  task uart_rx_monitor();
    logic [7:0] rx_data;
    begin
      $display("starting monitor");
      forever begin
        rx_data = '0;
        //wait for start bit
        do begin
          @(posedge clk_50m);
        end while (rx == '1);
        repeat (C_BIT_PERIOD) @(posedge clk_50m);
        for (int i = 0; i < 8; i++) begin
          repeat (C_BIT_PERIOD / 2) @(posedge clk_50m);
          rx_data[i] = rx;
          repeat (C_BIT_PERIOD / 2) @(posedge clk_50m);
        end
        //stop bit
        do begin
          @(posedge clk_50m);
        end while (rx == '0);
        repeat (C_BIT_PERIOD) @(posedge clk_50m);
        repeat (C_BIT_PERIOD / 2) @(posedge clk_50m);
        $display("monitor tracked data %x", rx_data);
        uart_rx_mon_data.push_back(rx_data);
      end
    end
  endtask

  //scoreboard
  task uart_rx_scoreboard();
    begin
      logic [7:0] mon_data;
      logic [7:0] rx_data;
      int count = 0;
      $display("starting scoreboard");
      repeat (num_pkts) begin
        begin
          //   $display("monitor tracking packet %d",count);
          do begin
            @(posedge clk_50m);
          end while (uart_rx_mon_data.size() <= 0);
          mon_data = uart_rx_mon_data.pop_back();
          //check data is as expected
          if (mon_data == dout) begin
          end else begin
            $fatal(0, "rx_data %x does not match expected %x", dout, mon_data);
          end
          if (rdy == '1) begin
          end else begin
            $fatal(0, "ready did not assert after driving rx data");
          end
          count++;
        end
      end
    end
  endtask
  //-------------------------------------------------------------------------------
  //*******************************************************************************

endmodule
