"""IF/ID pipeline register

Filename: if_id_register.py
Author: SunnyChen
"""
from config import *


class IF_ID_Register_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.if_pc = Input(UInt(WLEN))
        self.if_pc_4 = Input(UInt(WLEN))
        self.if_inst = Input(UInt(WLEN))

        self.id_pc = Output(UInt(WLEN))
        self.id_pc_4 = Output(UInt(WLEN))
        self.id_rs1 = Output(UInt(RLEN))
        self.id_rs2 = Output(UInt(RLEN))
        self.id_inst = Output(UInt(WLEN))

        self.IF_ID_Write = Input(UInt(IF_ID_WRITE_SIG_WIDTH))
        self.IF_ID_Flush = Input(UInt(IF_IF_FLUSH_SIG_WIDTH))


class IF_ID_Register(Module):
    def __init__(self):
        super().__init__()
        self.io = IF_ID_Register_IO().IO()

        self.pc = RegInit(0, UInt(WLEN))
        self.pc_4 = RegInit(0, UInt(WLEN))
        self.inst = RegInit(0, UInt(WLEN))

        self.pc <<= Mux(self.io.IF_ID_Flush.to_bool(), U(0),
                        Mux(self.io.IF_ID_Write.to_bool(), self.io.if_pc, self.pc))
        self.pc_4 <<= Mux(self.io.IF_ID_Flush.to_bool(), U(0),
                          Mux(self.io.IF_ID_Write.to_bool(), self.io.if_pc_4, self.pc_4))
        self.inst <<= Mux(self.io.IF_ID_Flush.to_bool(), U(0),
                          Mux(self.io.IF_ID_Write.to_bool(), self.io.if_inst, self.inst))

        self.io.id_pc <<= self.pc
        self.io.id_pc_4 <<= self.pc_4
        self.io.id_inst <<= self.inst
        self.io.id_rs1 <<= self.inst[19:15]
        self.io.id_rs2 <<= self.inst[24:20]


if __name__ == '__main__':
    builder.emit(builder.elaborate(IF_ID_Register().gen()), "IF_ID_Register.fir")
    builder.dumpverilog("IF_ID_Register.fir", "IF_ID_Register.v")
