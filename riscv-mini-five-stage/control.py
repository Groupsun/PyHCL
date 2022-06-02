"""Main control unit

Filename: control.py
Author: SunnyChen
"""
from config import *
from instructions import Inst

# Control signal decode map and default case

#                   Reg_Write       Imm_sel    ALU_Src       ALUOp          Branch       Branch_Src       Mem_Read          Mem_Write        Data_Size     Load_Type         Mem_to_Reg      Jump_Type
#                       |              |          |            |               |              |              |                 |                 |             |                 |               |
default       = [Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional]

decode_map    = {
    Inst.ADD  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SUB  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SUB   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.AND  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_AND   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.OR   : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_OR    ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.XOR  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_XOR   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],

    Inst.ADDI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.ANDI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_AND   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.ORI  : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_OR    ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.XORI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_XOR   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],

    Inst.SLL  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SRL  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SRA  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SRA   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],

    Inst.SLLI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SRLI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRL   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SRAI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SRA   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],

    Inst.SLT  : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLT   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SLTU : [Reg_Write_True ,   IMM_R ,   ALU_B_rs2,   ALU_SLTU  ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SLTI : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLT   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],
    Inst.SLTIU: [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_SLTU  ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ALU,   Conditional],

    Inst.LW   : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_W,   Load_Signed  ,   RegWrite_Mem,   Conditional],
    Inst.LH   : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_H,   Load_Signed  ,   RegWrite_Mem,   Conditional],
    Inst.LB   : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_B,   Load_Signed  ,   RegWrite_Mem,   Conditional],
    Inst.LHU  : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_H,   Load_Unsigned,   RegWrite_Mem,   Conditional],
    Inst.LBU  : [Reg_Write_True ,   IMM_I ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_True ,   Mem_Write_False,   Data_Size_B,   Load_Unsigned,   RegWrite_Mem,   Conditional],
    Inst.SW   : [Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_True ,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.SH   : [Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_True ,   Data_Size_H,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.SB   : [Reg_Write_False,   IMM_S ,   ALU_B_imm,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_True ,   Data_Size_B,   Load_XXX     ,   RegWrite_XXX,   Conditional],

    Inst.BEQ  : [Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BEQ   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.BNE  : [Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BNE   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.BLT  : [Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BLT   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.BGE  : [Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BGE   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.BLTU : [Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BLTU  ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],
    Inst.BGEU : [Reg_Write_False,   IMM_SB,   ALU_B_rs2,   ALU_BGEU  ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional],

    Inst.JAL  : [Reg_Write_True ,   IMM_UJ,   ALU_B_rs2,   ALU_ADD   ,   Branch_True ,   Branch_PC ,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_PC_4, NonConditional],
    Inst.JALR : [Reg_Write_True ,   IMM_I ,   ALU_B_rs2,   ALU_ADD   ,   Branch_True ,   Branch_Rs1,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_PC_4, NonConditional],

    Inst.LUI  : [Reg_Write_True ,   IMM_U ,   ALU_B_rs2,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_imm ,  Conditional],
    Inst.AUIPC: [Reg_Write_True ,   IMM_U ,   ALU_B_rs2,   ALU_ADD   ,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_ipc ,  Conditional],

    Inst.NOP  : [Reg_Write_False,   IMM_X ,   ALU_B_XXX,   ALU_OP_XXX,   Branch_False,   Branch_XXX,   Mem_Read_False,   Mem_Write_False,   Data_Size_W,   Load_XXX     ,   RegWrite_XXX,   Conditional]
}


class ControlSignals(Bundle):
    def __init__(self):
        super().__init__()
        self.Reg_Write = Output(UInt(REG_WRITE_SIG_WIDTH))
        self.Imm_Sel = Output(UInt(IMM_SEL_SIG_WIDTH))
        self.ALU_Src = Output(UInt(ALU_SRC_SIG_LEN))
        self.ALUOp = Output(UInt(ALUOP_SIG_LEN))
        self.Branch = Output(UInt(BRANCH_SIG_LEN))
        self.Branch_Src = Output(UInt(BRANCH_SRC_SIG_LEN))
        self.Mem_Read = Output(UInt(MEM_READ_SIG_LEN))
        self.Mem_Write = Output(UInt(MEM_WRITE_SIG_LEN))
        self.Data_Size = Output(UInt(DATA_SIZE_SIG_LEN))
        self.Load_Type = Output(UInt(LOAD_TYPE_SIG_LEN))
        self.Mem_to_Reg = Output(UInt(REG_SRC_SIG_LEN))
        self.Jump_Type = Output(UInt(JUMP_TYPE_SIG_LEN))


class Control_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.inst = Input(UInt(WLEN))
        self.ctrl = ControlSignals()


class Control(Module):
    def __init__(self):
        super().__init__()
        self.io = Control_IO().IO()

        ctrlsignals = ListLookup(self.io.inst, default, decode_map)

        # Control signals for ID stage
        self.io.ctrl.Imm_Sel <<= ctrlsignals[1]

        # Control signals for EX stage
        self.io.ctrl.ALU_Src <<= ctrlsignals[2]
        self.io.ctrl.ALUOp <<= ctrlsignals[3]
        self.io.ctrl.Branch <<= ctrlsignals[4]
        self.io.ctrl.Branch_Src <<= ctrlsignals[5]
        self.io.ctrl.Jump_Type <<= ctrlsignals[11]

        # Control signals for MEM stage
        self.io.ctrl.Mem_Read <<= ctrlsignals[6]
        self.io.ctrl.Mem_Write <<= ctrlsignals[7]
        self.io.ctrl.Data_Size <<= ctrlsignals[8]
        self.io.ctrl.Load_Type <<= ctrlsignals[9]

        # Control signals for WB stage
        self.io.ctrl.Reg_Write <<= ctrlsignals[0]
        self.io.ctrl.Mem_to_Reg <<= ctrlsignals[10]


if __name__ == '__main__':
    builder.emit(builder.elaborate(Control().gen()), "./firrtl/Control.fir")
    builder.dumpverilog("./firrtl/Control.fir", "./verilog/Control.v")
