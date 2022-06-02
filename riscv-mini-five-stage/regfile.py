"""Processor's register file

Filename: regfile.py
Author: SunnyChen
"""
from config import *


class RegFile_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.rs1 = Input(UInt(RLEN))
        self.rs2 = Input(UInt(RLEN))
        self.rd = Input(UInt(RLEN))
        self.wdata = Input(UInt(WLEN))
        self.rs1_out = Output(UInt(WLEN))
        self.rs2_out = Output(UInt(WLEN))

        self.Reg_Write = Input(UInt(REG_WRITE_SIG_WIDTH))


class RegFile(Module):
    def __init__(self):
        super().__init__()
        self.io = RegFile_IO().IO()

        self.regfile = Mem(REGFILE_LEN, UInt(WLEN))

        # Read and write in the same cycle
        inside_forward_1 = self.io.Reg_Write.to_bool() & (self.io.rs1 == self.io.rd)
        inside_forward_2 = self.io.Reg_Write.to_bool() & (self.io.rs2 == self.io.rd)

        self.io.rs1_out <<= Mux(inside_forward_1, self.io.wdata, self.regfile[self.io.rs1])
        self.io.rs2_out <<= Mux(inside_forward_2, self.io.wdata, self.regfile[self.io.rs2])

        self.regfile.write(self.io.rd, Mux(self.io.Reg_Write.to_bool(), Mux(self.io.rd == U(0), U(0), self.io.wdata),
                                           self.regfile[self.io.rd]))


if __name__ == '__main__':
    builder.emit(builder.elaborate(RegFile().gen()), "firrtl/RegFile.fir")
    builder.dumpverilog("firrtl/RegFile.fir", "verilog/RegFile.v")
