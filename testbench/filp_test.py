from pyhcl import *


class AIO(Bundle):
    def __init__(self):
        super().__init__()
        self.a = Input(UInt(32))
        self.b = Input(UInt(32))
        self.x = Output(UInt(32))


class BIO(Bundle):
    def __init__(self):
        super().__init__()
        self.aio = AIO()
        self.c = Input(UInt(32))
        self.y = Output(UInt(32))


class CIO(Bundle):
    def __init__(self):
        super().__init__()
        self.bio = BIO()
        self.d = Input(UInt(32))
        self.z = Output(UInt(32))


class Test(Module):
    def __init__(self):
        super().__init__()
        self.io = CIO().flip().IO()

        self.io.bio.aio.a <<= self.io.bio.aio.x
        self.io.bio.aio.b <<= self.io.bio.aio.x
        self.io.bio.c <<= self.io.bio.y
        self.io.d <<= self.io.z


if __name__ == '__main__':
    builder.emit(builder.elaborate(Test().gen()), "filp_test.fir")
    builder.dumpverilog("filp_test.fir", "filp_test.v")