"""Immediate generator of the processor

Filename: immgen.py
Author: SunnyChen
"""
from config import *


class ImmGen_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.inst = Input(UInt(WLEN))
        self.imm = Output(UInt(WLEN))

        self.Imm_Sel = Input(UInt(IMM_SEL_SIG_WIDTH))


class ImmGen(Module):
    def __init__(self):
        super().__init__()
        self.io = ImmGen_IO().IO()

        Rimm = U(0, WLEN).assint()
        Iimm = self.io.inst[31:20].assint()
        Simm = Cat(self.io.inst[31:25], self.io.inst[11:7]).assint()
        SBimm = Cat(self.io.inst[31], self.io.inst[7], self.io.inst[30:25], self.io.inst[11:8], U(0, 1)).assint()
        Uimm = Cat(self.io.inst[31:12], U(0, 12)).assint()
        UJimm = Cat(self.io.inst[31], self.io.inst[19:12], self.io.inst[20], self.io.inst[30:21], U(0, 1)).assint()

        self.io.imm <<= MuxLookUp(self.io.Imm_Sel, S(0, 32), {
            IMM_R: Rimm,
            IMM_I: Iimm,
            IMM_S: Simm,
            IMM_SB: SBimm,
            IMM_U: Uimm,
            IMM_UJ: UJimm
        }).asuint()


if __name__ == '__main__':
    builder.emit(builder.elaborate(ImmGen().gen()), "./firrtl/ImmGen.fir")
    builder.dumpverilog("./firrtl/ImmGen.fir", "./verilog/ImmGen.v")
