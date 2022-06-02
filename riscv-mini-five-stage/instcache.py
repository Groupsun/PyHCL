"""Instruction cache of the processor

Filename: instcache.py
Author: SunnyChen
"""
from config import *
from pyhcl import *


class InstCache_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.addr = Input(UInt(WLEN))
        self.inst = Output(UInt(WLEN))


class InstCache(Module):
    def __init__(self):
        super().__init__()
        self.io = InstCache_IO().IO()

        self.cache = Mem(INSTCACHE_SIZE, UInt(BLEN))
        self.io.inst <<= Cat(self.cache[self.io.addr], self.cache[self.io.addr + U(1)],
                             self.cache[self.io.addr + U(2)], self.cache[self.io.addr + U(3)])


if __name__ == '__main__':
    builder.emit(builder.elaborate(InstCache().gen()), "InstCache.fir")
    builder.dumpverilog("InstCache.fir", "InstCache.v")
