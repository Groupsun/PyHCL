module EX_MEM_Register( // @[ex_mem_register.py:46:EX_MEM_Register.fir@2.2]
  input         clock, // @[rawmodule.py:100:EX_MEM_Register.fir@3.4]
  input         reset, // @[rawmodule.py:101:EX_MEM_Register.fir@4.4]
  input  [31:0] io_ex_alu_sum, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [31:0] io_ex_rs2_out, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [4:0]  io_ex_rd, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [31:0] io_ex_pc_4, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [31:0] io_ex_imm, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [31:0] io_ex_aui_pc, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [31:0] io_ex_rs2, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input         io_ex_Mem_Read, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input         io_ex_Mem_Write, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [1:0]  io_ex_Data_Size, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input         io_ex_Load_Type, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input         io_ex_Reg_Write, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  input  [2:0]  io_ex_Mem_to_Reg, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output        io_mem_Mem_Read, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output        io_mem_Mem_Write, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [1:0]  io_mem_Data_Size, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output        io_mem_Load_Type, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output        io_mem_Reg_Write, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [2:0]  io_mem_Mem_to_Reg, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [31:0] io_mem_alu_sum, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [31:0] io_mem_rs2_out, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [4:0]  io_mem_rd, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [31:0] io_mem_pc_4, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [31:0] io_mem_imm, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [31:0] io_mem_aui_pc, // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
  output [31:0] io_mem_rs2 // @[ex_mem_register.py:11:EX_MEM_Register.fir@5.4]
);
  reg [31:0] alu_sum; // @[ex_mem_register.py:49:EX_MEM_Register.fir@7.4]
  reg [31:0] _RAND_0;
  reg [31:0] rs2_out; // @[ex_mem_register.py:50:EX_MEM_Register.fir@8.4]
  reg [31:0] _RAND_1;
  reg [4:0] rd; // @[ex_mem_register.py:51:EX_MEM_Register.fir@9.4]
  reg [31:0] _RAND_2;
  reg [31:0] pc_4; // @[ex_mem_register.py:52:EX_MEM_Register.fir@10.4]
  reg [31:0] _RAND_3;
  reg [31:0] imm; // @[ex_mem_register.py:53:EX_MEM_Register.fir@11.4]
  reg [31:0] _RAND_4;
  reg [31:0] aui_pc; // @[ex_mem_register.py:54:EX_MEM_Register.fir@12.4]
  reg [31:0] _RAND_5;
  reg [4:0] rs2; // @[ex_mem_register.py:55:EX_MEM_Register.fir@13.4]
  reg [31:0] _RAND_6;
  reg  mem_read; // @[ex_mem_register.py:57:EX_MEM_Register.fir@14.4]
  reg [31:0] _RAND_7;
  reg  mem_write; // @[ex_mem_register.py:58:EX_MEM_Register.fir@15.4]
  reg [31:0] _RAND_8;
  reg [1:0] data_size; // @[ex_mem_register.py:59:EX_MEM_Register.fir@16.4]
  reg [31:0] _RAND_9;
  reg  load_type; // @[ex_mem_register.py:60:EX_MEM_Register.fir@17.4]
  reg [31:0] _RAND_10;
  reg  reg_write; // @[ex_mem_register.py:61:EX_MEM_Register.fir@18.4]
  reg [31:0] _RAND_11;
  reg [2:0] mem_to_reg; // @[ex_mem_register.py:62:EX_MEM_Register.fir@19.4]
  reg [31:0] _RAND_12;
  assign io_mem_Mem_Read = mem_read; // @[ex_mem_register.py:85:EX_MEM_Register.fir@40.4]
  assign io_mem_Mem_Write = mem_write; // @[ex_mem_register.py:86:EX_MEM_Register.fir@41.4]
  assign io_mem_Data_Size = data_size; // @[ex_mem_register.py:87:EX_MEM_Register.fir@42.4]
  assign io_mem_Load_Type = load_type; // @[ex_mem_register.py:88:EX_MEM_Register.fir@43.4]
  assign io_mem_Reg_Write = reg_write; // @[ex_mem_register.py:89:EX_MEM_Register.fir@44.4]
  assign io_mem_Mem_to_Reg = mem_to_reg; // @[ex_mem_register.py:90:EX_MEM_Register.fir@45.4]
  assign io_mem_alu_sum = alu_sum; // @[ex_mem_register.py:78:EX_MEM_Register.fir@33.4]
  assign io_mem_rs2_out = rs2_out; // @[ex_mem_register.py:79:EX_MEM_Register.fir@34.4]
  assign io_mem_rd = rd; // @[ex_mem_register.py:80:EX_MEM_Register.fir@35.4]
  assign io_mem_pc_4 = pc_4; // @[ex_mem_register.py:81:EX_MEM_Register.fir@36.4]
  assign io_mem_imm = imm; // @[ex_mem_register.py:82:EX_MEM_Register.fir@37.4]
  assign io_mem_aui_pc = aui_pc; // @[ex_mem_register.py:83:EX_MEM_Register.fir@38.4]
  assign io_mem_rs2 = {{27'd0}, rs2}; // @[ex_mem_register.py:84:EX_MEM_Register.fir@39.4]
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
  alu_sum = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rs2_out = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rd = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  pc_4 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  imm = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  aui_pc = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rs2 = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_read = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mem_write = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  data_size = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  load_type = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  reg_write = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  mem_to_reg = _RAND_12[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_ex_alu_sum;
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      rs2_out <= io_ex_rs2_out;
    end
    if (reset) begin
      rd <= 5'h0;
    end else begin
      rd <= io_ex_rd;
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      pc_4 <= io_ex_pc_4;
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      imm <= io_ex_imm;
    end
    if (reset) begin
      aui_pc <= 32'h0;
    end else begin
      aui_pc <= io_ex_aui_pc;
    end
    if (reset) begin
      rs2 <= 5'h0;
    end else begin
      rs2 <= io_ex_rs2[4:0];
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      mem_read <= io_ex_Mem_Read;
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      mem_write <= io_ex_Mem_Write;
    end
    if (reset) begin
      data_size <= 2'h0;
    end else begin
      data_size <= io_ex_Data_Size;
    end
    if (reset) begin
      load_type <= 1'h0;
    end else begin
      load_type <= io_ex_Load_Type;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_ex_Reg_Write;
    end
    if (reset) begin
      mem_to_reg <= 3'h0;
    end else begin
      mem_to_reg <= io_ex_Mem_to_Reg;
    end
  end
endmodule
