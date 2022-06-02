"""Address buffer for the branch prediction unit

Filename: addr_buffer.py
Author: SunnyChen
"""
from config import *


class Addr_Buffer_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.addr_input = Input(UInt(WLEN))
        self.flush = Input(UInt(1))
        self.record = Input(UInt(1))

        self.front = Output(UInt(WLEN))


class Addr_Buffer(Module):
    def __init__(self):
        super().__init__()
        self.io = Addr_Buffer_IO().IO()

        self.buffer = Mem(3, UInt(WLEN))
        self.counter = Mem(3, UInt(2))
        self.is_used = Mem(3, Bool())

        self.io.front <<= Mux(self.counter[U(0)] > self.counter[U(1)],
                              Mux(self.counter[U(0)] > self.counter[U(2)], self.buffer[U(0)], self.buffer[U(2)]),
                              Mux(self.counter[U(1)] > self.counter[U(2)], self.buffer[U(1)], self.buffer[U(2)]))

        write_index = Mux(self.is_used[U(0)] == U(0), Write_0, Mux(self.is_used[U(1)] == U(0), Write_1, Write_2))

        temp_used_list = []

        for i in range(0, 3):
            temp_used_list.append(Mux(self.io.record.to_bool(), Mux(write_index == U(i), U(1, 1), self.is_used[U(i)]),
                              self.is_used[U(i)]))

        for i in range(0, 3):
            self.is_used[U(i)] <<= Mux(self.io.flush.to_bool(), U(0, 1), Mux(self.counter[U(i)] == U(2), U(0, 1),
                                                                             temp_used_list[i]))

        for i in range(0, 3):
            self.counter[U(i)] <<= Mux(self.io.flush.to_bool(), U(0),
                                       Mux(self.counter[U(i)] == U(2), U(0),
                                           Mux(self.is_used[U(i)], self.counter[U(i)] + U(1), self.counter[U(i)])))

        for i in range(0, 3):
            self.buffer[U(i)] <<= Mux(self.io.flush.to_bool(), U(0),
                                      Mux(self.counter[U(i)] == U(2), U(0),
                                          Mux(self.io.record.to_bool(),
                                              Mux(write_index == U(i), self.io.addr_input, self.buffer[U(i)]),
                                              self.buffer[U(i)])))


if __name__ == '__main__':
    builder.emit(builder.elaborate(Addr_Buffer().gen()), "./firrtl/Adder_Buffer.fir")
    builder.dumpverilog("./firrtl/Adder_Buffer.fir", "./verilog/Adder_Buffer.v")
