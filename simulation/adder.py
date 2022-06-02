from pyhcl import *


class Adder_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.a = Input(UInt(1))
        self.b = Input(UInt(1))
        self.cin = Input(UInt(1))
        self.s = Output(UInt(1))
        self.cout = Output(UInt(1))


class Adder(Module):
    def __init__(self):
        super().__init__()
        self.io = Adder_IO().IO()

        self.t = Wire(UInt(2))
        self.t <<= self.io.a + self.io.b + self.io.cin

        self.io.s <<= self.t[0]
        self.io.cout <<= self.t[1]


if __name__ == '__main__':
    # builder.emit(builder.elaborate(Adder().gen()), "Adder.fir")
    # builder.dumpverilog("Adder.fir", "Adder.v")
    adder = Adder().gen()
    sim = Simulator(adder)

    sim.start()

    for i in range(0, 2):
        for j in range(0, 2):
            for k in range(0, 2):
                sim.poke(adder.io.a, i)
                sim.poke(adder.io.b, j)
                sim.poke(adder.io.cin, k)
                sim.step()
                sim.peek(adder.io.s)
                sim.peek(adder.io.cout)

    sim.term()
