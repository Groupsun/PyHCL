from functools import reduce
from pyhcl import *


class Filter_IO(Bundle):
    def __init__(self, length):
        super().__init__()
        self.i = Input(UInt(8))
        self.valid = Input(UInt(1))
        self.o = Output(UInt(8))
        self.consts = Input(Vec(length, UInt(8)))


class Filter(Module):
    def __init__(self, length):
        super().__init__()
        self.io = Filter_IO(length).IO()

        self.regs = Reg(Vec(length, UInt(8)))

        taps = [self.io.i] + [self.regs[i] for i in range(length-1)]
        for a, b in zip(taps, taps[1:]):
            with When(self.io.valid.to_bool()):
                b <<= a

        m = map(lambda x: x[0] * x[1], zip(taps, self.io.consts))
        self.io.o <<= reduce(lambda x, y:x + y, m)


if __name__ == '__main__':
    builder.emit(builder.elaborate(Filter(8).gen()), "FIR.fir")
    builder.dumpverilog("FIR.fir", "FIR.v")
