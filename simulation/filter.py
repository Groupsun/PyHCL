from pyhcl import *


class Filter_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.input = Input(UInt(32))
        self.output = Output(UInt(32))


class Filter(Module):
    def __init__(self):
        super().__init__()
        self.io = Filter_IO().IO()

        self.r = RegInit(0, UInt(32))
        self.r <<= self.io.input

        with When((self.r <= U(100)) | (self.r >= U(300))):
            self.io.output <<= U(0)
        with Otherwise():
            self.io.output <<= self.r


if __name__ == '__main__':
    filter = Filter().gen()
    sim = Simulator(filter)

    sim.start()

    for i in range(0, 1000):
        sim.poke(filter.io.input, i)
        sim.step()
        sim.peek(filter.io.output)

    sim.term()
