from pyhcl import *


# class Complex(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.real = Field(UInt(32))
#         self.image = Field(UInt(32))
#
#
# class Inner_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.inner_a = Input(UInt(32))
#         self.inner_v = Input(Vec(4, UInt(32)))
#         self.inner_b = Output(UInt(32))
#
#
# class Inner(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = Inner_IO().IO()
#
#         temp_v = U(0)
#         for i in range(0, 4):
#             temp_v = temp_v + self.io.inner_v[i]
#
#         self.io.inner_b <<= self.io.inner_a + temp_v


class Instructions:
    ADD = BitPat("b0000000??????????000?????0110011")
    SUB = BitPat("b0100000??????????000?????0110011")
    AND = BitPat("b0000000??????????111?????0110011")
    OR = BitPat("b0000000??????????110?????0110011")


class Test_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.base_io = Base_IO()
        self.a = Input(UInt(32))
        self.b = Input(UInt(32))
        self.out = Output(UInt(32))


class Base_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.x = Input(UInt(32))
        self.y = Input(UInt(32))
        self.out = Output(UInt(32))


# class Point(Bundle):
#     def __init__(self, width):
#         super().__init__()
#         self.x = Field(UInt(width))
#         self.y = Field(UInt(width))


class Test(Module):
    def __init__(self):
        super().__init__()
        self.io = Test_IO().IO()

        # @when_begin(self.io.a == Instructions.ADD)
        # def when():
        #     self.io.out <<= U(0)
        #     @when_begin(self.io.a == Instructions.SUB)
        #     def when():
        #         self.io.out <<= U(1)
        #     @elsewhen_begin(self.io.a == Instructions.AND)
        #     def elsewhen_I():
        #         self.io.out <<= U(2)
        #     @elsewhen_begin(self.io.a == Instructions.OR)
        #     def elsewhen_II():
        #         self.io.out <<= U(3)
        #         @when_begin(self.io.a == U(4))
        #         def when():
        #             self.io.out <<= U(4)
        #         @elsewhen_begin(self.io.a == U(5))
        #         def elsewhen_III():
        #             self.io.out <<= U(5)
        #         @elsewhen_begin(self.io.a == U(6))
        #         def elsewhen_IV():
        #             self.io.out <<= U(6)
        #         @elsewhen_begin(self.io.a == U(7))
        #         def elsewhen_V():
        #             self.io.out <<= U(7)
        #         @otherwise_begin()
        #         def otherwise():
        #             self.io.out <<= U(8)
        #     @otherwise_begin()
        #     def otherwise():
        #         self.io.out <<= U(9)
        # @elsewhen_begin(self.io.a == U(10))
        # def elsewhen_VI():
        #     self.io.out <<= U(10)
        # @elsewhen_begin(self.io.a == U(11))
        # def elsewhen_VII():
        #     self.io.out <<= U(11)
        # @otherwise_begin()
        # def otherwise():
        #     self.io.out <<= U(12)

        # @when_begin(self.io.a == Instructions.ADD)
        # def when():
        #     self.io.out <<= U(0)
        # @elsewhen_begin(self.io.a == Instructions.SUB)
        # def elsewhen_I():
        #     self.io.out <<= U(1)
        # @elsewhen_begin(self.io.a == Instructions.AND)
        # def elsewhen_II():
        #     self.io.out <<= U(2)
        # @otherwise_begin()
        # def otherwise():
        #     self.io.out <<= U(3)


# class Top_Lv_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.a = Input(UInt(32))
#         self.b = Output(UInt(32))
#
#
# class Top_Lv(Module):
#     def __init__(self):
#         super().__init__()
#
#         self.io = Top_Lv_IO().IO()
#         self.test = Test().gen()
#         self.vec = Reg(Vec(4, UInt(32)))
#
#         self.test.io.a <<= self.io.a * self.io.a
#         self.test.io.b <<= self.io.a * U(4)
#
#         self.vec[0] <<= self.io.a
#         self.vec[1] <<= self.io.a + U(1)
#         self.vec[2] <<= self.io.a + U(2)
#
#         temp_sum = U(0)
#
#         for i in range(0, 4):
#             temp_sum = temp_sum + self.test.io.v[i]
#
#         self.io.b <<= self.test.io.out + temp_sum


if __name__ == '__main__':
    # builder.emit(builder.elaborate(Test().gen()), "general_test.fir")
    # builder.dumpverilog("general_test.fir", "general_test.v")
    sim = Simulator(Test().gen())
