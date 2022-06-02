"""EX/MEM pipeline register

Filename: ex_mem_register.py
Author: SunnyChen
"""
from config import *


class EX_MEM_Register_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.ex_alu_sum = Input(UInt(WLEN))
        self.ex_rs2_out = Input(UInt(WLEN))
        self.ex_rd = Input(UInt(RLEN))
        self.ex_pc_4 = Input(UInt(WLEN))
        self.ex_imm = Input(UInt(WLEN))
        self.ex_aui_pc = Input(UInt(WLEN))
        self.ex_rs2 = Input(UInt(WLEN))

        # Control signals
        self.ex_Mem_Read = Input(UInt(MEM_READ_SIG_LEN))
        self.ex_Mem_Write = Input(UInt(MEM_WRITE_SIG_LEN))
        self.ex_Data_Size = Input(UInt(DATA_SIZE_SIG_LEN))
        self.ex_Load_Type = Input(UInt(LOAD_TYPE_SIG_LEN))
        self.ex_Reg_Write = Input(UInt(REG_WRITE_SIG_WIDTH))
        self.ex_Mem_to_Reg = Input(UInt(REG_SRC_SIG_LEN))

        self.mem_Mem_Read = Output(UInt(MEM_READ_SIG_LEN))
        self.mem_Mem_Write = Output(UInt(MEM_WRITE_SIG_LEN))
        self.mem_Data_Size = Output(UInt(DATA_SIZE_SIG_LEN))
        self.mem_Load_Type = Output(UInt(LOAD_TYPE_SIG_LEN))
        self.mem_Reg_Write = Output(UInt(REG_WRITE_SIG_WIDTH))
        self.mem_Mem_to_Reg = Output(UInt(REG_SRC_SIG_LEN))

        self.mem_alu_sum = Output(UInt(WLEN))
        self.mem_rs2_out = Output(UInt(WLEN))
        self.mem_rd = Output(UInt(RLEN))
        self.mem_pc_4 = Output(UInt(WLEN))
        self.mem_imm = Output(UInt(WLEN))
        self.mem_aui_pc = Output(UInt(WLEN))
        self.mem_rs2 = Output(UInt(WLEN))


class EX_MEM_Register(Module):
    def __init__(self):
        super().__init__()
        self.io = EX_MEM_Register_IO().IO()

        self.alu_sum = RegInit(0, UInt(WLEN))
        self.rs2_out = RegInit(0, UInt(WLEN))
        self.rd = RegInit(0, UInt(RLEN))
        self.pc_4 = RegInit(0, UInt(WLEN))
        self.imm = RegInit(0, UInt(WLEN))
        self.aui_pc = RegInit(0, UInt(WLEN))
        self.rs2 = RegInit(0, UInt(RLEN))

        self.mem_read = RegInit(0, UInt(MEM_READ_SIG_LEN))
        self.mem_write = RegInit(0, UInt(MEM_WRITE_SIG_LEN))
        self.data_size = RegInit(0, UInt(DATA_SIZE_SIG_LEN))
        self.load_type = RegInit(0, UInt(LOAD_TYPE_SIG_LEN))
        self.reg_write = RegInit(0, UInt(REG_WRITE_SIG_WIDTH))
        self.mem_to_reg = RegInit(0, UInt(REG_SRC_SIG_LEN))

        self.alu_sum       <<= self.io.ex_alu_sum
        self.rs2_out       <<= self.io.ex_rs2_out
        self.rd            <<= self.io.ex_rd
        self.pc_4          <<= self.io.ex_pc_4
        self.imm           <<= self.io.ex_imm
        self.aui_pc        <<= self.io.ex_aui_pc
        self.rs2           <<= self.io.ex_rs2
        self.mem_read      <<= self.io.ex_Mem_Read
        self.mem_write     <<= self.io.ex_Mem_Write
        self.data_size     <<= self.io.ex_Data_Size
        self.load_type     <<= self.io.ex_Load_Type
        self.reg_write     <<= self.io.ex_Reg_Write
        self.mem_to_reg    <<= self.io.ex_Mem_to_Reg

        self.io.mem_alu_sum      <<= self.alu_sum
        self.io.mem_rs2_out      <<= self.rs2_out
        self.io.mem_rd           <<= self.rd
        self.io.mem_pc_4         <<= self.pc_4
        self.io.mem_imm          <<= self.imm
        self.io.mem_aui_pc       <<= self.aui_pc
        self.io.mem_rs2          <<= self.rs2
        self.io.mem_Mem_Read     <<= self.mem_read
        self.io.mem_Mem_Write    <<= self.mem_write
        self.io.mem_Data_Size    <<= self.data_size
        self.io.mem_Load_Type    <<= self.load_type
        self.io.mem_Reg_Write    <<= self.reg_write
        self.io.mem_Mem_to_Reg   <<= self.mem_to_reg


if __name__ == '__main__':
    builder.emit(builder.elaborate(EX_MEM_Register().gen()), "./firrtl/EX_MEM_Register.fir")
    builder.dumpverilog("./firrtl/EX_MEM_Register.fir", "./verilog/EX_MEM_Register.v")
