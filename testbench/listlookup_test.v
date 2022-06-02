module Test( // @[listlookup_test.py:64:listlookup_test.fir@2.2]
  input         clock, // @[rawmodule.py:100:listlookup_test.fir@3.4]
  input         reset, // @[rawmodule.py:101:listlookup_test.fir@4.4]
  input  [31:0] io_inst, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  output [31:0] io_ALUOP, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  output [31:0] io_MEM_READ, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  output [31:0] io_MEM_WRITE, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  output [31:0] io_REG_WRITE, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  input  [31:0] io_a, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  input  [31:0] io_b, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  input  [31:0] io_v_0, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  input  [31:0] io_v_1, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  input  [31:0] io_v_2, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  input  [31:0] io_v_3, // @[listlookup_test.py:49:listlookup_test.fir@5.4]
  output [31:0] io_out // @[listlookup_test.py:49:listlookup_test.fir@5.4]
);
  wire [32:0] _T_13; // @[listlookup_test.py:67:listlookup_test.fir@7.4]
  wire [32:0] _T_14; // @[listlookup_test.py:67:listlookup_test.fir@8.4]
  wire [31:0] _T_15; // @[listlookup_test.py:68:listlookup_test.fir@9.4]
  wire [31:0] _T_16; // @[listlookup_test.py:68:listlookup_test.fir@10.4]
  wire [63:0] _T_17; // @[listlookup_test.py:71:listlookup_test.fir@11.4]
  wire [31:0] _T_18; // @[listlookup_test.py:71:listlookup_test.fir@12.4]
  wire [31:0] _T_19; // @[listlookup_test.py:72:listlookup_test.fir@13.4]
  wire [31:0] _GEN_7; // @[listlookup_test.py:72:listlookup_test.fir@14.4]
  wire [31:0] _T_20; // @[listlookup_test.py:72:listlookup_test.fir@14.4]
  wire  _T_21; // @[listlookup_test.py:73:listlookup_test.fir@15.4]
  wire  _T_22; // @[listlookup_test.py:73:listlookup_test.fir@16.4]
  wire  _T_23; // @[listlookup_test.py:74:listlookup_test.fir@17.4]
  wire  _T_24; // @[listlookup_test.py:74:listlookup_test.fir@18.4]
  wire [31:0] _T_25; // @[listlookup.py:52:listlookup_test.fir@19.4]
  wire  _T_26; // @[listlookup.py:52:listlookup_test.fir@20.4]
  wire  _T_28; // @[listlookup.py:52:listlookup_test.fir@22.4]
  wire [32:0] _T_29; // @[listlookup_test.py:77:listlookup_test.fir@23.4]
  wire [63:0] _T_30; // @[listlookup_test.py:77:listlookup_test.fir@24.4]
  wire [32:0] _T_31; // @[listlookup_test.py:77:listlookup_test.fir@25.4]
  wire [32:0] _T_32; // @[listlookup_test.py:77:listlookup_test.fir@26.4]
  wire [31:0] _T_33; // @[listlookup_test.py:77:listlookup_test.fir@27.4]
  wire [31:0] _T_34; // @[listlookup_test.py:77:listlookup_test.fir@28.4]
  wire [31:0] _T_35; // @[listlookup_test.py:77:listlookup_test.fir@29.4]
  wire [31:0] _T_36; // @[listlookup_test.py:77:listlookup_test.fir@30.4]
  wire [32:0] _T_37; // @[listlookup_test.py:82:listlookup_test.fir@31.4]
  wire [32:0] _GEN_0; // @[listlookup_test.py:82:listlookup_test.fir@32.4]
  wire [33:0] _T_38; // @[listlookup_test.py:82:listlookup_test.fir@32.4]
  wire [33:0] _GEN_1; // @[listlookup_test.py:82:listlookup_test.fir@33.4]
  wire [34:0] _T_39; // @[listlookup_test.py:82:listlookup_test.fir@33.4]
  wire [34:0] _GEN_2; // @[listlookup_test.py:82:listlookup_test.fir@34.4]
  wire [35:0] _T_40; // @[listlookup_test.py:82:listlookup_test.fir@34.4]
  wire [63:0] _GEN_3; // @[listlookup_test.py:84:listlookup_test.fir@35.4]
  wire [64:0] _T_41; // @[listlookup_test.py:84:listlookup_test.fir@35.4]
  wire [64:0] _GEN_4; // @[listlookup_test.py:84:listlookup_test.fir@36.4]
  wire [65:0] _T_42; // @[listlookup_test.py:84:listlookup_test.fir@36.4]
  wire [65:0] _GEN_5; // @[listlookup_test.py:84:listlookup_test.fir@37.4]
  wire [66:0] _T_43; // @[listlookup_test.py:84:listlookup_test.fir@37.4]
  wire [66:0] _GEN_6; // @[listlookup_test.py:84:listlookup_test.fir@38.4]
  wire [67:0] _T_44; // @[listlookup_test.py:84:listlookup_test.fir@38.4]
  wire  _T_50; // @[listlookup.py:52:listlookup_test.fir@45.4]
  wire  _T_52; // @[listlookup.py:52:listlookup_test.fir@47.4]
  wire [31:0] _T_53; // @[listlookup.py:52:listlookup_test.fir@48.4]
  wire  _T_54; // @[listlookup.py:52:listlookup_test.fir@49.4]
  wire  _T_56; // @[listlookup.py:52:listlookup_test.fir@51.4]
  wire [1:0] _T_59; // @[listlookup_test.py:86:listlookup_test.fir@54.4]
  wire [1:0] _T_60; // @[listlookup_test.py:86:listlookup_test.fir@55.4]
  wire [1:0] _T_61; // @[listlookup_test.py:86:listlookup_test.fir@56.4]
  wire [1:0] _T_62; // @[listlookup_test.py:86:listlookup_test.fir@57.4]
  wire  _T_65; // @[listlookup_test.py:86:listlookup_test.fir@60.4]
  wire  _T_66; // @[listlookup_test.py:86:listlookup_test.fir@61.4]
  wire  _T_67; // @[listlookup_test.py:86:listlookup_test.fir@62.4]
  wire  _T_68; // @[listlookup_test.py:86:listlookup_test.fir@63.4]
  wire  _T_70; // @[listlookup_test.py:86:listlookup_test.fir@65.4]
  wire  _T_71; // @[listlookup_test.py:86:listlookup_test.fir@66.4]
  wire  _T_72; // @[listlookup_test.py:86:listlookup_test.fir@67.4]
  wire  _T_73; // @[listlookup_test.py:86:listlookup_test.fir@68.4]
  wire  _T_74; // @[listlookup_test.py:86:listlookup_test.fir@69.4]
  wire  _T_77; // @[listlookup_test.py:86:listlookup_test.fir@72.4]
  wire  _T_78; // @[listlookup_test.py:86:listlookup_test.fir@73.4]
  wire  _T_79; // @[listlookup_test.py:86:listlookup_test.fir@74.4]
  wire  _T_80; // @[listlookup_test.py:86:listlookup_test.fir@75.4]
  assign _T_13 = io_a + io_b; // @[listlookup_test.py:67:listlookup_test.fir@7.4]
  assign _T_14 = io_a - io_b; // @[listlookup_test.py:67:listlookup_test.fir@8.4]
  assign _T_15 = io_a & io_b; // @[listlookup_test.py:68:listlookup_test.fir@9.4]
  assign _T_16 = io_a | io_b; // @[listlookup_test.py:68:listlookup_test.fir@10.4]
  assign _T_17 = io_a * io_b; // @[listlookup_test.py:71:listlookup_test.fir@11.4]
  assign _T_18 = io_a / io_b; // @[listlookup_test.py:71:listlookup_test.fir@12.4]
  assign _T_19 = io_a ^ io_b; // @[listlookup_test.py:72:listlookup_test.fir@13.4]
  assign _GEN_7 = io_a % io_b; // @[listlookup_test.py:72:listlookup_test.fir@14.4]
  assign _T_20 = _GEN_7[31:0]; // @[listlookup_test.py:72:listlookup_test.fir@14.4]
  assign _T_21 = io_a == io_b; // @[listlookup_test.py:73:listlookup_test.fir@15.4]
  assign _T_22 = io_a != io_b; // @[listlookup_test.py:73:listlookup_test.fir@16.4]
  assign _T_23 = io_a < io_b; // @[listlookup_test.py:74:listlookup_test.fir@17.4]
  assign _T_24 = io_a > io_b; // @[listlookup_test.py:74:listlookup_test.fir@18.4]
  assign _T_25 = io_inst & 32'hfe00707f; // @[listlookup.py:52:listlookup_test.fir@19.4]
  assign _T_26 = _T_25 == 32'h33; // @[listlookup.py:52:listlookup_test.fir@20.4]
  assign _T_28 = _T_25 == 32'h40000033; // @[listlookup.py:52:listlookup_test.fir@22.4]
  assign _T_29 = _T_28 ? {{32'd0}, _T_21} : _T_13; // @[listlookup_test.py:77:listlookup_test.fir@23.4]
  assign _T_30 = _T_26 ? _T_17 : {{31'd0}, _T_29}; // @[listlookup_test.py:77:listlookup_test.fir@24.4]
  assign _T_31 = _T_28 ? {{32'd0}, _T_22} : _T_14; // @[listlookup_test.py:77:listlookup_test.fir@25.4]
  assign _T_32 = _T_26 ? {{1'd0}, _T_18} : _T_31; // @[listlookup_test.py:77:listlookup_test.fir@26.4]
  assign _T_33 = _T_28 ? {{31'd0}, _T_23} : _T_15; // @[listlookup_test.py:77:listlookup_test.fir@27.4]
  assign _T_34 = _T_26 ? _T_19 : _T_33; // @[listlookup_test.py:77:listlookup_test.fir@28.4]
  assign _T_35 = _T_28 ? {{31'd0}, _T_24} : _T_16; // @[listlookup_test.py:77:listlookup_test.fir@29.4]
  assign _T_36 = _T_26 ? _T_20 : _T_35; // @[listlookup_test.py:77:listlookup_test.fir@30.4]
  assign _T_37 = {{1'd0}, io_v_0}; // @[listlookup_test.py:82:listlookup_test.fir@31.4]
  assign _GEN_0 = {{1'd0}, io_v_1}; // @[listlookup_test.py:82:listlookup_test.fir@32.4]
  assign _T_38 = _T_37 + _GEN_0; // @[listlookup_test.py:82:listlookup_test.fir@32.4]
  assign _GEN_1 = {{2'd0}, io_v_2}; // @[listlookup_test.py:82:listlookup_test.fir@33.4]
  assign _T_39 = _T_38 + _GEN_1; // @[listlookup_test.py:82:listlookup_test.fir@33.4]
  assign _GEN_2 = {{3'd0}, io_v_3}; // @[listlookup_test.py:82:listlookup_test.fir@34.4]
  assign _T_40 = _T_39 + _GEN_2; // @[listlookup_test.py:82:listlookup_test.fir@34.4]
  assign _GEN_3 = {{31'd0}, _T_32}; // @[listlookup_test.py:84:listlookup_test.fir@35.4]
  assign _T_41 = _T_30 + _GEN_3; // @[listlookup_test.py:84:listlookup_test.fir@35.4]
  assign _GEN_4 = {{33'd0}, _T_34}; // @[listlookup_test.py:84:listlookup_test.fir@36.4]
  assign _T_42 = _T_41 + _GEN_4; // @[listlookup_test.py:84:listlookup_test.fir@36.4]
  assign _GEN_5 = {{34'd0}, _T_36}; // @[listlookup_test.py:84:listlookup_test.fir@37.4]
  assign _T_43 = _T_42 + _GEN_5; // @[listlookup_test.py:84:listlookup_test.fir@37.4]
  assign _GEN_6 = {{31'd0}, _T_40}; // @[listlookup_test.py:84:listlookup_test.fir@38.4]
  assign _T_44 = _T_43 + _GEN_6; // @[listlookup_test.py:84:listlookup_test.fir@38.4]
  assign _T_50 = _T_25 == 32'h7033; // @[listlookup.py:52:listlookup_test.fir@45.4]
  assign _T_52 = _T_25 == 32'h6033; // @[listlookup.py:52:listlookup_test.fir@47.4]
  assign _T_53 = io_inst & 32'h707f; // @[listlookup.py:52:listlookup_test.fir@48.4]
  assign _T_54 = _T_53 == 32'h2003; // @[listlookup.py:52:listlookup_test.fir@49.4]
  assign _T_56 = _T_53 == 32'h2023; // @[listlookup.py:52:listlookup_test.fir@51.4]
  assign _T_59 = _T_52 ? 2'h3 : 2'h0; // @[listlookup_test.py:86:listlookup_test.fir@54.4]
  assign _T_60 = _T_50 ? 2'h2 : _T_59; // @[listlookup_test.py:86:listlookup_test.fir@55.4]
  assign _T_61 = _T_28 ? 2'h1 : _T_60; // @[listlookup_test.py:86:listlookup_test.fir@56.4]
  assign _T_62 = _T_26 ? 2'h0 : _T_61; // @[listlookup_test.py:86:listlookup_test.fir@57.4]
  assign _T_65 = _T_52 ? 1'h0 : _T_54; // @[listlookup_test.py:86:listlookup_test.fir@60.4]
  assign _T_66 = _T_50 ? 1'h0 : _T_65; // @[listlookup_test.py:86:listlookup_test.fir@61.4]
  assign _T_67 = _T_28 ? 1'h0 : _T_66; // @[listlookup_test.py:86:listlookup_test.fir@62.4]
  assign _T_68 = _T_26 ? 1'h0 : _T_67; // @[listlookup_test.py:86:listlookup_test.fir@63.4]
  assign _T_70 = _T_54 ? 1'h0 : _T_56; // @[listlookup_test.py:86:listlookup_test.fir@65.4]
  assign _T_71 = _T_52 ? 1'h0 : _T_70; // @[listlookup_test.py:86:listlookup_test.fir@66.4]
  assign _T_72 = _T_50 ? 1'h0 : _T_71; // @[listlookup_test.py:86:listlookup_test.fir@67.4]
  assign _T_73 = _T_28 ? 1'h0 : _T_72; // @[listlookup_test.py:86:listlookup_test.fir@68.4]
  assign _T_74 = _T_26 ? 1'h0 : _T_73; // @[listlookup_test.py:86:listlookup_test.fir@69.4]
  assign _T_77 = _T_52 ? 1'h1 : _T_54; // @[listlookup_test.py:86:listlookup_test.fir@72.4]
  assign _T_78 = _T_50 ? 1'h1 : _T_77; // @[listlookup_test.py:86:listlookup_test.fir@73.4]
  assign _T_79 = _T_28 ? 1'h1 : _T_78; // @[listlookup_test.py:86:listlookup_test.fir@74.4]
  assign _T_80 = _T_26 ? 1'h1 : _T_79; // @[listlookup_test.py:86:listlookup_test.fir@75.4]
  assign io_ALUOP = {{30'd0}, _T_62}; // @[listlookup_test.py:88:listlookup_test.fir@76.4]
  assign io_MEM_READ = {{31'd0}, _T_68}; // @[listlookup_test.py:89:listlookup_test.fir@77.4]
  assign io_MEM_WRITE = {{31'd0}, _T_74}; // @[listlookup_test.py:90:listlookup_test.fir@78.4]
  assign io_REG_WRITE = {{31'd0}, _T_80}; // @[listlookup_test.py:91:listlookup_test.fir@79.4]
  assign io_out = _T_44[31:0]; // @[listlookup_test.py:84:listlookup_test.fir@39.4]
endmodule
