from pyhcl import *


class Test_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.a = Input(UInt(32))
        self.b = Input(UInt(32))
        self.sig = Input(UInt(4))
        self.out = Output(UInt(32))


class Test(Module):
    def __init__(self):
        super().__init__()
        self.io = Test_IO().IO()

        with When((self.io.sig >= U(0)) & (self.io.sig < U(1))):
            self.io.out <<= self.io.a + self.io.b
            with When((self.io.sig >= U(1)) & (self.io.sig < U(2))):
                self.io.out <<= (self.io.a - self.io.b).asuint()
                with When((self.io.sig >= U(2)) & (self.io.sig < U(3))):
                    self.io.out <<= self.io.a * self.io.b
                with Elsewhen((self.io.sig >= U(3) & self.io.sig < U(4))):
                    self.io.out <<= self.io.a / self.io.b
                with Elsewhen((self.io.sig >= U(4)) & (self.io.sig < U(5))):
                    self.io.out <<= self.io.a & self.io.b
                with Otherwise():
                    self.io.out <<= self.io.a | self.io.b
            with Elsewhen((self.io.sig >= U(5)) & (self.io.sig < U(6))):
                self.io.out <<= self.io.a ^ self.io.b
            with Elsewhen((self.io.sig >= U(6)) & (self.io.sig < U(7))):
                self.io.out <<= self.io.a % self.io.b
            with Otherwise():
                self.io.out <<= self.io.a == self.io.b
        with Elsewhen((self.io.sig >= U(7)) & (self.io.sig < U(8))):
            self.io.out <<= self.io.a != self.io.b
        with Elsewhen((self.io.sig >= U(8)) & (self.io.sig < U(9))):
            self.io.out <<= self.io.a < self.io.b
        with Otherwise():
            self.io.out <<= self.io.a > self.io.b


if __name__ == '__main__':
    builder.emit(builder.elaborate(Test().gen()), "when_test.fir")
    builder.dumpverilog("when_test.fir", "when_test.v")
