"""Processor's datapath

Filename: datapath.py
Author: SunnyChen
"""
from config import *
from control import ControlSignals


class IF_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.if_pc = Input(UInt(WLEN))
        self.PC_Sel = Input(UInt(PC_SEL_SIG_WIDTH))
        self.new_addr = Input(UInt(WLEN))
        self.pc_recover = Input(UInt(WLEN))

        self.if_new_pc = Output(UInt(WLEN))
        self.if_pc_4 = Output(UInt(WLEN))


class ID_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.Bubble = Input(UInt(BUBBLE_SIG_LEN))
        self.ctrl_in = ControlSignals().flip()
        self.ctrl_out = ControlSignals()


class EX_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.ex_rs1_out = Input(UInt(WLEN))
        self.ex_rs2_out = Input(UInt(WLEN))
        self.ex_imm = Input(UInt(WLEN))
        self.ex_pc = Input(UInt(WLEN))
        self.ex_ALU_Src = Input(UInt(ALU_SRC_SIG_LEN))
        self.ex_Branch = Input(UInt(BRANCH_SRC_SIG_LEN))
        self.ex_alu_conflag = Input(UInt(CONFLAG_SIG_LEN))
        self.ex_Branch_Src = Input(UInt(BRANCH_SRC_SIG_LEN))
        self.ex_Jump_Type = Input(UInt(JUMP_TYPE_SIG_LEN))
        self.ex_Imm_Sel = Input(UInt(IMM_SEL_SIG_WIDTH))

        self.Forward_A = Input(UInt(FORWARD_A_SIG_LEN))
        self.Forward_B = Input(UInt(FORWARD_B_SIG_LEN))

        self.alu_a_src = Output(UInt(WLEN))
        self.alu_b_src = Output(UInt(WLEN))
        self.ex_aui_pc = Output(UInt(WLEN))
        self.forward_rs2_out = Output(UInt(WLEN))

        self.PC_Src = Output(UInt(PC_SRC_SIG_LEN))
        self.branch_addr = Output(UInt(WLEN))


class MEM_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.mem_rs2_out = Input(UInt(WLEN))
        self.MemWrite_Src = Input(UInt(MEMWRITE_SRC_SIG_LEN))
        self.mem_Mem_to_Reg = Input(UInt(REG_SRC_SIG_LEN))
        self.mem_alu_sum = Input(UInt(WLEN))
        self.mem_pc_4 = Input(UInt(WLEN))
        self.mem_imm = Input(UInt(WLEN))
        self.mem_aui_pc = Input(UInt(WLEN))

        self.mem_writedata = Output(UInt(WLEN))


class WB_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.wb_alu_sum = Input(UInt(WLEN))
        self.wb_dataout = Input(UInt(WLEN))
        self.wb_pc_4 = Input(UInt(WLEN))
        self.wb_imm = Input(UInt(WLEN))
        self.wb_aui_pc = Input(UInt(WLEN))
        self.wb_Mem_to_Reg = Input(UInt(REG_SRC_SIG_LEN))
        self.wb_reg_writedata = Output(UInt(WLEN))


class Datapath_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.if_io = IF_IO()
        self.id_io = ID_IO()
        self.ex_io = EX_IO()
        self.mem_io = MEM_IO()
        self.wb_io = WB_IO()


class Datapath(Module):
    def __init__(self):
        super().__init__()
        self.io = Datapath_IO().IO()

        # ------------------------------------------------------------------------- #
        # IF Stage
        # ------------------------------------------------------------------------- #

        # Generate increment PC
        # Condition: is JALR
        is_JALR = (self.io.ex_io.ex_Imm_Sel == IMM_I) & (self.io.ex_io.ex_Jump_Type == NonConditional)

        PC_4 = self.io.if_io.if_pc + U(4)
        self.io.if_io.if_pc_4 <<= PC_4

        shift_imm = Mux(is_JALR, self.io.ex_io.ex_imm, self.io.ex_io.ex_imm << U(1))
        ex_branch_addr = Mux(self.io.ex_io.ex_Branch_Src.to_bool(), self.io.ex_io.alu_a_src, self.io.ex_io.ex_pc) \
                         + shift_imm.asuint()
        self.io.ex_io.ex_aui_pc <<= Mux(self.io.ex_io.ex_Branch_Src.to_bool(),
                                        self.io.ex_io.alu_a_src, self.io.ex_io.ex_pc) + self.io.ex_io.ex_imm
        self.io.ex_io.branch_addr <<= ex_branch_addr

        # Next PC
        PC_Src = Mux(self.io.ex_io.ex_Jump_Type.to_bool(), U(1), self.io.ex_io.ex_alu_conflag).to_bool() \
                 & self.io.ex_io.ex_Branch.to_bool()
        self.io.ex_io.PC_Src <<= PC_Src

        self.io.if_io.if_new_pc <<= MuxLookUp(self.io.if_io.PC_Sel, U(0), {
            PC_Sel_pc_4: PC_4,
            PC_Sel_new_addr: self.io.if_io.new_addr,
            PC_Sel_pc_recover: self.io.if_io.pc_recover
        })

        # ------------------------------------------------------------------------- #
        # ID Stage
        # ------------------------------------------------------------------------- #

        # These code should work when a bundle is flip from other bundle
        ctrlsignal_list = filter(lambda x: not x.startswith("_") and not x.startswith("__"),
                                 list([k for k in self.io.id_io.ctrl_out.__dict__]))
        for k in ctrlsignal_list:
            self.io.id_io.ctrl_out.__dict__[k] <<= Mux(self.io.id_io.Bubble.to_bool(), U(0),
                                                       self.io.id_io.ctrl_in.__dict__[k])

        # ------------------------------------------------------------------------- #
        # EX Stage
        # ------------------------------------------------------------------------- #

        # Forward unit
        mem_forward_value = MuxLookUp(self.io.mem_io.mem_Mem_to_Reg, RegWrite_XXX, {
            RegWrite_ALU: self.io.mem_io.mem_alu_sum,
            RegWrite_PC_4: self.io.mem_io.mem_pc_4,
            RegWrite_imm: self.io.mem_io.mem_imm,
            RegWrite_ipc: self.io.mem_io.mem_aui_pc
        })

        self.io.ex_io.alu_a_src <<= MuxLookUp(self.io.ex_io.Forward_A, self.io.ex_io.ex_rs1_out, {
            Forward_A_rs1: self.io.ex_io.ex_rs1_out,
            Forward_A_mem_wb_rd: self.io.wb_io.wb_reg_writedata,
            Forward_A_ex_mem_rd: mem_forward_value
        })

        operand_b = MuxLookUp(self.io.ex_io.Forward_B, self.io.ex_io.ex_rs2_out, {
            Forward_B_rs1: self.io.ex_io.ex_rs2_out,
            Forward_B_mem_wb_rd: self.io.wb_io.wb_reg_writedata,
            Forward_B_ex_mem_rd: mem_forward_value
        })

        # Select ALU operand B source
        self.io.ex_io.alu_b_src <<= Mux(self.io.ex_io.ex_ALU_Src.to_bool(), self.io.ex_io.ex_imm, operand_b)
        self.io.ex_io.forward_rs2_out <<= operand_b

        # ------------------------------------------------------------------------- #
        # MEM Stage
        # ------------------------------------------------------------------------- #
        self.io.mem_io.mem_writedata <<= Mux(self.io.mem_io.MemWrite_Src.to_bool(), self.io.wb_io.wb_reg_writedata,
                                             self.io.mem_io.mem_rs2_out)

        # ------------------------------------------------------------------------- #
        # WB Stage
        # ------------------------------------------------------------------------- #
        self.io.wb_io.wb_reg_writedata <<= MuxLookUp(
            self.io.wb_io.wb_Mem_to_Reg, self.io.wb_io.wb_alu_sum, {
                RegWrite_ALU: self.io.wb_io.wb_alu_sum,
                RegWrite_Mem: self.io.wb_io.wb_dataout,
                RegWrite_PC_4: self.io.wb_io.wb_pc_4,
                RegWrite_imm: self.io.wb_io.wb_imm,
                RegWrite_ipc: self.io.wb_io.wb_aui_pc
            }
        )


if __name__ == '__main__':
    builder.emit(builder.elaborate(Datapath().gen()), "./firrtl/datapath.fir")
    builder.dumpverilog("./firrtl/datapath.fir", "./verilog/datapath.v")
