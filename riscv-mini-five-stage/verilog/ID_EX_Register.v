module ID_EX_Register( // @[id_ex_register.py:40:ID_EX_Register.fir@2.2]
  input         clock, // @[rawmodule.py:100:ID_EX_Register.fir@3.4]
  input         reset, // @[rawmodule.py:101:ID_EX_Register.fir@4.4]
  input  [31:0] io_id_pc, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [31:0] io_id_pc_4, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [31:0] io_id_rs1_out, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [31:0] io_id_rs2_out, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [31:0] io_id_imm, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [31:0] io_id_inst, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [4:0]  io_id_rs1, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [4:0]  io_id_rs2, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [31:0] io_ex_pc, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [31:0] io_ex_pc_4, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [31:0] io_ex_rs1_out, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [31:0] io_ex_rs2_out, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [4:0]  io_ex_rd, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [31:0] io_ex_imm, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [4:0]  io_ex_rs1, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [4:0]  io_ex_rs2, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [31:0] io_ex_inst, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_ID_EX_Flush, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Reg_Write, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [2:0]  io_id_ctrl_in_Imm_Sel, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_ALU_Src, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [4:0]  io_id_ctrl_in_ALUOp, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Branch, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Branch_Src, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Mem_Read, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Mem_Write, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [1:0]  io_id_ctrl_in_Data_Size, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Load_Type, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input  [2:0]  io_id_ctrl_in_Mem_to_Reg, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  input         io_id_ctrl_in_Jump_Type, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Reg_Write, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [2:0]  io_ex_ctrl_out_Imm_Sel, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_ALU_Src, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [4:0]  io_ex_ctrl_out_ALUOp, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Branch, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Branch_Src, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Mem_Read, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Mem_Write, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [1:0]  io_ex_ctrl_out_Data_Size, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Load_Type, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output [2:0]  io_ex_ctrl_out_Mem_to_Reg, // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
  output        io_ex_ctrl_out_Jump_Type // @[id_ex_register.py:12:ID_EX_Register.fir@5.4]
);
  reg [31:0] pc; // @[id_ex_register.py:44:ID_EX_Register.fir@7.4]
  reg [31:0] _RAND_0;
  reg [31:0] pc_4; // @[id_ex_register.py:45:ID_EX_Register.fir@8.4]
  reg [31:0] _RAND_1;
  reg [31:0] rs1_out; // @[id_ex_register.py:46:ID_EX_Register.fir@9.4]
  reg [31:0] _RAND_2;
  reg [31:0] rs2_out; // @[id_ex_register.py:47:ID_EX_Register.fir@10.4]
  reg [31:0] _RAND_3;
  reg [31:0] imm; // @[id_ex_register.py:48:ID_EX_Register.fir@11.4]
  reg [31:0] _RAND_4;
  reg [31:0] inst; // @[id_ex_register.py:49:ID_EX_Register.fir@12.4]
  reg [31:0] _RAND_5;
  reg [4:0] rs1; // @[id_ex_register.py:50:ID_EX_Register.fir@13.4]
  reg [31:0] _RAND_6;
  reg [4:0] rs2; // @[id_ex_register.py:51:ID_EX_Register.fir@14.4]
  reg [31:0] _RAND_7;
  reg  alu_src; // @[id_ex_register.py:52:ID_EX_Register.fir@15.4]
  reg [31:0] _RAND_8;
  reg [4:0] aluop; // @[id_ex_register.py:53:ID_EX_Register.fir@16.4]
  reg [31:0] _RAND_9;
  reg  branch; // @[id_ex_register.py:54:ID_EX_Register.fir@17.4]
  reg [31:0] _RAND_10;
  reg  branch_src; // @[id_ex_register.py:55:ID_EX_Register.fir@18.4]
  reg [31:0] _RAND_11;
  reg  jump_type; // @[id_ex_register.py:56:ID_EX_Register.fir@19.4]
  reg [31:0] _RAND_12;
  reg  mem_read; // @[id_ex_register.py:57:ID_EX_Register.fir@20.4]
  reg [31:0] _RAND_13;
  reg  mem_write; // @[id_ex_register.py:58:ID_EX_Register.fir@21.4]
  reg [31:0] _RAND_14;
  reg [1:0] data_size; // @[id_ex_register.py:59:ID_EX_Register.fir@22.4]
  reg [31:0] _RAND_15;
  reg  load_type; // @[id_ex_register.py:60:ID_EX_Register.fir@23.4]
  reg [31:0] _RAND_16;
  reg  reg_write; // @[id_ex_register.py:61:ID_EX_Register.fir@24.4]
  reg [31:0] _RAND_17;
  reg [2:0] mem_to_reg; // @[id_ex_register.py:62:ID_EX_Register.fir@25.4]
  reg [31:0] _RAND_18;
  reg [2:0] imm_sel; // @[id_ex_register.py:63:ID_EX_Register.fir@26.4]
  reg [31:0] _RAND_19;
  assign io_ex_pc = pc; // @[id_ex_register.py:87:ID_EX_Register.fir@87.4]
  assign io_ex_pc_4 = pc_4; // @[id_ex_register.py:88:ID_EX_Register.fir@88.4]
  assign io_ex_rs1_out = rs1_out; // @[id_ex_register.py:89:ID_EX_Register.fir@89.4]
  assign io_ex_rs2_out = rs2_out; // @[id_ex_register.py:90:ID_EX_Register.fir@90.4]
  assign io_ex_rd = inst[11:7]; // @[id_ex_register.py:95:ID_EX_Register.fir@96.4]
  assign io_ex_imm = imm; // @[id_ex_register.py:93:ID_EX_Register.fir@93.4]
  assign io_ex_rs1 = rs1; // @[id_ex_register.py:91:ID_EX_Register.fir@91.4]
  assign io_ex_rs2 = rs2; // @[id_ex_register.py:92:ID_EX_Register.fir@92.4]
  assign io_ex_inst = inst; // @[id_ex_register.py:94:ID_EX_Register.fir@94.4]
  assign io_ex_ctrl_out_Reg_Write = reg_write; // @[id_ex_register.py:104:ID_EX_Register.fir@104.4]
  assign io_ex_ctrl_out_Imm_Sel = imm_sel; // @[id_ex_register.py:108:ID_EX_Register.fir@108.4]
  assign io_ex_ctrl_out_ALU_Src = alu_src; // @[id_ex_register.py:97:ID_EX_Register.fir@97.4]
  assign io_ex_ctrl_out_ALUOp = aluop; // @[id_ex_register.py:98:ID_EX_Register.fir@98.4]
  assign io_ex_ctrl_out_Branch = branch; // @[id_ex_register.py:99:ID_EX_Register.fir@99.4]
  assign io_ex_ctrl_out_Branch_Src = branch_src; // @[id_ex_register.py:100:ID_EX_Register.fir@100.4]
  assign io_ex_ctrl_out_Mem_Read = mem_read; // @[id_ex_register.py:102:ID_EX_Register.fir@102.4]
  assign io_ex_ctrl_out_Mem_Write = mem_write; // @[id_ex_register.py:103:ID_EX_Register.fir@103.4]
  assign io_ex_ctrl_out_Data_Size = data_size; // @[id_ex_register.py:106:ID_EX_Register.fir@106.4]
  assign io_ex_ctrl_out_Load_Type = load_type; // @[id_ex_register.py:107:ID_EX_Register.fir@107.4]
  assign io_ex_ctrl_out_Mem_to_Reg = mem_to_reg; // @[id_ex_register.py:105:ID_EX_Register.fir@105.4]
  assign io_ex_ctrl_out_Jump_Type = jump_type; // @[id_ex_register.py:101:ID_EX_Register.fir@101.4]
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
  pc = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  pc_4 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rs1_out = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rs2_out = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  imm = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  inst = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rs1 = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  rs2 = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  alu_src = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  aluop = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  branch = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  branch_src = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  jump_type = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mem_read = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  mem_write = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  data_size = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  load_type = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  reg_write = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  mem_to_reg = _RAND_18[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  imm_sel = _RAND_19[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        pc <= 32'h0;
      end else begin
        pc <= io_id_pc;
      end
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        pc_4 <= 32'h0;
      end else begin
        pc_4 <= io_id_pc_4;
      end
    end
    if (reset) begin
      rs1_out <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs1_out <= 32'h0;
      end else begin
        rs1_out <= io_id_rs1_out;
      end
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs2_out <= 32'h0;
      end else begin
        rs2_out <= io_id_rs2_out;
      end
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        imm <= 32'h0;
      end else begin
        imm <= io_id_imm;
      end
    end
    if (reset) begin
      inst <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        inst <= 32'h0;
      end else begin
        inst <= io_id_inst;
      end
    end
    if (reset) begin
      rs1 <= 5'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs1 <= 5'h0;
      end else begin
        rs1 <= io_id_rs1;
      end
    end
    if (reset) begin
      rs2 <= 5'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs2 <= 5'h0;
      end else begin
        rs2 <= io_id_rs2;
      end
    end
    if (reset) begin
      alu_src <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        alu_src <= 1'h0;
      end else begin
        alu_src <= io_id_ctrl_in_ALU_Src;
      end
    end
    if (reset) begin
      aluop <= 5'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        aluop <= 5'h0;
      end else begin
        aluop <= io_id_ctrl_in_ALUOp;
      end
    end
    if (reset) begin
      branch <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        branch <= 1'h0;
      end else begin
        branch <= io_id_ctrl_in_Branch;
      end
    end
    if (reset) begin
      branch_src <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        branch_src <= 1'h0;
      end else begin
        branch_src <= io_id_ctrl_in_Branch_Src;
      end
    end
    if (reset) begin
      jump_type <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        jump_type <= 1'h0;
      end else begin
        jump_type <= io_id_ctrl_in_Jump_Type;
      end
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        mem_read <= 1'h0;
      end else begin
        mem_read <= io_id_ctrl_in_Mem_Read;
      end
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        mem_write <= 1'h0;
      end else begin
        mem_write <= io_id_ctrl_in_Mem_Write;
      end
    end
    if (reset) begin
      data_size <= 2'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        data_size <= 2'h0;
      end else begin
        data_size <= io_id_ctrl_in_Data_Size;
      end
    end
    if (reset) begin
      load_type <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        load_type <= 1'h0;
      end else begin
        load_type <= io_id_ctrl_in_Load_Type;
      end
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        reg_write <= 1'h0;
      end else begin
        reg_write <= io_id_ctrl_in_Reg_Write;
      end
    end
    if (reset) begin
      mem_to_reg <= 3'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        mem_to_reg <= 3'h0;
      end else begin
        mem_to_reg <= io_id_ctrl_in_Mem_to_Reg;
      end
    end
    if (reset) begin
      imm_sel <= 3'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        imm_sel <= 3'h0;
      end else begin
        imm_sel <= io_id_ctrl_in_Imm_Sel;
      end
    end
  end
endmodule
