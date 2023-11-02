module tb_combo ();

  logic a, b, c, d, g,h;
  logic temp_g, temp_h;


  assign temp_g = ((a & b) | (~(b|c)));
  assign temp_h = ~((~(b|c)) & d);

  combo combo_inst (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .g(g),
    .h(h)
  );



  task driver;
    begin
      a = $urandom_range(0,1);
      b = $urandom_range(0,1);
      c = $urandom_range(0,1);
      d = $urandom_range(0,1);
    end
  endtask

  task scoreboard;
    begin
      assert(g == temp_g)
        begin
        end
      else
        begin
          $fatal(0,"output of g %b does not match expected %b",
            g, temp_g);
        end
      assert(h == temp_h)
        begin
        end
      else
        begin
          $fatal(0,"output of h %b does not match expected %b",
            h, temp_h);
        end
    end
  endtask

  task test;
    begin
      repeat(20)
        begin
          a = '0;
          b = '0;
          c = '0;
          d = '0;

          #5;
          driver();
          #1;
          scoreboard();
        end
    end
  endtask


  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(0,tb_combo);
      test();
      #10;
      $finish;
    end
endmodule
