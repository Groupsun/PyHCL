module Test( // @[general_test.py:55:general_test.fir@2.2]
  input         clock, // @[rawmodule.py:100:general_test.fir@3.4]
  input         reset, // @[rawmodule.py:101:general_test.fir@4.4]
  input  [31:0] io_a, // @[general_test.py:40:general_test.fir@5.4]
  input  [31:0] io_b, // @[general_test.py:40:general_test.fir@5.4]
  output [31:0] io_out // @[general_test.py:40:general_test.fir@5.4]
);
  wire [32:0] _T_8; // @[general_test.py:114:general_test.fir@8.4]
  wire [32:0] _T_9; // @[general_test.py:115:general_test.fir@9.4]
  wire [31:0] _T_10; // @[general_test.py:116:general_test.fir@10.4]
  wire [31:0] _T_11; // @[general_test.py:117:general_test.fir@11.4]
  wire [31:0] _T_12; // @[mux.py:65:general_test.fir@12.4]
  wire  _T_13; // @[mux.py:65:general_test.fir@13.4]
  wire [32:0] _T_14; // @[general_test.py:117:general_test.fir@14.4]
  wire  _T_16; // @[mux.py:65:general_test.fir@16.4]
  wire [32:0] _T_17; // @[general_test.py:117:general_test.fir@17.4]
  wire  _T_19; // @[mux.py:65:general_test.fir@19.4]
  wire [32:0] _T_20; // @[general_test.py:117:general_test.fir@20.4]
  wire  _T_22; // @[mux.py:65:general_test.fir@22.4]
  wire [32:0] _T_23; // @[general_test.py:117:general_test.fir@23.4]
  assign _T_8 = io_a + io_b; // @[general_test.py:114:general_test.fir@8.4]
  assign _T_9 = io_a - io_b; // @[general_test.py:115:general_test.fir@9.4]
  assign _T_10 = io_a & io_b; // @[general_test.py:116:general_test.fir@10.4]
  assign _T_11 = io_a | io_b; // @[general_test.py:117:general_test.fir@11.4]
  assign _T_12 = io_a & 32'hfe00707f; // @[mux.py:65:general_test.fir@12.4]
  assign _T_13 = _T_12 == 32'h33; // @[mux.py:65:general_test.fir@13.4]
  assign _T_14 = _T_13 ? _T_8 : 33'h0; // @[general_test.py:117:general_test.fir@14.4]
  assign _T_16 = _T_12 == 32'h40000033; // @[mux.py:65:general_test.fir@16.4]
  assign _T_17 = _T_16 ? _T_9 : _T_14; // @[general_test.py:117:general_test.fir@17.4]
  assign _T_19 = _T_12 == 32'h7033; // @[mux.py:65:general_test.fir@19.4]
  assign _T_20 = _T_19 ? {{1'd0}, _T_10} : _T_17; // @[general_test.py:117:general_test.fir@20.4]
  assign _T_22 = _T_12 == 32'h6033; // @[mux.py:65:general_test.fir@22.4]
  assign _T_23 = _T_22 ? {{1'd0}, _T_11} : _T_20; // @[general_test.py:117:general_test.fir@23.4]
  assign io_out = _T_23[31:0]; // @[general_test.py:117:general_test.fir@24.4]
endmodule
