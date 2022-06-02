"""MEM/WB pipeline register

Filename: mem_wb_register.py
Author: SunnyChen
"""
from config import *


class MEM_WB_Register_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.mem_dataout = Input(UInt(WLEN))
        self.mem_alu_sum = Input(UInt(WLEN))
        self.mem_rd = Input(UInt(RLEN))
        self.mem_pc_4 = Input(UInt(WLEN))
        self.mem_imm = Input(UInt(WLEN))
        self.mem_aui_pc = Input(UInt(WLEN))

        self.mem_Mem_to_Reg = Input(UInt(REG_SRC_SIG_LEN))
        self.mem_Reg_Write = Input(UInt(REG_WRITE_SIG_WIDTH))

        self.wb_Mem_to_Reg = Output(UInt(REG_SRC_SIG_LEN))
        self.wb_Reg_Write = Output(UInt(REG_WRITE_SIG_WIDTH))

        self.wb_dataout = Output(UInt(WLEN))
        self.wb_alu_sum = Output(UInt(WLEN))
        self.wb_rd = Output(UInt(RLEN))
        self.wb_pc_4 = Output(UInt(WLEN))
        self.wb_imm = Output(UInt(WLEN))
        self.wb_aui_pc = Output(UInt(WLEN))


class MEM_WB_Register(Module):
    def __init__(self):
        super().__init__()
        self.io = MEM_WB_Register_IO().IO()

        self.dataout = RegInit(0, UInt(WLEN))
        self.alu_sum = RegInit(0, UInt(WLEN))
        self.rd = RegInit(0, UInt(RLEN))
        self.pc_4 = RegInit(0, UInt(WLEN))
        self.imm = RegInit(0, UInt(WLEN))
        self.aui_pc = RegInit(0, UInt(WLEN))
        self.mem_to_reg = RegInit(0, UInt(REG_SRC_SIG_LEN))
        self.reg_write = RegInit(0, UInt(REG_WRITE_SIG_WIDTH))

        self.dataout     <<= self.io.mem_dataout
        self.alu_sum     <<= self.io.mem_alu_sum
        self.rd          <<= self.io.mem_rd
        self.pc_4        <<= self.io.mem_pc_4
        self.imm         <<= self.io.mem_imm
        self.aui_pc      <<= self.io.mem_aui_pc
        self.mem_to_reg  <<= self.io.mem_Mem_to_Reg
        self.reg_write   <<= self.io.mem_Reg_Write
        
        self.io.wb_Mem_to_Reg  <<= self.mem_to_reg
        self.io.wb_Reg_Write   <<= self.reg_write
        self.io.wb_dataout     <<= self.dataout
        self.io.wb_alu_sum     <<= self.alu_sum
        self.io.wb_rd          <<= self.rd
        self.io.wb_pc_4        <<= self.pc_4
        self.io.wb_imm         <<= self.imm
        self.io.wb_aui_pc      <<= self.aui_pc


if __name__ == '__main__':
    builder.emit(builder.elaborate(MEM_WB_Register().gen()), "./firrtl/MEM_WB_Register.fir")
    builder.dumpverilog("./firrtl/MEM_WB_Register.fir", "./verilog/MEM_WB_Register.v")
