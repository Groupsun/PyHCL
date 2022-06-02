from pyhcl import *


class Counter_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.value = Output(UInt(32))


class Counter(Module):
    def __init__(self):
        super().__init__()
        self.io = Counter_IO().IO()

        self.count = RegInit(0, UInt(32))
        self.count <<= self.count + U(1)

        self.io.value <<= self.count


if __name__ == '__main__':
    counter = Counter().gen()
    sim = Simulator(counter)

    sim.start()

    for i in range(0, 1000):
        sim.step()

    sim.term()
