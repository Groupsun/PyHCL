module Adder( // @[adder.py:16]
  input   clock, // @[rawmodule.py:100]
  input   reset, // @[rawmodule.py:101]
  input   io_a, // @[adder.py:6]
  input   io_b, // @[adder.py:6]
  input   io_cin, // @[adder.py:6]
  output  io_s, // @[adder.py:6]
  output  io_cout // @[adder.py:6]
);
  wire [1:0] _T_10; // @[adder.py:20]
  wire [1:0] _GEN_0; // @[adder.py:20]
  wire [2:0] _T_11; // @[adder.py:20]
  wire [1:0] t; // @[adder.py:19 adder.py:20]
  assign _T_10 = io_a + io_b; // @[adder.py:20]
  assign _GEN_0 = {{1'd0}, io_cin}; // @[adder.py:20]
  assign _T_11 = _T_10 + _GEN_0; // @[adder.py:20]
  assign t = _T_11[1:0]; // @[adder.py:19 adder.py:20]
  assign io_s = t[0]; // @[adder.py:22]
  assign io_cout = t[1]; // @[adder.py:23]
endmodule