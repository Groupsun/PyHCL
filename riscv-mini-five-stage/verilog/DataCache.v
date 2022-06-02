module DataCache( // @[datacache.py:24:DataCache.fir@2.2]
  input         clock, // @[rawmodule.py:100:DataCache.fir@3.4]
  input         reset, // @[rawmodule.py:101:DataCache.fir@4.4]
  input  [31:0] io_addr, // @[datacache.py:11:DataCache.fir@5.4]
  input  [31:0] io_write_data, // @[datacache.py:11:DataCache.fir@5.4]
  input         io_Mem_Read, // @[datacache.py:11:DataCache.fir@5.4]
  input         io_Mem_Write, // @[datacache.py:11:DataCache.fir@5.4]
  input  [1:0]  io_Data_Size, // @[datacache.py:11:DataCache.fir@5.4]
  input         io_Load_Type, // @[datacache.py:11:DataCache.fir@5.4]
  output [31:0] io_data_out // @[datacache.py:11:DataCache.fir@5.4]
);
  reg [31:0] cache [0:31]; // @[datacache.py:27:DataCache.fir@7.4]
  reg [31:0] _RAND_0;
  wire [31:0] cache__T_24_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_24_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_25_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_25_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_26_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_26_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_28_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_28_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_34_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_34_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_36_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_36_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_54_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_54_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] cache__T_52_data; // @[datacache.py:27:DataCache.fir@7.4]
  wire [4:0] cache__T_52_addr; // @[datacache.py:27:DataCache.fir@7.4]
  wire  cache__T_52_mask; // @[datacache.py:27:DataCache.fir@7.4]
  wire  cache__T_52_en; // @[datacache.py:27:DataCache.fir@7.4]
  wire [31:0] _T_12; // @[datacache.py:28:DataCache.fir@8.4]
  wire [15:0] _T_13; // @[datacache.py:32:DataCache.fir@9.4]
  wire [31:0] _T_14; // @[datacache.py:32:DataCache.fir@10.4]
  wire [7:0] _T_15; // @[datacache.py:33:DataCache.fir@11.4]
  wire [31:0] _T_16; // @[datacache.py:33:DataCache.fir@12.4]
  wire  _T_17; // @[mux.py:72:DataCache.fir@13.4]
  wire [31:0] _T_18; // @[datacache.py:33:DataCache.fir@14.4]
  wire  _T_19; // @[mux.py:72:DataCache.fir@15.4]
  wire [31:0] _T_20; // @[datacache.py:33:DataCache.fir@16.4]
  wire  _T_21; // @[mux.py:72:DataCache.fir@17.4]
  wire [31:0] _T_22; // @[datacache.py:33:DataCache.fir@18.4]
  wire [2:0] _T_23; // @[datacache.py:36:DataCache.fir@19.4]
  wire [15:0] _T_27; // @[datacache.py:38:DataCache.fir@23.4]
  wire [15:0] _T_29; // @[datacache.py:39:DataCache.fir@25.4]
  wire [15:0] _T_30; // @[datacache.py:39:DataCache.fir@26.4]
  wire [31:0] _GEN_18; // @[datacache.py:39:DataCache.fir@27.4]
  wire [46:0] _T_31; // @[datacache.py:39:DataCache.fir@27.4]
  wire [30:0] _GEN_19; // @[datacache.py:39:DataCache.fir@28.4]
  wire [46:0] _T_32; // @[datacache.py:39:DataCache.fir@28.4]
  wire [46:0] _T_33; // @[datacache.py:39:DataCache.fir@29.4]
  wire [7:0] _T_35; // @[datacache.py:40:DataCache.fir@31.4]
  wire [7:0] _T_37; // @[datacache.py:41:DataCache.fir@33.4]
  wire [7:0] _T_38; // @[datacache.py:41:DataCache.fir@34.4]
  wire [31:0] _GEN_20; // @[datacache.py:41:DataCache.fir@35.4]
  wire [38:0] _T_39; // @[datacache.py:41:DataCache.fir@35.4]
  wire [14:0] _GEN_21; // @[datacache.py:41:DataCache.fir@36.4]
  wire [38:0] _T_40; // @[datacache.py:41:DataCache.fir@36.4]
  wire [38:0] _T_41; // @[datacache.py:41:DataCache.fir@37.4]
  wire  _T_42; // @[mux.py:72:DataCache.fir@38.4]
  wire [38:0] _T_43; // @[datacache.py:41:DataCache.fir@39.4]
  wire  _T_44; // @[mux.py:72:DataCache.fir@40.4]
  wire [38:0] _T_45; // @[datacache.py:41:DataCache.fir@41.4]
  wire  _T_46; // @[mux.py:72:DataCache.fir@42.4]
  wire [46:0] _T_47; // @[datacache.py:41:DataCache.fir@43.4]
  wire  _T_48; // @[mux.py:72:DataCache.fir@44.4]
  wire [46:0] _T_49; // @[datacache.py:41:DataCache.fir@45.4]
  wire  _T_50; // @[mux.py:72:DataCache.fir@46.4]
  wire [46:0] _T_51; // @[datacache.py:41:DataCache.fir@47.4]
  wire [46:0] _T_57; // @[datacache.py:45:DataCache.fir@54.4]
  assign cache__T_24_addr = _T_12[4:0];
  assign cache__T_24_data = cache[cache__T_24_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_25_addr = _T_12[4:0];
  assign cache__T_25_data = cache[cache__T_25_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_26_addr = _T_12[4:0];
  assign cache__T_26_data = cache[cache__T_26_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_28_addr = _T_12[4:0];
  assign cache__T_28_data = cache[cache__T_28_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_34_addr = _T_12[4:0];
  assign cache__T_34_data = cache[cache__T_34_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_36_addr = _T_12[4:0];
  assign cache__T_36_data = cache[cache__T_36_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_54_addr = _T_12[4:0];
  assign cache__T_54_data = cache[cache__T_54_addr]; // @[datacache.py:27:DataCache.fir@7.4]
  assign cache__T_52_data = io_Mem_Write ? _T_22 : cache__T_54_data;
  assign cache__T_52_addr = _T_12[4:0];
  assign cache__T_52_mask = 1'h1;
  assign cache__T_52_en = 1'h1;
  assign _T_12 = io_addr / 32'h4; // @[datacache.py:28:DataCache.fir@8.4]
  assign _T_13 = io_write_data[15:0]; // @[datacache.py:32:DataCache.fir@9.4]
  assign _T_14 = {16'h0,_T_13}; // @[datacache.py:32:DataCache.fir@10.4]
  assign _T_15 = io_write_data[7:0]; // @[datacache.py:33:DataCache.fir@11.4]
  assign _T_16 = {24'h0,_T_15}; // @[datacache.py:33:DataCache.fir@12.4]
  assign _T_17 = io_Data_Size == 2'h2; // @[mux.py:72:DataCache.fir@13.4]
  assign _T_18 = _T_17 ? _T_16 : io_write_data; // @[datacache.py:33:DataCache.fir@14.4]
  assign _T_19 = io_Data_Size == 2'h1; // @[mux.py:72:DataCache.fir@15.4]
  assign _T_20 = _T_19 ? _T_14 : _T_18; // @[datacache.py:33:DataCache.fir@16.4]
  assign _T_21 = io_Data_Size == 2'h0; // @[mux.py:72:DataCache.fir@17.4]
  assign _T_22 = _T_21 ? io_write_data : _T_20; // @[datacache.py:33:DataCache.fir@18.4]
  assign _T_23 = {io_Data_Size,io_Load_Type}; // @[datacache.py:36:DataCache.fir@19.4]
  assign _T_27 = cache__T_26_data[15:0]; // @[datacache.py:38:DataCache.fir@23.4]
  assign _T_29 = cache__T_28_data[15:0]; // @[datacache.py:39:DataCache.fir@25.4]
  assign _T_30 = $signed(_T_29); // @[datacache.py:39:DataCache.fir@26.4]
  assign _GEN_18 = {$signed(_T_30), 16'h0}; // @[datacache.py:39:DataCache.fir@27.4]
  assign _T_31 = {{15{_GEN_18[31]}},_GEN_18}; // @[datacache.py:39:DataCache.fir@27.4]
  assign _GEN_19 = _T_31[46:16]; // @[datacache.py:39:DataCache.fir@28.4]
  assign _T_32 = {{16{_GEN_19[30]}},_GEN_19}; // @[datacache.py:39:DataCache.fir@28.4]
  assign _T_33 = $unsigned(_T_32); // @[datacache.py:39:DataCache.fir@29.4]
  assign _T_35 = cache__T_34_data[7:0]; // @[datacache.py:40:DataCache.fir@31.4]
  assign _T_37 = cache__T_36_data[7:0]; // @[datacache.py:41:DataCache.fir@33.4]
  assign _T_38 = $signed(_T_37); // @[datacache.py:41:DataCache.fir@34.4]
  assign _GEN_20 = {$signed(_T_38), 24'h0}; // @[datacache.py:41:DataCache.fir@35.4]
  assign _T_39 = {{7{_GEN_20[31]}},_GEN_20}; // @[datacache.py:41:DataCache.fir@35.4]
  assign _GEN_21 = _T_39[38:24]; // @[datacache.py:41:DataCache.fir@36.4]
  assign _T_40 = {{24{_GEN_21[14]}},_GEN_21}; // @[datacache.py:41:DataCache.fir@36.4]
  assign _T_41 = $unsigned(_T_40); // @[datacache.py:41:DataCache.fir@37.4]
  assign _T_42 = 3'h4 == _T_23; // @[mux.py:72:DataCache.fir@38.4]
  assign _T_43 = _T_42 ? _T_41 : {{7'd0}, cache__T_24_data}; // @[datacache.py:41:DataCache.fir@39.4]
  assign _T_44 = 3'h5 == _T_23; // @[mux.py:72:DataCache.fir@40.4]
  assign _T_45 = _T_44 ? {{31'd0}, _T_35} : _T_43; // @[datacache.py:41:DataCache.fir@41.4]
  assign _T_46 = 3'h2 == _T_23; // @[mux.py:72:DataCache.fir@42.4]
  assign _T_47 = _T_46 ? _T_33 : {{8'd0}, _T_45}; // @[datacache.py:41:DataCache.fir@43.4]
  assign _T_48 = 3'h3 == _T_23; // @[mux.py:72:DataCache.fir@44.4]
  assign _T_49 = _T_48 ? {{31'd0}, _T_27} : _T_47; // @[datacache.py:41:DataCache.fir@45.4]
  assign _T_50 = 3'h1 == _T_23; // @[mux.py:72:DataCache.fir@46.4]
  assign _T_51 = _T_50 ? {{15'd0}, cache__T_25_data} : _T_49; // @[datacache.py:41:DataCache.fir@47.4]
  assign _T_57 = io_Mem_Read ? _T_51 : 47'h0; // @[datacache.py:45:DataCache.fir@54.4]
  assign io_data_out = _T_57[31:0]; // @[datacache.py:45:DataCache.fir@55.4]
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    cache[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if(cache__T_52_en & cache__T_52_mask) begin
      cache[cache__T_52_addr] <= cache__T_52_data; // @[datacache.py:27:DataCache.fir@7.4]
    end
  end
endmodule
