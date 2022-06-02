module IF_ID_Register( // @[if_id_register.py:28:IF_ID_Register.fir@2.2]
  input         clock, // @[rawmodule.py:100:IF_ID_Register.fir@3.4]
  input         reset, // @[rawmodule.py:101:IF_ID_Register.fir@4.4]
  input  [31:0] io_if_pc, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  input  [31:0] io_if_pc_4, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  input  [31:0] io_if_inst, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  output [31:0] io_id_pc, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  output [31:0] io_id_pc_4, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  output [4:0]  io_id_rs1, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  output [4:0]  io_id_rs2, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  output [31:0] io_id_inst, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  input         io_IF_ID_Write, // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
  input         io_IF_ID_Flush // @[if_id_register.py:11:IF_ID_Register.fir@5.4]
);
  reg [31:0] pc; // @[if_id_register.py:31:IF_ID_Register.fir@7.4]
  reg [31:0] _RAND_0;
  reg [31:0] pc_4; // @[if_id_register.py:32:IF_ID_Register.fir@8.4]
  reg [31:0] _RAND_1;
  reg [31:0] inst; // @[if_id_register.py:33:IF_ID_Register.fir@9.4]
  reg [31:0] _RAND_2;
  assign io_id_pc = pc; // @[if_id_register.py:42:IF_ID_Register.fir@25.4]
  assign io_id_pc_4 = pc_4; // @[if_id_register.py:43:IF_ID_Register.fir@26.4]
  assign io_id_rs1 = inst[19:15]; // @[if_id_register.py:45:IF_ID_Register.fir@29.4]
  assign io_id_rs2 = inst[24:20]; // @[if_id_register.py:46:IF_ID_Register.fir@31.4]
  assign io_id_inst = inst; // @[if_id_register.py:44:IF_ID_Register.fir@27.4]
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
  inst = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else begin
      if (io_IF_ID_Flush) begin
        pc <= 32'h0;
      end else begin
        if (io_IF_ID_Write) begin
          pc <= io_if_pc;
        end
      end
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      if (io_IF_ID_Flush) begin
        pc_4 <= 32'h0;
      end else begin
        if (io_IF_ID_Write) begin
          pc_4 <= io_if_pc_4;
        end
      end
    end
    if (reset) begin
      inst <= 32'h0;
    end else begin
      if (io_IF_ID_Flush) begin
        inst <= 32'h0;
      end else begin
        if (io_IF_ID_Write) begin
          inst <= io_if_inst;
        end
      end
    end
  end
endmodule
