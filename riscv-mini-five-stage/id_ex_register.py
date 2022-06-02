"""ID/EX pipeline register

Filename: id_ex_register.py
Author: SunnyChen
"""
from config import *
from control import ControlSignals


class ID_EX_Register_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.id_pc = Input(UInt(WLEN))
        self.id_pc_4 = Input(UInt(WLEN))
        self.id_rs1_out = Input(UInt(WLEN))
        self.id_rs2_out = Input(UInt(WLEN))
        self.id_imm = Input(UInt(WLEN))
        self.id_inst = Input(UInt(WLEN))
        self.id_rs1 = Input(UInt(RLEN))
        self.id_rs2 = Input(UInt(RLEN))

        self.ex_pc = Output(UInt(WLEN))
        self.ex_pc_4 = Output(UInt(WLEN))
        self.ex_rs1_out = Output(UInt(WLEN))
        self.ex_rs2_out = Output(UInt(WLEN))
        self.ex_rd = Output(UInt(RLEN))
        self.ex_imm = Output(UInt(WLEN))
        self.ex_rs1 = Output(UInt(RLEN))
        self.ex_rs2 = Output(UInt(RLEN))
        self.ex_inst = Output(UInt(WLEN))

        self.ID_EX_Flush = Input(UInt(ID_EX_FLUSH_SIG_LEN))

        self.id_ctrl_in = ControlSignals().flip()
        self.ex_ctrl_out = ControlSignals()


class ID_EX_Register(Module):
    def __init__(self):
        super().__init__()
        self.io = ID_EX_Register_IO().IO()

        # Initial registers
        self.pc          = RegInit(0, UInt(WLEN))
        self.pc_4        = RegInit(0, UInt(WLEN))
        self.rs1_out     = RegInit(0, UInt(WLEN))
        self.rs2_out     = RegInit(0, UInt(WLEN))
        self.imm         = RegInit(0, UInt(WLEN))
        self.inst        = RegInit(0, UInt(WLEN))
        self.rs1         = RegInit(0, UInt(RLEN))
        self.rs2         = RegInit(0, UInt(RLEN))
        self.alu_src     = RegInit(0, UInt(ALU_SRC_SIG_LEN))
        self.aluop       = RegInit(0, UInt(ALUOP_SIG_LEN))
        self.branch      = RegInit(0, UInt(BRANCH_SIG_LEN))
        self.branch_src  = RegInit(0, UInt(BRANCH_SRC_SIG_LEN))
        self.jump_type   = RegInit(0, UInt(JUMP_TYPE_SIG_LEN))
        self.mem_read    = RegInit(0, UInt(MEM_READ_SIG_LEN))
        self.mem_write   = RegInit(0, UInt(MEM_WRITE_SIG_LEN))
        self.data_size   = RegInit(0, UInt(DATA_SIZE_SIG_LEN))
        self.load_type   = RegInit(0, UInt(LOAD_TYPE_SIG_LEN))
        self.reg_write   = RegInit(0, UInt(REG_WRITE_SIG_WIDTH))
        self.mem_to_reg  = RegInit(0, UInt(REG_SRC_SIG_LEN))
        self.imm_sel     = RegInit(0, UInt(IMM_SEL_SIG_WIDTH))

        # apply registers
        self.pc                <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_pc)
        self.pc_4              <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_pc_4)
        self.rs1_out           <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_rs1_out)
        self.rs2_out           <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_rs2_out)
        self.imm               <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_imm)
        self.inst              <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_inst)
        self.rs1               <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_rs1)
        self.rs2               <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_rs2)
        self.alu_src           <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.ALU_Src)
        self.aluop             <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.ALUOp)
        self.branch            <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Branch)
        self.branch_src        <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Branch_Src)
        self.jump_type         <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Jump_Type)
        self.mem_read          <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Mem_Read)
        self.mem_write         <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Mem_Write)
        self.data_size         <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Data_Size)
        self.load_type         <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Load_Type)
        self.reg_write         <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Reg_Write)
        self.mem_to_reg        <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Mem_to_Reg)
        self.imm_sel           <<= Mux(self.io.ID_EX_Flush.to_bool(), U(0), self.io.id_ctrl_in.Imm_Sel)

        self.io.ex_pc <<= self.pc
        self.io.ex_pc_4 <<= self.pc_4
        self.io.ex_rs1_out <<= self.rs1_out
        self.io.ex_rs2_out <<= self.rs2_out
        self.io.ex_rs1 <<= self.rs1
        self.io.ex_rs2 <<= self.rs2
        self.io.ex_imm <<= self.imm
        self.io.ex_inst <<= self.inst
        self.io.ex_rd <<= self.inst[11:7]

        self.io.ex_ctrl_out.ALU_Src <<= self.alu_src
        self.io.ex_ctrl_out.ALUOp <<= self.aluop
        self.io.ex_ctrl_out.Branch <<= self.branch
        self.io.ex_ctrl_out.Branch_Src <<= self.branch_src
        self.io.ex_ctrl_out.Jump_Type <<= self.jump_type
        self.io.ex_ctrl_out.Mem_Read <<= self.mem_read
        self.io.ex_ctrl_out.Mem_Write <<= self.mem_write
        self.io.ex_ctrl_out.Reg_Write <<= self.reg_write
        self.io.ex_ctrl_out.Mem_to_Reg <<= self.mem_to_reg
        self.io.ex_ctrl_out.Data_Size <<= self.data_size
        self.io.ex_ctrl_out.Load_Type <<= self.load_type
        self.io.ex_ctrl_out.Imm_Sel <<= self.imm_sel


if __name__ == '__main__':
    builder.emit(builder.elaborate(ID_EX_Register().gen()), "./firrtl/ID_EX_Register.fir")
    builder.dumpverilog("./firrtl/ID_EX_Register.fir", "./verilog/ID_EX_Register.v")
