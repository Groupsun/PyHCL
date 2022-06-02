"""Arithmetic logic unit

Filename: alu.py
Author: SunnyChen
"""
from config import *


class ALUIO(Bundle):
    def __init__(self):
        super().__init__()
        self.src_a = Input(UInt(WLEN))
        self.src_b = Input(UInt(WLEN))
        self.ALUOp = Input(UInt(ALUOP_SIG_LEN))
        self.sum = Output(UInt(WLEN))
        self.conflag = Output(UInt(CONFLAG_SIG_LEN))


class ALU(Module):
    def __init__(self):
        super().__init__()
        self.io = ALUIO().IO()

        self.shamt = self.io.src_b[5:0]
        self.io.sum <<= MuxLookUp(self.io.ALUOp, self.io.src_b, {
            ALU_ADD : (self.io.src_a + self.io.src_b),
            ALU_SUB : (self.io.src_a - self.io.src_b),
            ALU_AND : (self.io.src_a & self.io.src_b),
            ALU_OR  : (self.io.src_a | self.io.src_b),
            ALU_XOR : (self.io.src_a ^ self.io.src_b),
            ALU_SLL : (self.io.src_a << self.shamt),
            ALU_SRL : (self.io.src_a >> self.shamt),
            ALU_SRA : (self.io.src_a.assint() >> self.shamt).asuint(),
            ALU_SLT : (self.io.src_a.assint() < self.io.src_b.assint()),
            ALU_SLTU: (self.io.src_a < self.io.src_b)
        })

        self.io.conflag <<= MuxLookUp(self.io.ALUOp, U(0), {
            ALU_BEQ : (self.io.src_a.assint() == self.io.src_b.assint()),
            ALU_BNE : (self.io.src_a.assint() == self.io.src_b.assint()),
            ALU_BLT : (self.io.src_a.assint() <  self.io.src_b.assint()),
            ALU_BGE : (self.io.src_a.assint() >= self.io.src_b.assint()),
            ALU_BLTU: (self.io.src_a <  self.io.src_b),
            ALU_BGEU: (self.io.src_a >= self.io.src_b)
        })


if __name__ == '__main__':
    # builder.emit(builder.elaborate(ALU().gen()), "./firrtl/ALU.fir")
    # builder.dumpverilog("./firrtl/ALU.fir", "./verilog/ALU.v")
    alu = ALU().gen()
    sim = Simulator(alu)

    # ---------- Simulation begin ---------- #
    sim.start()

    for i in range(0, 16):
        sim.poke(alu.io.ALUOp, i)
        sim.poke(alu.io.src_a, 100)
        sim.poke(alu.io.src_b, 200)
        sim.step()
        sim.peek(alu.io.sum)
        sim.peek(alu.io.conflag)

    sim.term()
    # ---------- Simulation end ---------- #
