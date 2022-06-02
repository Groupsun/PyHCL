"""RV32I riscv-mini processor PC component

Filename: pc.py
Author: SunnyChen
"""
import time
from config import *


class PC_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.next_pc = Input(UInt(WLEN))
        self.PC_Write = Input(UInt(PC_WRITE_SIG_WIDTH))
        self.pc_out = Output(UInt(WLEN))


class PC(Module):
    def __init__(self):
        super().__init__()
        self.io = PC_IO().IO()

        self.pc_reg = RegInit(0, UInt(WLEN))
        self.pc_reg <<= Mux(self.io.PC_Write.to_bool(), self.io.next_pc, self.pc_reg)
        self.io.pc_out <<= self.pc_reg


if __name__ == '__main__':
    pc = PC().gen()
    sim = Simulator(pc)

    # Simulate begin
    sim.start()

    next_pc = 0
    sim.poke(pc.io.PC_Write, 1)
    for i in range(0, 16):
        sim.poke(pc.io.next_pc, next_pc)
        sim.step()
        sim.peek(pc.io.pc_out)
        next_pc += 4

    sim.term()
    # Simulate end
