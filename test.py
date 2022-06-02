from __future__ import annotations
from pyhcl import *
from pyhcl.core.rawdata import AsyncReset

class AdderIO(Bundle):
    def __init__(self, width):
        super().__init__()
        self.a = Input(UInt(width))
        self.b = Input(UInt(width))
        self.s = Output(UInt(width))
        self.cin = Input(UInt(1))
        self.cout = Output(UInt(1))
        
class Adder(Module):
    def __init__(self, width):
        super().__init__()
        self.io = AdderIO(width).IO()

        self.sum = Wire(UInt(9))

        self.sum @= self.io.a + self.io.b + self.io.cin
        self.io.s @= self.sum[7:0]
        self.io.cout @= self.sum[8]

if __name__ == '__main__':
    builder.emit(builder.elaborate(Adder(8).gen()), "./build/Test.fir")
    builder.dumpverilog("./build/Test.fir", "./build/Test.v")
