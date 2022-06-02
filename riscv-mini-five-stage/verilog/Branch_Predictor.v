module Addr_Buffer( // @[addr_buffer.py:21:Branch_Predictor.fir@2.2]
  input         clock, // @[rawmodule.py:100:Branch_Predictor.fir@3.4]
  input  [31:0] io_addr_input, // @[addr_buffer.py:11:Branch_Predictor.fir@5.4]
  input         io_flush, // @[addr_buffer.py:11:Branch_Predictor.fir@5.4]
  input         io_record, // @[addr_buffer.py:11:Branch_Predictor.fir@5.4]
  output [31:0] io_front // @[addr_buffer.py:11:Branch_Predictor.fir@5.4]
);
  reg [31:0] buffer [0:2]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_0;
  wire [31:0] buffer__T_32_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_32_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_1;
  wire [31:0] buffer__T_33_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_33_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_2;
  wire [31:0] buffer__T_38_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_38_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_3;
  wire [31:0] buffer__T_39_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_39_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_4;
  wire [31:0] buffer__T_123_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_123_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_5;
  wire [31:0] buffer__T_125_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_125_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_6;
  wire [31:0] buffer__T_135_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_135_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_7;
  wire [31:0] buffer__T_137_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_137_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_8;
  wire [31:0] buffer__T_147_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_147_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_9;
  wire [31:0] buffer__T_149_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_149_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [31:0] _RAND_10;
  wire [31:0] buffer__T_117_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_117_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire  buffer__T_117_mask; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire  buffer__T_117_en; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [31:0] buffer__T_129_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_129_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire  buffer__T_129_mask; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire  buffer__T_129_en; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [31:0] buffer__T_141_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire [1:0] buffer__T_141_addr; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire  buffer__T_141_mask; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  wire  buffer__T_141_en; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  reg [1:0] counter [0:2]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_11;
  wire [1:0] counter__T_26_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_26_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_12;
  wire [1:0] counter__T_27_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_27_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_13;
  wire [1:0] counter__T_29_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_29_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_14;
  wire [1:0] counter__T_30_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_30_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_15;
  wire [1:0] counter__T_35_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_35_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_16;
  wire [1:0] counter__T_36_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_36_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_17;
  wire [1:0] counter__T_68_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_68_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_18;
  wire [1:0] counter__T_74_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_74_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_19;
  wire [1:0] counter__T_80_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_80_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_20;
  wire [1:0] counter__T_86_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_86_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_21;
  wire [1:0] counter__T_89_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_89_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_22;
  wire [1:0] counter__T_91_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_91_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_23;
  wire [1:0] counter__T_97_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_97_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_24;
  wire [1:0] counter__T_100_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_100_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_25;
  wire [1:0] counter__T_102_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_102_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_26;
  wire [1:0] counter__T_108_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_108_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_27;
  wire [1:0] counter__T_111_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_111_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_28;
  wire [1:0] counter__T_113_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_113_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_29;
  wire [1:0] counter__T_119_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_119_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_30;
  wire [1:0] counter__T_131_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_131_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_31;
  wire [1:0] counter__T_143_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_143_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg [31:0] _RAND_32;
  wire [1:0] counter__T_84_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_84_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire  counter__T_84_mask; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire  counter__T_84_en; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_95_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_95_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire  counter__T_95_mask; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire  counter__T_95_en; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_106_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire [1:0] counter__T_106_addr; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire  counter__T_106_mask; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  wire  counter__T_106_en; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  reg  is_used [0:2]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_33;
  wire  is_used__T_42_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_42_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_34;
  wire  is_used__T_44_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_44_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_35;
  wire  is_used__T_50_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_50_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_36;
  wire  is_used__T_52_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_52_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_37;
  wire  is_used__T_56_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_56_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_38;
  wire  is_used__T_58_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_58_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_39;
  wire  is_used__T_62_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_62_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_40;
  wire  is_used__T_64_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_64_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_41;
  wire  is_used__T_88_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_88_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_42;
  wire  is_used__T_99_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_99_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_43;
  wire  is_used__T_110_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_110_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  reg [31:0] _RAND_44;
  wire  is_used__T_66_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_66_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_66_mask; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_66_en; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_72_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_72_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_72_mask; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_72_en; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_78_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire [1:0] is_used__T_78_addr; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_78_mask; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  is_used__T_78_en; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  wire  _T_28; // @[addr_buffer.py:28:Branch_Predictor.fir@12.4]
  wire  _T_31; // @[addr_buffer.py:29:Branch_Predictor.fir@15.4]
  wire [31:0] _T_34; // @[addr_buffer.py:29:Branch_Predictor.fir@18.4]
  wire  _T_37; // @[addr_buffer.py:30:Branch_Predictor.fir@21.4]
  wire [31:0] _T_40; // @[addr_buffer.py:30:Branch_Predictor.fir@24.4]
  wire  _T_43; // @[addr_buffer.py:32:Branch_Predictor.fir@28.4]
  wire  _T_45; // @[addr_buffer.py:32:Branch_Predictor.fir@30.4]
  wire [1:0] _T_46; // @[addr_buffer.py:32:Branch_Predictor.fir@31.4]
  wire [1:0] _T_47; // @[addr_buffer.py:32:Branch_Predictor.fir@32.4]
  wire  _T_49; // @[addr_buffer.py:37:Branch_Predictor.fir@34.4]
  wire  _T_51; // @[addr_buffer.py:37:Branch_Predictor.fir@36.4]
  wire  _T_53; // @[addr_buffer.py:38:Branch_Predictor.fir@38.4]
  wire  _T_55; // @[addr_buffer.py:37:Branch_Predictor.fir@40.4]
  wire  _T_57; // @[addr_buffer.py:37:Branch_Predictor.fir@42.4]
  wire  _T_59; // @[addr_buffer.py:38:Branch_Predictor.fir@44.4]
  wire  _T_61; // @[addr_buffer.py:37:Branch_Predictor.fir@46.4]
  wire  _T_63; // @[addr_buffer.py:37:Branch_Predictor.fir@48.4]
  wire  _T_65; // @[addr_buffer.py:38:Branch_Predictor.fir@50.4]
  wire  _T_69; // @[addr_buffer.py:41:Branch_Predictor.fir@54.4]
  wire  _T_70; // @[addr_buffer.py:42:Branch_Predictor.fir@55.4]
  wire  _T_75; // @[addr_buffer.py:41:Branch_Predictor.fir@61.4]
  wire  _T_76; // @[addr_buffer.py:42:Branch_Predictor.fir@62.4]
  wire  _T_81; // @[addr_buffer.py:41:Branch_Predictor.fir@68.4]
  wire  _T_82; // @[addr_buffer.py:42:Branch_Predictor.fir@69.4]
  wire  _T_87; // @[addr_buffer.py:46:Branch_Predictor.fir@75.4]
  wire [2:0] _T_90; // @[addr_buffer.py:47:Branch_Predictor.fir@78.4]
  wire [2:0] _T_92; // @[addr_buffer.py:47:Branch_Predictor.fir@80.4]
  wire [2:0] _T_93; // @[addr_buffer.py:47:Branch_Predictor.fir@81.4]
  wire [2:0] _T_94; // @[addr_buffer.py:47:Branch_Predictor.fir@82.4]
  wire  _T_98; // @[addr_buffer.py:46:Branch_Predictor.fir@87.4]
  wire [2:0] _T_101; // @[addr_buffer.py:47:Branch_Predictor.fir@90.4]
  wire [2:0] _T_103; // @[addr_buffer.py:47:Branch_Predictor.fir@92.4]
  wire [2:0] _T_104; // @[addr_buffer.py:47:Branch_Predictor.fir@93.4]
  wire [2:0] _T_105; // @[addr_buffer.py:47:Branch_Predictor.fir@94.4]
  wire  _T_109; // @[addr_buffer.py:46:Branch_Predictor.fir@99.4]
  wire [2:0] _T_112; // @[addr_buffer.py:47:Branch_Predictor.fir@102.4]
  wire [2:0] _T_114; // @[addr_buffer.py:47:Branch_Predictor.fir@104.4]
  wire [2:0] _T_115; // @[addr_buffer.py:47:Branch_Predictor.fir@105.4]
  wire [2:0] _T_116; // @[addr_buffer.py:47:Branch_Predictor.fir@106.4]
  wire  _T_120; // @[addr_buffer.py:51:Branch_Predictor.fir@111.4]
  wire [31:0] _T_124; // @[addr_buffer.py:53:Branch_Predictor.fir@115.4]
  wire [31:0] _T_126; // @[addr_buffer.py:54:Branch_Predictor.fir@117.4]
  wire [31:0] _T_127; // @[addr_buffer.py:54:Branch_Predictor.fir@118.4]
  wire  _T_132; // @[addr_buffer.py:51:Branch_Predictor.fir@124.4]
  wire [31:0] _T_136; // @[addr_buffer.py:53:Branch_Predictor.fir@128.4]
  wire [31:0] _T_138; // @[addr_buffer.py:54:Branch_Predictor.fir@130.4]
  wire [31:0] _T_139; // @[addr_buffer.py:54:Branch_Predictor.fir@131.4]
  wire  _T_144; // @[addr_buffer.py:51:Branch_Predictor.fir@137.4]
  wire [31:0] _T_148; // @[addr_buffer.py:53:Branch_Predictor.fir@141.4]
  wire [31:0] _T_150; // @[addr_buffer.py:54:Branch_Predictor.fir@143.4]
  wire [31:0] _T_151; // @[addr_buffer.py:54:Branch_Predictor.fir@144.4]
  assign buffer__T_32_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_32_data = buffer[buffer__T_32_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_32_data = buffer__T_32_addr >= 2'h3 ? _RAND_1[31:0] : buffer[buffer__T_32_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_33_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_33_data = buffer[buffer__T_33_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_33_data = buffer__T_33_addr >= 2'h3 ? _RAND_2[31:0] : buffer[buffer__T_33_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_38_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_38_data = buffer[buffer__T_38_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_38_data = buffer__T_38_addr >= 2'h3 ? _RAND_3[31:0] : buffer[buffer__T_38_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_39_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_39_data = buffer[buffer__T_39_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_39_data = buffer__T_39_addr >= 2'h3 ? _RAND_4[31:0] : buffer[buffer__T_39_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_123_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_123_data = buffer[buffer__T_123_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_123_data = buffer__T_123_addr >= 2'h3 ? _RAND_5[31:0] : buffer[buffer__T_123_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_125_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_125_data = buffer[buffer__T_125_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_125_data = buffer__T_125_addr >= 2'h3 ? _RAND_6[31:0] : buffer[buffer__T_125_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_135_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_135_data = buffer[buffer__T_135_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_135_data = buffer__T_135_addr >= 2'h3 ? _RAND_7[31:0] : buffer[buffer__T_135_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_137_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_137_data = buffer[buffer__T_137_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_137_data = buffer__T_137_addr >= 2'h3 ? _RAND_8[31:0] : buffer[buffer__T_137_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_147_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_147_data = buffer[buffer__T_147_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_147_data = buffer__T_147_addr >= 2'h3 ? _RAND_9[31:0] : buffer[buffer__T_147_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_149_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_149_data = buffer[buffer__T_149_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `else
  assign buffer__T_149_data = buffer__T_149_addr >= 2'h3 ? _RAND_10[31:0] : buffer[buffer__T_149_addr]; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_117_data = io_flush ? 32'h0 : _T_127;
  assign buffer__T_117_addr = 2'h0;
  assign buffer__T_117_mask = 1'h1;
  assign buffer__T_117_en = 1'h1;
  assign buffer__T_129_data = io_flush ? 32'h0 : _T_139;
  assign buffer__T_129_addr = 2'h1;
  assign buffer__T_129_mask = 1'h1;
  assign buffer__T_129_en = 1'h1;
  assign buffer__T_141_data = io_flush ? 32'h0 : _T_151;
  assign buffer__T_141_addr = 2'h2;
  assign buffer__T_141_mask = 1'h1;
  assign buffer__T_141_en = 1'h1;
  assign counter__T_26_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_26_data = counter[counter__T_26_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_26_data = counter__T_26_addr >= 2'h3 ? _RAND_12[1:0] : counter[counter__T_26_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_27_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_27_data = counter[counter__T_27_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_27_data = counter__T_27_addr >= 2'h3 ? _RAND_13[1:0] : counter[counter__T_27_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_29_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_29_data = counter[counter__T_29_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_29_data = counter__T_29_addr >= 2'h3 ? _RAND_14[1:0] : counter[counter__T_29_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_30_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_30_data = counter[counter__T_30_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_30_data = counter__T_30_addr >= 2'h3 ? _RAND_15[1:0] : counter[counter__T_30_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_35_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_35_data = counter[counter__T_35_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_35_data = counter__T_35_addr >= 2'h3 ? _RAND_16[1:0] : counter[counter__T_35_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_36_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_36_data = counter[counter__T_36_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_36_data = counter__T_36_addr >= 2'h3 ? _RAND_17[1:0] : counter[counter__T_36_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_68_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_68_data = counter[counter__T_68_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_68_data = counter__T_68_addr >= 2'h3 ? _RAND_18[1:0] : counter[counter__T_68_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_74_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_74_data = counter[counter__T_74_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_74_data = counter__T_74_addr >= 2'h3 ? _RAND_19[1:0] : counter[counter__T_74_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_80_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_80_data = counter[counter__T_80_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_80_data = counter__T_80_addr >= 2'h3 ? _RAND_20[1:0] : counter[counter__T_80_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_86_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_86_data = counter[counter__T_86_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_86_data = counter__T_86_addr >= 2'h3 ? _RAND_21[1:0] : counter[counter__T_86_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_89_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_89_data = counter[counter__T_89_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_89_data = counter__T_89_addr >= 2'h3 ? _RAND_22[1:0] : counter[counter__T_89_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_91_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_91_data = counter[counter__T_91_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_91_data = counter__T_91_addr >= 2'h3 ? _RAND_23[1:0] : counter[counter__T_91_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_97_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_97_data = counter[counter__T_97_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_97_data = counter__T_97_addr >= 2'h3 ? _RAND_24[1:0] : counter[counter__T_97_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_100_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_100_data = counter[counter__T_100_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_100_data = counter__T_100_addr >= 2'h3 ? _RAND_25[1:0] : counter[counter__T_100_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_102_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_102_data = counter[counter__T_102_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_102_data = counter__T_102_addr >= 2'h3 ? _RAND_26[1:0] : counter[counter__T_102_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_108_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_108_data = counter[counter__T_108_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_108_data = counter__T_108_addr >= 2'h3 ? _RAND_27[1:0] : counter[counter__T_108_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_111_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_111_data = counter[counter__T_111_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_111_data = counter__T_111_addr >= 2'h3 ? _RAND_28[1:0] : counter[counter__T_111_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_113_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_113_data = counter[counter__T_113_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_113_data = counter__T_113_addr >= 2'h3 ? _RAND_29[1:0] : counter[counter__T_113_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_119_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_119_data = counter[counter__T_119_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_119_data = counter__T_119_addr >= 2'h3 ? _RAND_30[1:0] : counter[counter__T_119_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_131_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_131_data = counter[counter__T_131_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_131_data = counter__T_131_addr >= 2'h3 ? _RAND_31[1:0] : counter[counter__T_131_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_143_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_143_data = counter[counter__T_143_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `else
  assign counter__T_143_data = counter__T_143_addr >= 2'h3 ? _RAND_32[1:0] : counter[counter__T_143_addr]; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_84_data = _T_94[1:0];
  assign counter__T_84_addr = 2'h0;
  assign counter__T_84_mask = 1'h1;
  assign counter__T_84_en = 1'h1;
  assign counter__T_95_data = _T_105[1:0];
  assign counter__T_95_addr = 2'h1;
  assign counter__T_95_mask = 1'h1;
  assign counter__T_95_en = 1'h1;
  assign counter__T_106_data = _T_116[1:0];
  assign counter__T_106_addr = 2'h2;
  assign counter__T_106_mask = 1'h1;
  assign counter__T_106_en = 1'h1;
  assign is_used__T_42_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_42_data = is_used[is_used__T_42_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_42_data = is_used__T_42_addr >= 2'h3 ? _RAND_34[0:0] : is_used[is_used__T_42_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_44_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_44_data = is_used[is_used__T_44_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_44_data = is_used__T_44_addr >= 2'h3 ? _RAND_35[0:0] : is_used[is_used__T_44_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_50_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_50_data = is_used[is_used__T_50_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_50_data = is_used__T_50_addr >= 2'h3 ? _RAND_36[0:0] : is_used[is_used__T_50_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_52_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_52_data = is_used[is_used__T_52_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_52_data = is_used__T_52_addr >= 2'h3 ? _RAND_37[0:0] : is_used[is_used__T_52_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_56_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_56_data = is_used[is_used__T_56_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_56_data = is_used__T_56_addr >= 2'h3 ? _RAND_38[0:0] : is_used[is_used__T_56_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_58_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_58_data = is_used[is_used__T_58_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_58_data = is_used__T_58_addr >= 2'h3 ? _RAND_39[0:0] : is_used[is_used__T_58_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_62_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_62_data = is_used[is_used__T_62_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_62_data = is_used__T_62_addr >= 2'h3 ? _RAND_40[0:0] : is_used[is_used__T_62_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_64_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_64_data = is_used[is_used__T_64_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_64_data = is_used__T_64_addr >= 2'h3 ? _RAND_41[0:0] : is_used[is_used__T_64_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_88_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_88_data = is_used[is_used__T_88_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_88_data = is_used__T_88_addr >= 2'h3 ? _RAND_42[0:0] : is_used[is_used__T_88_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_99_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_99_data = is_used[is_used__T_99_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_99_data = is_used__T_99_addr >= 2'h3 ? _RAND_43[0:0] : is_used[is_used__T_99_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_110_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_110_data = is_used[is_used__T_110_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `else
  assign is_used__T_110_data = is_used__T_110_addr >= 2'h3 ? _RAND_44[0:0] : is_used[is_used__T_110_addr]; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_66_data = io_flush ? 1'h0 : _T_70;
  assign is_used__T_66_addr = 2'h0;
  assign is_used__T_66_mask = 1'h1;
  assign is_used__T_66_en = 1'h1;
  assign is_used__T_72_data = io_flush ? 1'h0 : _T_76;
  assign is_used__T_72_addr = 2'h1;
  assign is_used__T_72_mask = 1'h1;
  assign is_used__T_72_en = 1'h1;
  assign is_used__T_78_data = io_flush ? 1'h0 : _T_82;
  assign is_used__T_78_addr = 2'h2;
  assign is_used__T_78_mask = 1'h1;
  assign is_used__T_78_en = 1'h1;
  assign _T_28 = counter__T_26_data > counter__T_27_data; // @[addr_buffer.py:28:Branch_Predictor.fir@12.4]
  assign _T_31 = counter__T_29_data > counter__T_30_data; // @[addr_buffer.py:29:Branch_Predictor.fir@15.4]
  assign _T_34 = _T_31 ? buffer__T_32_data : buffer__T_33_data; // @[addr_buffer.py:29:Branch_Predictor.fir@18.4]
  assign _T_37 = counter__T_35_data > counter__T_36_data; // @[addr_buffer.py:30:Branch_Predictor.fir@21.4]
  assign _T_40 = _T_37 ? buffer__T_38_data : buffer__T_39_data; // @[addr_buffer.py:30:Branch_Predictor.fir@24.4]
  assign _T_43 = 1'h0 == is_used__T_42_data; // @[addr_buffer.py:32:Branch_Predictor.fir@28.4]
  assign _T_45 = 1'h0 == is_used__T_44_data; // @[addr_buffer.py:32:Branch_Predictor.fir@30.4]
  assign _T_46 = _T_45 ? 2'h1 : 2'h2; // @[addr_buffer.py:32:Branch_Predictor.fir@31.4]
  assign _T_47 = _T_43 ? 2'h0 : _T_46; // @[addr_buffer.py:32:Branch_Predictor.fir@32.4]
  assign _T_49 = 2'h0 == _T_47; // @[addr_buffer.py:37:Branch_Predictor.fir@34.4]
  assign _T_51 = _T_49 ? 1'h1 : is_used__T_50_data; // @[addr_buffer.py:37:Branch_Predictor.fir@36.4]
  assign _T_53 = io_record ? _T_51 : is_used__T_52_data; // @[addr_buffer.py:38:Branch_Predictor.fir@38.4]
  assign _T_55 = 2'h1 == _T_47; // @[addr_buffer.py:37:Branch_Predictor.fir@40.4]
  assign _T_57 = _T_55 ? 1'h1 : is_used__T_56_data; // @[addr_buffer.py:37:Branch_Predictor.fir@42.4]
  assign _T_59 = io_record ? _T_57 : is_used__T_58_data; // @[addr_buffer.py:38:Branch_Predictor.fir@44.4]
  assign _T_61 = 2'h2 == _T_47; // @[addr_buffer.py:37:Branch_Predictor.fir@46.4]
  assign _T_63 = _T_61 ? 1'h1 : is_used__T_62_data; // @[addr_buffer.py:37:Branch_Predictor.fir@48.4]
  assign _T_65 = io_record ? _T_63 : is_used__T_64_data; // @[addr_buffer.py:38:Branch_Predictor.fir@50.4]
  assign _T_69 = 2'h2 == counter__T_68_data; // @[addr_buffer.py:41:Branch_Predictor.fir@54.4]
  assign _T_70 = _T_69 ? 1'h0 : _T_53; // @[addr_buffer.py:42:Branch_Predictor.fir@55.4]
  assign _T_75 = 2'h2 == counter__T_74_data; // @[addr_buffer.py:41:Branch_Predictor.fir@61.4]
  assign _T_76 = _T_75 ? 1'h0 : _T_59; // @[addr_buffer.py:42:Branch_Predictor.fir@62.4]
  assign _T_81 = 2'h2 == counter__T_80_data; // @[addr_buffer.py:41:Branch_Predictor.fir@68.4]
  assign _T_82 = _T_81 ? 1'h0 : _T_65; // @[addr_buffer.py:42:Branch_Predictor.fir@69.4]
  assign _T_87 = 2'h2 == counter__T_86_data; // @[addr_buffer.py:46:Branch_Predictor.fir@75.4]
  assign _T_90 = counter__T_89_data + 2'h1; // @[addr_buffer.py:47:Branch_Predictor.fir@78.4]
  assign _T_92 = is_used__T_88_data ? _T_90 : {{1'd0}, counter__T_91_data}; // @[addr_buffer.py:47:Branch_Predictor.fir@80.4]
  assign _T_93 = _T_87 ? 3'h0 : _T_92; // @[addr_buffer.py:47:Branch_Predictor.fir@81.4]
  assign _T_94 = io_flush ? 3'h0 : _T_93; // @[addr_buffer.py:47:Branch_Predictor.fir@82.4]
  assign _T_98 = 2'h2 == counter__T_97_data; // @[addr_buffer.py:46:Branch_Predictor.fir@87.4]
  assign _T_101 = counter__T_100_data + 2'h1; // @[addr_buffer.py:47:Branch_Predictor.fir@90.4]
  assign _T_103 = is_used__T_99_data ? _T_101 : {{1'd0}, counter__T_102_data}; // @[addr_buffer.py:47:Branch_Predictor.fir@92.4]
  assign _T_104 = _T_98 ? 3'h0 : _T_103; // @[addr_buffer.py:47:Branch_Predictor.fir@93.4]
  assign _T_105 = io_flush ? 3'h0 : _T_104; // @[addr_buffer.py:47:Branch_Predictor.fir@94.4]
  assign _T_109 = 2'h2 == counter__T_108_data; // @[addr_buffer.py:46:Branch_Predictor.fir@99.4]
  assign _T_112 = counter__T_111_data + 2'h1; // @[addr_buffer.py:47:Branch_Predictor.fir@102.4]
  assign _T_114 = is_used__T_110_data ? _T_112 : {{1'd0}, counter__T_113_data}; // @[addr_buffer.py:47:Branch_Predictor.fir@104.4]
  assign _T_115 = _T_109 ? 3'h0 : _T_114; // @[addr_buffer.py:47:Branch_Predictor.fir@105.4]
  assign _T_116 = io_flush ? 3'h0 : _T_115; // @[addr_buffer.py:47:Branch_Predictor.fir@106.4]
  assign _T_120 = 2'h2 == counter__T_119_data; // @[addr_buffer.py:51:Branch_Predictor.fir@111.4]
  assign _T_124 = _T_49 ? io_addr_input : buffer__T_123_data; // @[addr_buffer.py:53:Branch_Predictor.fir@115.4]
  assign _T_126 = io_record ? _T_124 : buffer__T_125_data; // @[addr_buffer.py:54:Branch_Predictor.fir@117.4]
  assign _T_127 = _T_120 ? 32'h0 : _T_126; // @[addr_buffer.py:54:Branch_Predictor.fir@118.4]
  assign _T_132 = 2'h2 == counter__T_131_data; // @[addr_buffer.py:51:Branch_Predictor.fir@124.4]
  assign _T_136 = _T_55 ? io_addr_input : buffer__T_135_data; // @[addr_buffer.py:53:Branch_Predictor.fir@128.4]
  assign _T_138 = io_record ? _T_136 : buffer__T_137_data; // @[addr_buffer.py:54:Branch_Predictor.fir@130.4]
  assign _T_139 = _T_132 ? 32'h0 : _T_138; // @[addr_buffer.py:54:Branch_Predictor.fir@131.4]
  assign _T_144 = 2'h2 == counter__T_143_data; // @[addr_buffer.py:51:Branch_Predictor.fir@137.4]
  assign _T_148 = _T_61 ? io_addr_input : buffer__T_147_data; // @[addr_buffer.py:53:Branch_Predictor.fir@141.4]
  assign _T_150 = io_record ? _T_148 : buffer__T_149_data; // @[addr_buffer.py:54:Branch_Predictor.fir@143.4]
  assign _T_151 = _T_144 ? 32'h0 : _T_150; // @[addr_buffer.py:54:Branch_Predictor.fir@144.4]
  assign io_front = _T_28 ? _T_34 : _T_40; // @[addr_buffer.py:30:Branch_Predictor.fir@26.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    buffer[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_6 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_8 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_10 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    counter[initvar] = _RAND_11[1:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_12 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_14 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_16 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_18 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_20 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_22 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_24 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_26 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_28 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_30 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
  _RAND_32 = {1{`RANDOM}};
  _RAND_33 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    is_used[initvar] = _RAND_33[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_34 = {1{`RANDOM}};
  _RAND_35 = {1{`RANDOM}};
  _RAND_36 = {1{`RANDOM}};
  _RAND_37 = {1{`RANDOM}};
  _RAND_38 = {1{`RANDOM}};
  _RAND_39 = {1{`RANDOM}};
  _RAND_40 = {1{`RANDOM}};
  _RAND_41 = {1{`RANDOM}};
  _RAND_42 = {1{`RANDOM}};
  _RAND_43 = {1{`RANDOM}};
  _RAND_44 = {1{`RANDOM}};
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if(buffer__T_117_en & buffer__T_117_mask) begin
      buffer[buffer__T_117_addr] <= buffer__T_117_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
    end
    if(buffer__T_129_en & buffer__T_129_mask) begin
      buffer[buffer__T_129_addr] <= buffer__T_129_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
    end
    if(buffer__T_141_en & buffer__T_141_mask) begin
      buffer[buffer__T_141_addr] <= buffer__T_141_data; // @[addr_buffer.py:24:Branch_Predictor.fir@7.4]
    end
    if(counter__T_84_en & counter__T_84_mask) begin
      counter[counter__T_84_addr] <= counter__T_84_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
    end
    if(counter__T_95_en & counter__T_95_mask) begin
      counter[counter__T_95_addr] <= counter__T_95_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
    end
    if(counter__T_106_en & counter__T_106_mask) begin
      counter[counter__T_106_addr] <= counter__T_106_data; // @[addr_buffer.py:25:Branch_Predictor.fir@8.4]
    end
    if(is_used__T_66_en & is_used__T_66_mask) begin
      is_used[is_used__T_66_addr] <= is_used__T_66_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
    end
    if(is_used__T_72_en & is_used__T_72_mask) begin
      is_used[is_used__T_72_addr] <= is_used__T_72_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
    end
    if(is_used__T_78_en & is_used__T_78_mask) begin
      is_used[is_used__T_78_addr] <= is_used__T_78_data; // @[rawdata.py:698:Branch_Predictor.fir@9.4]
    end
  end
endmodule
module Branch_Predictor( // @[branch_predictor.py:30:Branch_Predictor.fir@149.2]
  input         clock, // @[rawmodule.py:100:Branch_Predictor.fir@150.4]
  input         reset, // @[rawmodule.py:101:Branch_Predictor.fir@151.4]
  input  [31:0] io_inst, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  input  [31:0] io_branch_addr, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  input         io_PC_Src, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  input  [31:0] io_pc, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  input         io_ex_Branch, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  input         io_ex_Jump_Type, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  output [1:0]  io_PC_Sel, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  output [31:0] io_new_addr, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  output [31:0] io_pc_recover, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  output        io_IF_ID_Flush, // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
  output        io_ID_EX_Flush // @[branch_predictor.py:13:Branch_Predictor.fir@152.4]
);
  wire  addr_buffer_clock; // @[:Branch_Predictor.fir@154.4]
  wire [31:0] addr_buffer_io_addr_input; // @[:Branch_Predictor.fir@154.4]
  wire  addr_buffer_io_flush; // @[:Branch_Predictor.fir@154.4]
  wire  addr_buffer_io_record; // @[:Branch_Predictor.fir@154.4]
  wire [31:0] addr_buffer_io_front; // @[:Branch_Predictor.fir@154.4]
  reg [1:0] dynamic_counter_status; // @[branch_predictor.py:36:Branch_Predictor.fir@157.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_153; // @[listlookup.py:52:Branch_Predictor.fir@158.4]
  wire  _T_154; // @[listlookup.py:52:Branch_Predictor.fir@159.4]
  wire  _T_156; // @[listlookup.py:52:Branch_Predictor.fir@161.4]
  wire  _T_158; // @[listlookup.py:52:Branch_Predictor.fir@163.4]
  wire  _T_160; // @[listlookup.py:52:Branch_Predictor.fir@165.4]
  wire  _T_162; // @[listlookup.py:52:Branch_Predictor.fir@167.4]
  wire [31:0] _T_163; // @[listlookup.py:52:Branch_Predictor.fir@168.4]
  wire  _T_164; // @[listlookup.py:52:Branch_Predictor.fir@169.4]
  wire  _T_166; // @[listlookup.py:52:Branch_Predictor.fir@171.4]
  wire  _T_168; // @[listlookup.py:52:Branch_Predictor.fir@173.4]
  wire  _T_170; // @[listlookup.py:52:Branch_Predictor.fir@175.4]
  wire  _T_172; // @[listlookup.py:52:Branch_Predictor.fir@177.4]
  wire  _T_174; // @[listlookup.py:52:Branch_Predictor.fir@179.4]
  wire  _T_176; // @[listlookup.py:52:Branch_Predictor.fir@181.4]
  wire  _T_178; // @[listlookup.py:52:Branch_Predictor.fir@183.4]
  wire  _T_180; // @[listlookup.py:52:Branch_Predictor.fir@185.4]
  wire  _T_182; // @[listlookup.py:52:Branch_Predictor.fir@187.4]
  wire  _T_184; // @[listlookup.py:52:Branch_Predictor.fir@189.4]
  wire  _T_186; // @[listlookup.py:52:Branch_Predictor.fir@191.4]
  wire  _T_188; // @[listlookup.py:52:Branch_Predictor.fir@193.4]
  wire  _T_190; // @[listlookup.py:52:Branch_Predictor.fir@195.4]
  wire  _T_192; // @[listlookup.py:52:Branch_Predictor.fir@197.4]
  wire  _T_194; // @[listlookup.py:52:Branch_Predictor.fir@199.4]
  wire  _T_196; // @[listlookup.py:52:Branch_Predictor.fir@201.4]
  wire  _T_198; // @[listlookup.py:52:Branch_Predictor.fir@203.4]
  wire  _T_200; // @[listlookup.py:52:Branch_Predictor.fir@205.4]
  wire  _T_202; // @[listlookup.py:52:Branch_Predictor.fir@207.4]
  wire  _T_204; // @[listlookup.py:52:Branch_Predictor.fir@209.4]
  wire  _T_206; // @[listlookup.py:52:Branch_Predictor.fir@211.4]
  wire  _T_208; // @[listlookup.py:52:Branch_Predictor.fir@213.4]
  wire  _T_210; // @[listlookup.py:52:Branch_Predictor.fir@215.4]
  wire  _T_212; // @[listlookup.py:52:Branch_Predictor.fir@217.4]
  wire  _T_214; // @[listlookup.py:52:Branch_Predictor.fir@219.4]
  wire  _T_216; // @[listlookup.py:52:Branch_Predictor.fir@221.4]
  wire  _T_218; // @[listlookup.py:52:Branch_Predictor.fir@223.4]
  wire [31:0] _T_219; // @[listlookup.py:52:Branch_Predictor.fir@224.4]
  wire  _T_220; // @[listlookup.py:52:Branch_Predictor.fir@225.4]
  wire  _T_222; // @[listlookup.py:52:Branch_Predictor.fir@227.4]
  wire  _T_385; // @[branch_predictor.py:34:Branch_Predictor.fir@390.4]
  wire  _T_386; // @[branch_predictor.py:34:Branch_Predictor.fir@391.4]
  wire  _T_387; // @[branch_predictor.py:34:Branch_Predictor.fir@392.4]
  wire  _T_388; // @[branch_predictor.py:34:Branch_Predictor.fir@393.4]
  wire  _T_389; // @[branch_predictor.py:34:Branch_Predictor.fir@394.4]
  wire  _T_390; // @[branch_predictor.py:34:Branch_Predictor.fir@395.4]
  wire  _T_391; // @[branch_predictor.py:34:Branch_Predictor.fir@396.4]
  wire  _T_392; // @[branch_predictor.py:34:Branch_Predictor.fir@397.4]
  wire  _T_393; // @[branch_predictor.py:34:Branch_Predictor.fir@398.4]
  wire  _T_394; // @[branch_predictor.py:34:Branch_Predictor.fir@399.4]
  wire  _T_395; // @[branch_predictor.py:34:Branch_Predictor.fir@400.4]
  wire  _T_396; // @[branch_predictor.py:34:Branch_Predictor.fir@401.4]
  wire  _T_397; // @[branch_predictor.py:34:Branch_Predictor.fir@402.4]
  wire  _T_398; // @[branch_predictor.py:34:Branch_Predictor.fir@403.4]
  wire  _T_399; // @[branch_predictor.py:34:Branch_Predictor.fir@404.4]
  wire  _T_400; // @[branch_predictor.py:34:Branch_Predictor.fir@405.4]
  wire  _T_401; // @[branch_predictor.py:34:Branch_Predictor.fir@406.4]
  wire  _T_402; // @[branch_predictor.py:34:Branch_Predictor.fir@407.4]
  wire  _T_403; // @[branch_predictor.py:34:Branch_Predictor.fir@408.4]
  wire  _T_404; // @[branch_predictor.py:34:Branch_Predictor.fir@409.4]
  wire  _T_405; // @[branch_predictor.py:34:Branch_Predictor.fir@410.4]
  wire  _T_406; // @[branch_predictor.py:34:Branch_Predictor.fir@411.4]
  wire  _T_407; // @[branch_predictor.py:34:Branch_Predictor.fir@412.4]
  wire  _T_408; // @[branch_predictor.py:34:Branch_Predictor.fir@413.4]
  wire  _T_409; // @[branch_predictor.py:34:Branch_Predictor.fir@414.4]
  wire  _T_410; // @[branch_predictor.py:34:Branch_Predictor.fir@415.4]
  wire  _T_411; // @[branch_predictor.py:34:Branch_Predictor.fir@416.4]
  wire  _T_412; // @[branch_predictor.py:34:Branch_Predictor.fir@417.4]
  wire  _T_413; // @[branch_predictor.py:34:Branch_Predictor.fir@418.4]
  wire  _T_414; // @[branch_predictor.py:34:Branch_Predictor.fir@419.4]
  wire  _T_415; // @[branch_predictor.py:34:Branch_Predictor.fir@420.4]
  wire  _T_416; // @[branch_predictor.py:34:Branch_Predictor.fir@421.4]
  wire  _T_417; // @[branch_predictor.py:34:Branch_Predictor.fir@422.4]
  wire  _T_418; // @[branch_predictor.py:34:Branch_Predictor.fir@423.4]
  wire  _T_652; // @[branch_predictor.py:34:Branch_Predictor.fir@657.4]
  wire  _T_653; // @[branch_predictor.py:34:Branch_Predictor.fir@658.4]
  wire  _T_654; // @[branch_predictor.py:34:Branch_Predictor.fir@659.4]
  wire  _T_655; // @[branch_predictor.py:34:Branch_Predictor.fir@660.4]
  wire  _T_656; // @[branch_predictor.py:34:Branch_Predictor.fir@661.4]
  wire  _T_657; // @[branch_predictor.py:34:Branch_Predictor.fir@662.4]
  wire  _T_658; // @[branch_predictor.py:34:Branch_Predictor.fir@663.4]
  wire  _T_659; // @[branch_predictor.py:34:Branch_Predictor.fir@664.4]
  wire  _T_660; // @[branch_predictor.py:34:Branch_Predictor.fir@665.4]
  wire  _T_661; // @[branch_predictor.py:34:Branch_Predictor.fir@666.4]
  wire  _T_662; // @[branch_predictor.py:34:Branch_Predictor.fir@667.4]
  wire  _T_663; // @[branch_predictor.py:34:Branch_Predictor.fir@668.4]
  wire  _T_664; // @[branch_predictor.py:34:Branch_Predictor.fir@669.4]
  wire  _T_665; // @[branch_predictor.py:34:Branch_Predictor.fir@670.4]
  wire  _T_666; // @[branch_predictor.py:34:Branch_Predictor.fir@671.4]
  wire  _T_667; // @[branch_predictor.py:34:Branch_Predictor.fir@672.4]
  wire  _T_668; // @[branch_predictor.py:34:Branch_Predictor.fir@673.4]
  wire  _T_669; // @[branch_predictor.py:34:Branch_Predictor.fir@674.4]
  wire  _T_670; // @[branch_predictor.py:34:Branch_Predictor.fir@675.4]
  wire  _T_671; // @[branch_predictor.py:34:Branch_Predictor.fir@676.4]
  wire  _T_672; // @[branch_predictor.py:34:Branch_Predictor.fir@677.4]
  wire  _T_673; // @[branch_predictor.py:34:Branch_Predictor.fir@678.4]
  wire  _T_674; // @[branch_predictor.py:34:Branch_Predictor.fir@679.4]
  wire  _T_675; // @[branch_predictor.py:34:Branch_Predictor.fir@680.4]
  wire  _T_676; // @[branch_predictor.py:34:Branch_Predictor.fir@681.4]
  wire  _T_677; // @[branch_predictor.py:34:Branch_Predictor.fir@682.4]
  wire  _T_678; // @[branch_predictor.py:34:Branch_Predictor.fir@683.4]
  wire  _T_679; // @[branch_predictor.py:34:Branch_Predictor.fir@684.4]
  wire  _T_680; // @[branch_predictor.py:34:Branch_Predictor.fir@685.4]
  wire  _T_681; // @[branch_predictor.py:34:Branch_Predictor.fir@686.4]
  wire  _T_682; // @[branch_predictor.py:34:Branch_Predictor.fir@687.4]
  wire  _T_683; // @[branch_predictor.py:34:Branch_Predictor.fir@688.4]
  wire  _T_684; // @[branch_predictor.py:34:Branch_Predictor.fir@689.4]
  wire [32:0] _T_686; // @[branch_predictor.py:37:Branch_Predictor.fir@690.4]
  wire  _T_691; // @[branch_predictor.py:41:Branch_Predictor.fir@695.4]
  wire  _T_692; // @[branch_predictor.py:41:Branch_Predictor.fir@696.4]
  wire  _T_695; // @[branch_predictor.py:42:Branch_Predictor.fir@699.4]
  wire  _T_697; // @[branch_predictor.py:43:Branch_Predictor.fir@701.4]
  wire  _T_698; // @[branch_predictor.py:43:Branch_Predictor.fir@702.4]
  wire  _T_699; // @[branch_predictor.py:45:Branch_Predictor.fir@703.4]
  wire  _T_700; // @[branch_predictor.py:46:Branch_Predictor.fir@704.4]
  wire  _T_701; // @[branch_predictor.py:46:Branch_Predictor.fir@705.4]
  wire [1:0] _T_704; // @[branch_predictor.py:53:Branch_Predictor.fir@710.4]
  wire [1:0] _T_707; // @[branch_predictor.py:61:Branch_Predictor.fir@713.4]
  wire [1:0] _T_709; // @[branch_predictor.py:61:Branch_Predictor.fir@715.4]
  wire  _T_710; // @[mux.py:72:Branch_Predictor.fir@716.4]
  wire [1:0] _T_711; // @[branch_predictor.py:61:Branch_Predictor.fir@717.4]
  wire  _T_712; // @[mux.py:72:Branch_Predictor.fir@718.4]
  wire [1:0] _T_713; // @[branch_predictor.py:61:Branch_Predictor.fir@719.4]
  wire [1:0] _T_715; // @[branch_predictor.py:66:Branch_Predictor.fir@721.4]
  wire [1:0] _T_717; // @[branch_predictor.py:66:Branch_Predictor.fir@723.4]
  wire [1:0] _T_719; // @[branch_predictor.py:66:Branch_Predictor.fir@725.4]
  wire [1:0] _T_721; // @[branch_predictor.py:66:Branch_Predictor.fir@727.4]
  wire [1:0] _T_722; // @[branch_predictor.py:66:Branch_Predictor.fir@728.4]
  wire [1:0] _T_723; // @[branch_predictor.py:67:Branch_Predictor.fir@729.4]
  wire  _T_724; // @[branch_predictor.py:71:Branch_Predictor.fir@731.4]
  wire  _T_725; // @[branch_predictor.py:71:Branch_Predictor.fir@732.4]
  wire  _T_726; // @[branch_predictor.py:71:Branch_Predictor.fir@733.4]
  wire  _T_727; // @[branch_predictor.py:71:Branch_Predictor.fir@734.4]
  wire  _T_730; // @[branch_predictor.py:73:Branch_Predictor.fir@737.4]
  wire  _T_733; // @[branch_predictor.py:74:Branch_Predictor.fir@740.4]
  wire  _T_734; // @[branch_predictor.py:74:Branch_Predictor.fir@741.4]
  wire  _T_735; // @[branch_predictor.py:74:Branch_Predictor.fir@742.4]
  wire [1:0] _T_738; // @[branch_predictor.py:84:Branch_Predictor.fir@746.4]
  wire [1:0] _T_740; // @[branch_predictor.py:84:Branch_Predictor.fir@748.4]
  wire [1:0] _T_742; // @[branch_predictor.py:84:Branch_Predictor.fir@750.4]
  wire [1:0] _T_744; // @[branch_predictor.py:84:Branch_Predictor.fir@752.4]
  wire [1:0] _T_745; // @[branch_predictor.py:87:Branch_Predictor.fir@753.4]
  wire [1:0] _T_746; // @[branch_predictor.py:87:Branch_Predictor.fir@754.4]
  wire  _T_747; // @[branch_predictor.py:91:Branch_Predictor.fir@755.4]
  wire [1:0] _T_748; // @[branch_predictor.py:92:Branch_Predictor.fir@756.4]
  wire [1:0] _T_749; // @[branch_predictor.py:92:Branch_Predictor.fir@757.4]
  wire [31:0] _T_752; // @[branch_predictor.py:96:Branch_Predictor.fir@761.4]
  Addr_Buffer addr_buffer ( // @[:Branch_Predictor.fir@154.4]
    .clock(addr_buffer_clock),
    .io_addr_input(addr_buffer_io_addr_input),
    .io_flush(addr_buffer_io_flush),
    .io_record(addr_buffer_io_record),
    .io_front(addr_buffer_io_front)
  );
  assign _T_153 = io_inst & 32'hfe00707f; // @[listlookup.py:52:Branch_Predictor.fir@158.4]
  assign _T_154 = _T_153 == 32'h33; // @[listlookup.py:52:Branch_Predictor.fir@159.4]
  assign _T_156 = _T_153 == 32'h40000033; // @[listlookup.py:52:Branch_Predictor.fir@161.4]
  assign _T_158 = _T_153 == 32'h7033; // @[listlookup.py:52:Branch_Predictor.fir@163.4]
  assign _T_160 = _T_153 == 32'h6033; // @[listlookup.py:52:Branch_Predictor.fir@165.4]
  assign _T_162 = _T_153 == 32'h4033; // @[listlookup.py:52:Branch_Predictor.fir@167.4]
  assign _T_163 = io_inst & 32'h707f; // @[listlookup.py:52:Branch_Predictor.fir@168.4]
  assign _T_164 = _T_163 == 32'h13; // @[listlookup.py:52:Branch_Predictor.fir@169.4]
  assign _T_166 = _T_163 == 32'h7013; // @[listlookup.py:52:Branch_Predictor.fir@171.4]
  assign _T_168 = _T_163 == 32'h6013; // @[listlookup.py:52:Branch_Predictor.fir@173.4]
  assign _T_170 = _T_163 == 32'h4013; // @[listlookup.py:52:Branch_Predictor.fir@175.4]
  assign _T_172 = _T_153 == 32'h1033; // @[listlookup.py:52:Branch_Predictor.fir@177.4]
  assign _T_174 = _T_153 == 32'h5033; // @[listlookup.py:52:Branch_Predictor.fir@179.4]
  assign _T_176 = _T_153 == 32'h40005033; // @[listlookup.py:52:Branch_Predictor.fir@181.4]
  assign _T_178 = _T_153 == 32'h1013; // @[listlookup.py:52:Branch_Predictor.fir@183.4]
  assign _T_180 = _T_153 == 32'h5013; // @[listlookup.py:52:Branch_Predictor.fir@185.4]
  assign _T_182 = _T_153 == 32'h40005013; // @[listlookup.py:52:Branch_Predictor.fir@187.4]
  assign _T_184 = _T_153 == 32'h2033; // @[listlookup.py:52:Branch_Predictor.fir@189.4]
  assign _T_186 = _T_153 == 32'h3033; // @[listlookup.py:52:Branch_Predictor.fir@191.4]
  assign _T_188 = _T_163 == 32'h2013; // @[listlookup.py:52:Branch_Predictor.fir@193.4]
  assign _T_190 = _T_163 == 32'h3013; // @[listlookup.py:52:Branch_Predictor.fir@195.4]
  assign _T_192 = _T_163 == 32'h2003; // @[listlookup.py:52:Branch_Predictor.fir@197.4]
  assign _T_194 = _T_163 == 32'h1003; // @[listlookup.py:52:Branch_Predictor.fir@199.4]
  assign _T_196 = _T_163 == 32'h3; // @[listlookup.py:52:Branch_Predictor.fir@201.4]
  assign _T_198 = _T_163 == 32'h5003; // @[listlookup.py:52:Branch_Predictor.fir@203.4]
  assign _T_200 = _T_163 == 32'h4003; // @[listlookup.py:52:Branch_Predictor.fir@205.4]
  assign _T_202 = _T_163 == 32'h2023; // @[listlookup.py:52:Branch_Predictor.fir@207.4]
  assign _T_204 = _T_163 == 32'h1023; // @[listlookup.py:52:Branch_Predictor.fir@209.4]
  assign _T_206 = _T_163 == 32'h23; // @[listlookup.py:52:Branch_Predictor.fir@211.4]
  assign _T_208 = _T_163 == 32'h63; // @[listlookup.py:52:Branch_Predictor.fir@213.4]
  assign _T_210 = _T_163 == 32'h1063; // @[listlookup.py:52:Branch_Predictor.fir@215.4]
  assign _T_212 = _T_163 == 32'h4063; // @[listlookup.py:52:Branch_Predictor.fir@217.4]
  assign _T_214 = _T_163 == 32'h5063; // @[listlookup.py:52:Branch_Predictor.fir@219.4]
  assign _T_216 = _T_163 == 32'h6063; // @[listlookup.py:52:Branch_Predictor.fir@221.4]
  assign _T_218 = _T_163 == 32'h7063; // @[listlookup.py:52:Branch_Predictor.fir@223.4]
  assign _T_219 = io_inst & 32'h7f; // @[listlookup.py:52:Branch_Predictor.fir@224.4]
  assign _T_220 = _T_219 == 32'h6f; // @[listlookup.py:52:Branch_Predictor.fir@225.4]
  assign _T_222 = _T_163 == 32'h67; // @[listlookup.py:52:Branch_Predictor.fir@227.4]
  assign _T_385 = _T_220 ? 1'h1 : _T_222; // @[branch_predictor.py:34:Branch_Predictor.fir@390.4]
  assign _T_386 = _T_218 ? 1'h1 : _T_385; // @[branch_predictor.py:34:Branch_Predictor.fir@391.4]
  assign _T_387 = _T_216 ? 1'h1 : _T_386; // @[branch_predictor.py:34:Branch_Predictor.fir@392.4]
  assign _T_388 = _T_214 ? 1'h1 : _T_387; // @[branch_predictor.py:34:Branch_Predictor.fir@393.4]
  assign _T_389 = _T_212 ? 1'h1 : _T_388; // @[branch_predictor.py:34:Branch_Predictor.fir@394.4]
  assign _T_390 = _T_210 ? 1'h1 : _T_389; // @[branch_predictor.py:34:Branch_Predictor.fir@395.4]
  assign _T_391 = _T_208 ? 1'h1 : _T_390; // @[branch_predictor.py:34:Branch_Predictor.fir@396.4]
  assign _T_392 = _T_206 ? 1'h0 : _T_391; // @[branch_predictor.py:34:Branch_Predictor.fir@397.4]
  assign _T_393 = _T_204 ? 1'h0 : _T_392; // @[branch_predictor.py:34:Branch_Predictor.fir@398.4]
  assign _T_394 = _T_202 ? 1'h0 : _T_393; // @[branch_predictor.py:34:Branch_Predictor.fir@399.4]
  assign _T_395 = _T_200 ? 1'h0 : _T_394; // @[branch_predictor.py:34:Branch_Predictor.fir@400.4]
  assign _T_396 = _T_198 ? 1'h0 : _T_395; // @[branch_predictor.py:34:Branch_Predictor.fir@401.4]
  assign _T_397 = _T_196 ? 1'h0 : _T_396; // @[branch_predictor.py:34:Branch_Predictor.fir@402.4]
  assign _T_398 = _T_194 ? 1'h0 : _T_397; // @[branch_predictor.py:34:Branch_Predictor.fir@403.4]
  assign _T_399 = _T_192 ? 1'h0 : _T_398; // @[branch_predictor.py:34:Branch_Predictor.fir@404.4]
  assign _T_400 = _T_190 ? 1'h0 : _T_399; // @[branch_predictor.py:34:Branch_Predictor.fir@405.4]
  assign _T_401 = _T_188 ? 1'h0 : _T_400; // @[branch_predictor.py:34:Branch_Predictor.fir@406.4]
  assign _T_402 = _T_186 ? 1'h0 : _T_401; // @[branch_predictor.py:34:Branch_Predictor.fir@407.4]
  assign _T_403 = _T_184 ? 1'h0 : _T_402; // @[branch_predictor.py:34:Branch_Predictor.fir@408.4]
  assign _T_404 = _T_182 ? 1'h0 : _T_403; // @[branch_predictor.py:34:Branch_Predictor.fir@409.4]
  assign _T_405 = _T_180 ? 1'h0 : _T_404; // @[branch_predictor.py:34:Branch_Predictor.fir@410.4]
  assign _T_406 = _T_178 ? 1'h0 : _T_405; // @[branch_predictor.py:34:Branch_Predictor.fir@411.4]
  assign _T_407 = _T_176 ? 1'h0 : _T_406; // @[branch_predictor.py:34:Branch_Predictor.fir@412.4]
  assign _T_408 = _T_174 ? 1'h0 : _T_407; // @[branch_predictor.py:34:Branch_Predictor.fir@413.4]
  assign _T_409 = _T_172 ? 1'h0 : _T_408; // @[branch_predictor.py:34:Branch_Predictor.fir@414.4]
  assign _T_410 = _T_170 ? 1'h0 : _T_409; // @[branch_predictor.py:34:Branch_Predictor.fir@415.4]
  assign _T_411 = _T_168 ? 1'h0 : _T_410; // @[branch_predictor.py:34:Branch_Predictor.fir@416.4]
  assign _T_412 = _T_166 ? 1'h0 : _T_411; // @[branch_predictor.py:34:Branch_Predictor.fir@417.4]
  assign _T_413 = _T_164 ? 1'h0 : _T_412; // @[branch_predictor.py:34:Branch_Predictor.fir@418.4]
  assign _T_414 = _T_162 ? 1'h0 : _T_413; // @[branch_predictor.py:34:Branch_Predictor.fir@419.4]
  assign _T_415 = _T_160 ? 1'h0 : _T_414; // @[branch_predictor.py:34:Branch_Predictor.fir@420.4]
  assign _T_416 = _T_158 ? 1'h0 : _T_415; // @[branch_predictor.py:34:Branch_Predictor.fir@421.4]
  assign _T_417 = _T_156 ? 1'h0 : _T_416; // @[branch_predictor.py:34:Branch_Predictor.fir@422.4]
  assign _T_418 = _T_154 ? 1'h0 : _T_417; // @[branch_predictor.py:34:Branch_Predictor.fir@423.4]
  assign _T_652 = _T_218 ? 1'h0 : _T_385; // @[branch_predictor.py:34:Branch_Predictor.fir@657.4]
  assign _T_653 = _T_216 ? 1'h0 : _T_652; // @[branch_predictor.py:34:Branch_Predictor.fir@658.4]
  assign _T_654 = _T_214 ? 1'h0 : _T_653; // @[branch_predictor.py:34:Branch_Predictor.fir@659.4]
  assign _T_655 = _T_212 ? 1'h0 : _T_654; // @[branch_predictor.py:34:Branch_Predictor.fir@660.4]
  assign _T_656 = _T_210 ? 1'h0 : _T_655; // @[branch_predictor.py:34:Branch_Predictor.fir@661.4]
  assign _T_657 = _T_208 ? 1'h0 : _T_656; // @[branch_predictor.py:34:Branch_Predictor.fir@662.4]
  assign _T_658 = _T_206 ? 1'h0 : _T_657; // @[branch_predictor.py:34:Branch_Predictor.fir@663.4]
  assign _T_659 = _T_204 ? 1'h0 : _T_658; // @[branch_predictor.py:34:Branch_Predictor.fir@664.4]
  assign _T_660 = _T_202 ? 1'h0 : _T_659; // @[branch_predictor.py:34:Branch_Predictor.fir@665.4]
  assign _T_661 = _T_200 ? 1'h0 : _T_660; // @[branch_predictor.py:34:Branch_Predictor.fir@666.4]
  assign _T_662 = _T_198 ? 1'h0 : _T_661; // @[branch_predictor.py:34:Branch_Predictor.fir@667.4]
  assign _T_663 = _T_196 ? 1'h0 : _T_662; // @[branch_predictor.py:34:Branch_Predictor.fir@668.4]
  assign _T_664 = _T_194 ? 1'h0 : _T_663; // @[branch_predictor.py:34:Branch_Predictor.fir@669.4]
  assign _T_665 = _T_192 ? 1'h0 : _T_664; // @[branch_predictor.py:34:Branch_Predictor.fir@670.4]
  assign _T_666 = _T_190 ? 1'h0 : _T_665; // @[branch_predictor.py:34:Branch_Predictor.fir@671.4]
  assign _T_667 = _T_188 ? 1'h0 : _T_666; // @[branch_predictor.py:34:Branch_Predictor.fir@672.4]
  assign _T_668 = _T_186 ? 1'h0 : _T_667; // @[branch_predictor.py:34:Branch_Predictor.fir@673.4]
  assign _T_669 = _T_184 ? 1'h0 : _T_668; // @[branch_predictor.py:34:Branch_Predictor.fir@674.4]
  assign _T_670 = _T_182 ? 1'h0 : _T_669; // @[branch_predictor.py:34:Branch_Predictor.fir@675.4]
  assign _T_671 = _T_180 ? 1'h0 : _T_670; // @[branch_predictor.py:34:Branch_Predictor.fir@676.4]
  assign _T_672 = _T_178 ? 1'h0 : _T_671; // @[branch_predictor.py:34:Branch_Predictor.fir@677.4]
  assign _T_673 = _T_176 ? 1'h0 : _T_672; // @[branch_predictor.py:34:Branch_Predictor.fir@678.4]
  assign _T_674 = _T_174 ? 1'h0 : _T_673; // @[branch_predictor.py:34:Branch_Predictor.fir@679.4]
  assign _T_675 = _T_172 ? 1'h0 : _T_674; // @[branch_predictor.py:34:Branch_Predictor.fir@680.4]
  assign _T_676 = _T_170 ? 1'h0 : _T_675; // @[branch_predictor.py:34:Branch_Predictor.fir@681.4]
  assign _T_677 = _T_168 ? 1'h0 : _T_676; // @[branch_predictor.py:34:Branch_Predictor.fir@682.4]
  assign _T_678 = _T_166 ? 1'h0 : _T_677; // @[branch_predictor.py:34:Branch_Predictor.fir@683.4]
  assign _T_679 = _T_164 ? 1'h0 : _T_678; // @[branch_predictor.py:34:Branch_Predictor.fir@684.4]
  assign _T_680 = _T_162 ? 1'h0 : _T_679; // @[branch_predictor.py:34:Branch_Predictor.fir@685.4]
  assign _T_681 = _T_160 ? 1'h0 : _T_680; // @[branch_predictor.py:34:Branch_Predictor.fir@686.4]
  assign _T_682 = _T_158 ? 1'h0 : _T_681; // @[branch_predictor.py:34:Branch_Predictor.fir@687.4]
  assign _T_683 = _T_156 ? 1'h0 : _T_682; // @[branch_predictor.py:34:Branch_Predictor.fir@688.4]
  assign _T_684 = _T_154 ? 1'h0 : _T_683; // @[branch_predictor.py:34:Branch_Predictor.fir@689.4]
  assign _T_686 = io_pc + 32'h4; // @[branch_predictor.py:37:Branch_Predictor.fir@690.4]
  assign _T_691 = 1'h0 == _T_684; // @[branch_predictor.py:41:Branch_Predictor.fir@695.4]
  assign _T_692 = _T_418 & _T_691; // @[branch_predictor.py:41:Branch_Predictor.fir@696.4]
  assign _T_695 = io_ex_Branch & io_ex_Jump_Type; // @[branch_predictor.py:42:Branch_Predictor.fir@699.4]
  assign _T_697 = io_ex_Jump_Type == 1'h0; // @[branch_predictor.py:43:Branch_Predictor.fir@701.4]
  assign _T_698 = io_ex_Branch & _T_697; // @[branch_predictor.py:43:Branch_Predictor.fir@702.4]
  assign _T_699 = dynamic_counter_status == 2'h2; // @[branch_predictor.py:45:Branch_Predictor.fir@703.4]
  assign _T_700 = dynamic_counter_status == 2'h3; // @[branch_predictor.py:46:Branch_Predictor.fir@704.4]
  assign _T_701 = _T_699 | _T_700; // @[branch_predictor.py:46:Branch_Predictor.fir@705.4]
  assign _T_704 = _T_695 ? 2'h2 : 2'h0; // @[branch_predictor.py:53:Branch_Predictor.fir@710.4]
  assign _T_707 = _T_699 ? 2'h2 : dynamic_counter_status; // @[branch_predictor.py:61:Branch_Predictor.fir@713.4]
  assign _T_709 = _T_700 ? 2'h2 : _T_707; // @[branch_predictor.py:61:Branch_Predictor.fir@715.4]
  assign _T_710 = dynamic_counter_status == 2'h1; // @[mux.py:72:Branch_Predictor.fir@716.4]
  assign _T_711 = _T_710 ? 2'h3 : _T_709; // @[branch_predictor.py:61:Branch_Predictor.fir@717.4]
  assign _T_712 = dynamic_counter_status == 2'h0; // @[mux.py:72:Branch_Predictor.fir@718.4]
  assign _T_713 = _T_712 ? 2'h1 : _T_711; // @[branch_predictor.py:61:Branch_Predictor.fir@719.4]
  assign _T_715 = _T_699 ? 2'h3 : dynamic_counter_status; // @[branch_predictor.py:66:Branch_Predictor.fir@721.4]
  assign _T_717 = _T_700 ? 2'h1 : _T_715; // @[branch_predictor.py:66:Branch_Predictor.fir@723.4]
  assign _T_719 = _T_710 ? 2'h0 : _T_717; // @[branch_predictor.py:66:Branch_Predictor.fir@725.4]
  assign _T_721 = _T_712 ? 2'h0 : _T_719; // @[branch_predictor.py:66:Branch_Predictor.fir@727.4]
  assign _T_722 = io_PC_Src ? _T_713 : _T_721; // @[branch_predictor.py:66:Branch_Predictor.fir@728.4]
  assign _T_723 = _T_698 ? _T_722 : dynamic_counter_status; // @[branch_predictor.py:67:Branch_Predictor.fir@729.4]
  assign _T_724 = 2'h3 == _T_723; // @[branch_predictor.py:71:Branch_Predictor.fir@731.4]
  assign _T_725 = 2'h1 == _T_723; // @[branch_predictor.py:71:Branch_Predictor.fir@732.4]
  assign _T_726 = _T_724 | _T_725; // @[branch_predictor.py:71:Branch_Predictor.fir@733.4]
  assign _T_727 = _T_698 & _T_726; // @[branch_predictor.py:71:Branch_Predictor.fir@734.4]
  assign _T_730 = _T_724 & _T_699; // @[branch_predictor.py:73:Branch_Predictor.fir@737.4]
  assign _T_733 = _T_725 & _T_700; // @[branch_predictor.py:74:Branch_Predictor.fir@740.4]
  assign _T_734 = _T_730 | _T_733; // @[branch_predictor.py:74:Branch_Predictor.fir@741.4]
  assign _T_735 = _T_727 & _T_734; // @[branch_predictor.py:74:Branch_Predictor.fir@742.4]
  assign _T_738 = _T_699 ? 2'h2 : 2'h0; // @[branch_predictor.py:84:Branch_Predictor.fir@746.4]
  assign _T_740 = _T_700 ? 2'h2 : _T_738; // @[branch_predictor.py:84:Branch_Predictor.fir@748.4]
  assign _T_742 = _T_710 ? 2'h0 : _T_740; // @[branch_predictor.py:84:Branch_Predictor.fir@750.4]
  assign _T_744 = _T_712 ? 2'h0 : _T_742; // @[branch_predictor.py:84:Branch_Predictor.fir@752.4]
  assign _T_745 = _T_735 ? 2'h1 : 2'h2; // @[branch_predictor.py:87:Branch_Predictor.fir@753.4]
  assign _T_746 = _T_727 ? _T_745 : 2'h0; // @[branch_predictor.py:87:Branch_Predictor.fir@754.4]
  assign _T_747 = _T_698 & _T_727; // @[branch_predictor.py:91:Branch_Predictor.fir@755.4]
  assign _T_748 = _T_692 ? _T_744 : 2'h0; // @[branch_predictor.py:92:Branch_Predictor.fir@756.4]
  assign _T_749 = _T_747 ? _T_746 : _T_748; // @[branch_predictor.py:92:Branch_Predictor.fir@757.4]
  assign _T_752 = _T_698 ? io_branch_addr : {{30'd0}, _T_748}; // @[branch_predictor.py:96:Branch_Predictor.fir@761.4]
  assign io_PC_Sel = _T_695 ? _T_704 : _T_749; // @[branch_predictor.py:92:Branch_Predictor.fir@759.4]
  assign io_new_addr = _T_695 ? io_branch_addr : _T_752; // @[branch_predictor.py:96:Branch_Predictor.fir@763.4]
  assign io_pc_recover = addr_buffer_io_front; // @[branch_predictor.py:98:Branch_Predictor.fir@764.4]
  assign io_IF_ID_Flush = _T_695 | _T_727; // @[branch_predictor.py:101:Branch_Predictor.fir@766.4]
  assign io_ID_EX_Flush = _T_695 | _T_727; // @[branch_predictor.py:102:Branch_Predictor.fir@768.4]
  assign addr_buffer_clock = clock; // @[rawmodule.py:110:Branch_Predictor.fir@155.4]
  assign addr_buffer_io_addr_input = _T_686[31:0]; // @[branch_predictor.py:49:Branch_Predictor.fir@708.4]
  assign addr_buffer_io_flush = _T_695 | _T_727; // @[branch_predictor.py:78:Branch_Predictor.fir@744.4]
  assign addr_buffer_io_record = _T_692 & _T_701; // @[branch_predictor.py:48:Branch_Predictor.fir@707.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dynamic_counter_status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      dynamic_counter_status <= 2'h0;
    end else begin
      if (_T_698) begin
        if (io_PC_Src) begin
          if (_T_712) begin
            dynamic_counter_status <= 2'h1;
          end else begin
            if (_T_710) begin
              dynamic_counter_status <= 2'h3;
            end else begin
              if (_T_700) begin
                dynamic_counter_status <= 2'h2;
              end else begin
                if (_T_699) begin
                  dynamic_counter_status <= 2'h2;
                end
              end
            end
          end
        end else begin
          if (_T_712) begin
            dynamic_counter_status <= 2'h0;
          end else begin
            if (_T_710) begin
              dynamic_counter_status <= 2'h0;
            end else begin
              if (_T_700) begin
                dynamic_counter_status <= 2'h1;
              end else begin
                if (_T_699) begin
                  dynamic_counter_status <= 2'h3;
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
