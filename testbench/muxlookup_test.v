module Test( // @[muxlookup_test.py:22:muxlookup_test.fir@2.2]
  input         clock, // @[rawmodule.py:100:muxlookup_test.fir@3.4]
  input         reset, // @[rawmodule.py:101:muxlookup_test.fir@4.4]
  input  [31:0] io_a, // @[muxlookup_test.py:13:muxlookup_test.fir@5.4]
  input  [31:0] io_b, // @[muxlookup_test.py:13:muxlookup_test.fir@5.4]
  input  [1:0]  io_ctl, // @[muxlookup_test.py:13:muxlookup_test.fir@5.4]
  output [31:0] io_out // @[muxlookup_test.py:13:muxlookup_test.fir@5.4]
);
  wire [32:0] _T_8; // @[muxlookup_test.py:26:muxlookup_test.fir@7.4]
  wire [32:0] _T_9; // @[muxlookup_test.py:27:muxlookup_test.fir@8.4]
  wire [31:0] _T_10; // @[muxlookup_test.py:28:muxlookup_test.fir@9.4]
  wire [31:0] _T_11; // @[muxlookup_test.py:29:muxlookup_test.fir@10.4]
  wire  _T_12; // @[muxlookup_test.py:29:muxlookup_test.fir@11.4]
  wire [32:0] _T_13; // @[muxlookup_test.py:29:muxlookup_test.fir@12.4]
  wire  _T_14; // @[muxlookup_test.py:29:muxlookup_test.fir@13.4]
  wire [32:0] _T_15; // @[muxlookup_test.py:29:muxlookup_test.fir@14.4]
  wire  _T_16; // @[muxlookup_test.py:29:muxlookup_test.fir@15.4]
  wire [32:0] _T_17; // @[muxlookup_test.py:29:muxlookup_test.fir@16.4]
  wire  _T_18; // @[muxlookup_test.py:29:muxlookup_test.fir@17.4]
  wire [32:0] _T_19; // @[muxlookup_test.py:29:muxlookup_test.fir@18.4]
  assign _T_8 = io_a + io_b; // @[muxlookup_test.py:26:muxlookup_test.fir@7.4]
  assign _T_9 = io_a - io_b; // @[muxlookup_test.py:27:muxlookup_test.fir@8.4]
  assign _T_10 = io_a & io_b; // @[muxlookup_test.py:28:muxlookup_test.fir@9.4]
  assign _T_11 = io_a | io_b; // @[muxlookup_test.py:29:muxlookup_test.fir@10.4]
  assign _T_12 = io_ctl == 2'h0; // @[muxlookup_test.py:29:muxlookup_test.fir@11.4]
  assign _T_13 = _T_12 ? _T_8 : 33'h0; // @[muxlookup_test.py:29:muxlookup_test.fir@12.4]
  assign _T_14 = io_ctl == 2'h1; // @[muxlookup_test.py:29:muxlookup_test.fir@13.4]
  assign _T_15 = _T_14 ? _T_9 : _T_13; // @[muxlookup_test.py:29:muxlookup_test.fir@14.4]
  assign _T_16 = io_ctl == 2'h2; // @[muxlookup_test.py:29:muxlookup_test.fir@15.4]
  assign _T_17 = _T_16 ? {{1'd0}, _T_10} : _T_15; // @[muxlookup_test.py:29:muxlookup_test.fir@16.4]
  assign _T_18 = io_ctl == 2'h3; // @[muxlookup_test.py:29:muxlookup_test.fir@17.4]
  assign _T_19 = _T_18 ? {{1'd0}, _T_11} : _T_17; // @[muxlookup_test.py:29:muxlookup_test.fir@18.4]
  assign io_out = _T_19[31:0]; // @[muxlookup_test.py:29:muxlookup_test.fir@19.4]
endmodule
