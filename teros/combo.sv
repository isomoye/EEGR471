//combitational assigments
module combo  (
    //inputs
    input logic a, 
    input logic b, 
    input logic c, 
    input logic d,
    //outputs
    output logic g,
    output logic h
  );

  //internal signals
  logic e;
  logic f;

  //assignments
  assign e = a & b;
  assign f = (~(b | c ));
  assign g = e | f;
  assign h = ~(f & d);



endmodule
