"""Hazard detection unit

Filename: hazard_detection.py
Author: SunnyChen
"""
from config import *


class Hazard_Detection_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.rs1 = Input(UInt(RLEN))
        self.rs2 = Input(UInt(RLEN))
        self.ex_rd = Input(UInt(RLEN))

        self.Imm_Sel = Input(UInt(IMM_SEL_SIG_WIDTH))
        self.ex_Mem_Read = Input(UInt(MEM_READ_SIG_LEN))

        self.Bubble = Output(UInt(BUBBLE_SIG_LEN))
        self.IF_ID_Write = Output(UInt(IF_ID_WRITE_SIG_WIDTH))
        self.PC_Write = Output(UInt(PC_WRITE_SIG_WIDTH))


class Hazard_Detection(Module):
    def __init__(self):
        super().__init__()
        self.io = Hazard_Detection_IO().IO()

        # rs1 stall condition
        # only U and UJ type instructions would not use rs1
        rs1_con = self.io.ex_Mem_Read.to_bool() & (self.io.Imm_Sel != IMM_U) & \
                  (self.io.Imm_Sel != IMM_UJ) & (self.io.rs1 == self.io.ex_rd)

        # rs2 stall condition
        rs2_con = self.io.ex_Mem_Read.to_bool() & ((self.io.Imm_Sel == IMM_R) | (self.io.Imm_Sel == IMM_SB)) \
                  & (self.io.rs2 == self.io.ex_rd)

        stall_con = rs1_con | rs2_con

        self.io.Bubble <<= Mux(stall_con, Bubble_True, Bubble_False)
        self.io.IF_ID_Write <<= Mux(stall_con, IF_ID_Write_False, IF_ID_Write_True)
        self.io.PC_Write <<= Mux(stall_con, PC_Write_False, PC_Write_True)


if __name__ == '__main__':
    builder.emit(builder.elaborate(Hazard_Detection().gen()), "./firrtl/Hazard_Detection.fir")
    builder.dumpverilog("./firrtl/Hazard_Detection.fir", "./verilog/Hazard_Detection.v")
