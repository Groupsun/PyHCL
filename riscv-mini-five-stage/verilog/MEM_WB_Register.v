module MEM_WB_Register( // @[mem_wb_register.py:35:MEM_WB_Register.fir@2.2]
  input         clock, // @[rawmodule.py:100:MEM_WB_Register.fir@3.4]
  input         reset, // @[rawmodule.py:101:MEM_WB_Register.fir@4.4]
  input  [31:0] io_mem_dataout, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input  [31:0] io_mem_alu_sum, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input  [4:0]  io_mem_rd, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input  [31:0] io_mem_pc_4, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input  [31:0] io_mem_imm, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input  [31:0] io_mem_aui_pc, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input  [2:0]  io_mem_Mem_to_Reg, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  input         io_mem_Reg_Write, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [2:0]  io_wb_Mem_to_Reg, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output        io_wb_Reg_Write, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [31:0] io_wb_dataout, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [31:0] io_wb_alu_sum, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [4:0]  io_wb_rd, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [31:0] io_wb_pc_4, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [31:0] io_wb_imm, // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
  output [31:0] io_wb_aui_pc // @[mem_wb_register.py:11:MEM_WB_Register.fir@5.4]
);
  reg [31:0] dataout; // @[mem_wb_register.py:38:MEM_WB_Register.fir@7.4]
  reg [31:0] _RAND_0;
  reg [31:0] alu_sum; // @[mem_wb_register.py:39:MEM_WB_Register.fir@8.4]
  reg [31:0] _RAND_1;
  reg [4:0] rd; // @[mem_wb_register.py:40:MEM_WB_Register.fir@9.4]
  reg [31:0] _RAND_2;
  reg [31:0] pc_4; // @[mem_wb_register.py:41:MEM_WB_Register.fir@10.4]
  reg [31:0] _RAND_3;
  reg [31:0] imm; // @[mem_wb_register.py:42:MEM_WB_Register.fir@11.4]
  reg [31:0] _RAND_4;
  reg [31:0] aui_pc; // @[mem_wb_register.py:43:MEM_WB_Register.fir@12.4]
  reg [31:0] _RAND_5;
  reg [2:0] mem_to_reg; // @[mem_wb_register.py:44:MEM_WB_Register.fir@13.4]
  reg [31:0] _RAND_6;
  reg  reg_write; // @[mem_wb_register.py:45:MEM_WB_Register.fir@14.4]
  reg [31:0] _RAND_7;
  assign io_wb_Mem_to_Reg = mem_to_reg; // @[mem_wb_register.py:56:MEM_WB_Register.fir@23.4]
  assign io_wb_Reg_Write = reg_write; // @[mem_wb_register.py:57:MEM_WB_Register.fir@24.4]
  assign io_wb_dataout = dataout; // @[mem_wb_register.py:58:MEM_WB_Register.fir@25.4]
  assign io_wb_alu_sum = alu_sum; // @[mem_wb_register.py:59:MEM_WB_Register.fir@26.4]
  assign io_wb_rd = rd; // @[mem_wb_register.py:60:MEM_WB_Register.fir@27.4]
  assign io_wb_pc_4 = pc_4; // @[mem_wb_register.py:61:MEM_WB_Register.fir@28.4]
  assign io_wb_imm = imm; // @[mem_wb_register.py:62:MEM_WB_Register.fir@29.4]
  assign io_wb_aui_pc = aui_pc; // @[mem_wb_register.py:63:MEM_WB_Register.fir@30.4]
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
  dataout = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  alu_sum = _RAND_1[31:0];
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
  mem_to_reg = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_write = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      dataout <= 32'h0;
    end else begin
      dataout <= io_mem_dataout;
    end
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_mem_alu_sum;
    end
    if (reset) begin
      rd <= 5'h0;
    end else begin
      rd <= io_mem_rd;
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      pc_4 <= io_mem_pc_4;
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      imm <= io_mem_imm;
    end
    if (reset) begin
      aui_pc <= 32'h0;
    end else begin
      aui_pc <= io_mem_aui_pc;
    end
    if (reset) begin
      mem_to_reg <= 3'h0;
    end else begin
      mem_to_reg <= io_mem_Mem_to_Reg;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_mem_Reg_Write;
    end
  end
endmodule
