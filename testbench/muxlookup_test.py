from pyhcl import *


class ALU_Op(object):
    ALU_ADD = U(0)
    ALU_SUB = U(1)
    ALU_AND = U(2)
    ALU_OR = U(3)


class Test_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.a = Input(UInt(32))
        self.b = Input(UInt(32))
        self.ctl = Input(UInt(2))
        self.out = Output(UInt(32))


class Test(Module):
    def __init__(self):
        super().__init__()
        self.io = Test_IO().IO()

        self.io.out <<= MuxLookUp(self.io.ctl - self.io.a + self.io.b, U(0), {
            ALU_Op.ALU_ADD: ((self.io.a + self.io.b) * self.io.a),
            ALU_Op.ALU_SUB: (self.io.a - self.io.b),
            ALU_Op.ALU_AND: (self.io.a & self.io.b),
            ALU_Op.ALU_OR: (self.io.a | self.io.b)
        })


if __name__ == '__main__':
    builder.emit(builder.elaborate(Test().gen()), "muxlookup_test.fir")
    # builder.dumpverilog("muxlookup_test.fir", "muxlookup_test.v")
