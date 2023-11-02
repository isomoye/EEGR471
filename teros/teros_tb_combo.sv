class uart_test_base;
  int         num_pkts             = 10;
  int         C_BIT_PERIOD         = 50000000 / 115200;
  
  virtual uart_intf uart_if;

  //holder for generated data
  logic [7:0] uart_rx_gen_data[$];
  //holder for monitored data
  logic [7:0] uart_rx_mon_data[$];

  function new(int C_BIT_PERIOD,
               int num_pkts,
               virtual uart_intf uart_if);
    this.C_BIT_PERIOD = C_BIT_PERIOD;
    this.num_pkts     = num_pkts;
    this.uart_if = uart_if;

  endfunction  //new()

  task uart_gen();
    begin
      int delay = $urandom_range(0, 100);
      logic [7:0] temp_rx_data;
      int count = 0;
      $display("starting pkt_gen");
      forever begin
        repeat (delay) @(posedge uart_if.clk_50m);
        if (count < num_pkts) begin
          temp_rx_data = $urandom_range(1, 6000);
          uart_rx_gen_data.push_back(temp_rx_data);
          count++;
        end
      end
    end
  endtask

  //drive uart rx
  task uart_rx_drive();
    begin
      static int count = 0;
      logic [7:0] rx_drv_data;
      $display("starting uart_rx_drive");
      repeat (num_pkts) begin
        //clear ready
        @(posedge uart_if.clk_50m);
        uart_if.rdy_clr = '1;
        @(posedge uart_if.clk_50m);
        uart_if.rdy_clr = '0;
        //wait for packet from gen
        do begin
          @(posedge uart_if.clk_50m);
        end while (uart_rx_gen_data.size() <= 0);
        //grab packet from gen
        rx_drv_data = uart_rx_gen_data.pop_back();
        @(posedge uart_if.clk_50m);
        $display("driving uart_rx_pkt  %d", count);
        // Send Start Bit
        uart_if.rx <= 1'b0;
        repeat (C_BIT_PERIOD) @(posedge uart_if.clk_50m);
        // Send Data Byte
        for (int ii = 0; ii < 8; ii = ii + 1) begin
          uart_if.rx <= rx_drv_data[ii];
          repeat (C_BIT_PERIOD) @(posedge uart_if.clk_50m);
        end
        // Send Stop Bit
        uart_if.rx <= 1'b1;
        repeat (C_BIT_PERIOD * 2) @(posedge uart_if.clk_50m);
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
          @(posedge uart_if.clk_50m);
        end while (uart_if.rx == '1);
        repeat (C_BIT_PERIOD) @(posedge uart_if.clk_50m);
        for (int i = 0; i < 8; i++) begin
          repeat (C_BIT_PERIOD / 2) @(posedge uart_if.clk_50m);
          rx_data[i] = uart_if.rx;
          repeat (C_BIT_PERIOD / 2) @(posedge uart_if.clk_50m);
        end
        //stop bit
        do begin
          @(posedge uart_if.clk_50m);
        end while (uart_if.rx == '0);
        repeat (C_BIT_PERIOD) @(posedge uart_if.clk_50m);
        repeat (C_BIT_PERIOD / 2) @(posedge uart_if.clk_50m);
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
      forever begin
        begin
          //   $display("monitor tracking packet %d",count);
          do begin
            @(posedge uart_if.clk_50m);
          end while (uart_rx_mon_data.size() <= 0);
          mon_data = uart_rx_mon_data.pop_back();
          //check data is as expected
          assert (mon_data == uart_if.dout)
          else begin
            $fatal(0, "rx_data %x does not match expected %x", uart_if.dout, mon_data);
          end
          assert (uart_if.rdy == '1)
          else begin
            $fatal(0, "ready did not assert after driving rx data");
          end
          count++;
        end
      end
    end
  endtask
  
  task timeout;
    #500000;
  endtask

  task test;
    begin

    fork
     uart_gen();
       uart_rx_drive();
       uart_rx_monitor();
       uart_rx_scoreboard();
  //       timeout();
      join_any
    end
  endtask


endclass  //uart_test_base
