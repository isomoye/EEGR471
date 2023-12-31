/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "../src/control_unit.v:1" *)
module control_unit_netlist (
    flush,
    shift,
    addshift,
    load_words,
    ready,
    empty,
    m_is_1,
    m0,
    start,
    clk,
    reset
);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  (* src = "../src/control_unit.v:1" *)
  wire _06_;
  (* src = "../src/control_unit.v:2" *)
  wire _07_;
  (* src = "../src/control_unit.v:1" *)
  wire _08_;
  (* src = "../src/control_unit.v:1" *)
  wire _09_;
  (* src = "../src/control_unit.v:2" *)
  wire _10_;
  (* src = "../src/control_unit.v:2" *)
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  (* src = "../src/control_unit.v:4" *)
  wire _19_;
  (* src = "../src/control_unit.v:1" *)
  wire _20_;
  (* src = "../src/control_unit.v:3" *)
  wire _21_;
  (* src = "../src/control_unit.v:1" *)
  wire _22_;
  (* src = "../src/control_unit.v:2" *)
  wire _23_;
  (* src = "../src/control_unit.v:4" *)
  wire _24_;
  (* src = "../src/control_unit.v:1" *)
  output addshift;
  (* src = "../src/control_unit.v:3" *)
  input clk;
  (* src = "../src/control_unit.v:2" *)
  input empty;
  (* src = "../src/control_unit.v:1" *)
  output flush;
  (* src = "../src/control_unit.v:1" *)
  output load_words;
  (* src = "../src/control_unit.v:2" *)
  input m0;
  (* src = "../src/control_unit.v:2" *)
  input m_is_1;
  (* src = "../src/control_unit.v:4" *)
  wire next_state;
  (* src = "../src/control_unit.v:1" *)
  output ready;
  (* src = "../src/control_unit.v:3" *)
  input reset;
  (* src = "../src/control_unit.v:1" *)
  output shift;
  (* src = "../src/control_unit.v:2" *)
  input start;
  (* src = "../src/control_unit.v:4" *)
  wire state;
  NOT _25_ (
      .A(_24_),
      .Y(_12_)
  );
  NOT _26_ (
      .A(_11_),
      .Y(_13_)
  );
  NOT _27_ (
      .A(_07_),
      .Y(_14_)
  );
  NOR _28_ (
      .A(_21_),
      .B(_24_),
      .Y(_20_)
  );
  NAND _29_ (
      .A(_23_),
      .B(_20_),
      .Y(_15_)
  );
  NOR _30_ (
      .A(_07_),
      .B(_15_),
      .Y(_09_)
  );
  NOT _31_ (
      .A(_09_),
      .Y(_16_)
  );
  NAND _32_ (
      .A(_24_),
      .B(_13_),
      .Y(_17_)
  );
  NAND _33_ (
      .A(_16_),
      .B(_17_),
      .Y(_19_)
  );
  NOR _34_ (
      .A(_14_),
      .B(_15_),
      .Y(_08_)
  );
  NOR _35_ (
      .A(_11_),
      .B(_10_),
      .Y(_18_)
  );
  NOR _36_ (
      .A(_12_),
      .B(_18_),
      .Y(_06_)
  );
  NOR _37_ (
      .A(_10_),
      .B(_17_),
      .Y(_22_)
  );
  (* src = "../src/control_unit.v:7" *)
  DFFSR _38_ (
      .C(clk),
      .D(next_state),
      .Q(state),
      .R(reset),
      .S(1'h0)
  );
  assign _21_ = reset;
  assign _24_ = state;
  assign load_words = _09_;
  assign _11_ = m_is_1;
  assign next_state = _19_;
  assign ready = _20_;
  assign _23_ = start;
  assign _07_ = empty;
  assign flush = _08_;
  assign _10_ = m0;
  assign addshift = _06_;
  assign shift = _22_;
endmodule
