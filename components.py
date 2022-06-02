from __future__ import annotations
#
from pyhcl.core.bundle import Bundle, Field
from pyhcl.core.define import U, stop, printf, skip, validif
from pyhcl.core.memory import Mem
from pyhcl.util.mux import Mux
from pyhcl.core.ports import Input, Output
from pyhcl.core.rawdata import UInt, SInt, Data, Vec
from pyhcl.core.rawmodule import Module
from pyhcl.core.reg import Reg, RegInit
from pyhcl.core.wire import Wire
#
#
# class A_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.a = Input(UInt(1))
#         self.b = Output(UInt(1))
#
#
# class B_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.a_io = A_IO()
#         self.c = Input(UInt(1))
#
#
# class C_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.b_io = B_IO()
#         self.e = Input(UInt(1))
#
#
# class D_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.c_io = C_IO()
#         self.g = Input(UInt(1))
#
#
# class Test_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.d_io = D_IO()
#         self.x = Input(UInt(1))
#
#
# class Final_IO(Test_IO):
#     def __init__(self):
#         super().__init__()
#         self.a_io = A_IO()
#         self.q = Input(UInt(1))
#         self.z = Output(UInt(1))
#
#
# class TypeA(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.aa = Field(UInt(1))
#         self.bb = Field(UInt(1))
#
#
# class TypeB(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.AA = TypeA()
#         self.cc = Field(UInt(1))
#         self.dd = Field(UInt(1))
#
#
# class TypeC(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.BB = TypeB()
#         self.ee = Field(UInt(1))
#         self.ff = Field(UInt(1))
#
#
# class TypeD(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.CC = TypeC()
#         self.gg = Field(UInt(1))
#         self.hh = Field(UInt(1))
# # #
# # #
# # # class Test(Module):
# # #     def __init__(self):
# # #         super().__init__()
# # #         self.io = Final_IO().IO()
# # #         self.test_reg = TypeD().Reg()
# # #
# # #         self.test_reg.CC.BB.cc <<= self.test_reg.CC.BB.cc + U(1)
# # #         self.test_reg.CC.BB.AA.bb <<= self.test_reg.CC.BB.AA.bb + U(2)
# # #         self.io.z <<= self.test_reg.CC.BB.cc + self.test_reg.CC.BB.AA.bb
# # #         self.io.a_io.b <<= self.io.q + self.io.x
# # #         self.io.d_io.c_io.b_io.a_io.b <<= self.io.q + self.io.d_io.g
# #
# #
# class Base_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.q = Input(UInt(32))
#
#
# class Extend_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.base_io = Base_IO()
#         self.j = Input(UInt(32))
# #
# #
# class Test_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.extend_io = Extend_IO()
#         self.a = Input(UInt(32))
#         self.b = Input(UInt(32))
#         self.x = Output(UInt(32))
#         self.z = Output(UInt(32))
# #
# #
# class Test(Module):
#     def __init__(self):
#         # Crazy test
#         super().__init__()
#         self.io = Test_IO().IO()
#
#         self.memory = Mem(4, UInt(4))
#         self.complex_mem = TypeD().Mem(128)
#         self.register = TypeD().Reg()
#         self.simple_r = Reg(UInt(32))
#
#         self.simple_r <<= U(4) + self.io.extend_io.j
#         self.register.CC.BB.cc <<= self.io.a * self.io.b + self.io.extend_io.base_io.q + self.simple_r
#         self.register.CC.BB.AA.aa <<= Mux(self.io.extend_io.base_io.q.to_bool(), self.register.CC.ff, self.register.CC.BB.dd)
#         self.io.x <<= self.register.CC.BB.cc
#         self.io.z <<= self.io.x
#         self.io.z <<= self.register.CC.ff + self.register.CC.BB.dd
#         self.memory[U(4)] <<= self.memory[U(16)]
#         self.complex_mem[self.io.a + U(4)].CC.ff <<= self.complex_mem[self.io.a + self.io.b].CC.BB.cc
#         self.complex_mem[self.io.b + U(8)].CC.BB.cc <<= self.complex_mem[U(12)].gg
#         self.io.x <<= self.complex_mem[U(16) + self.io.a].CC.BB.AA.aa
#         self.io.z <<= self.complex_mem[U(4) + U(8)].gg
#
#
# # class Mux_IO(Bundle):
# #     def __init__(self, io_type: Data):
# #         super().__init__()
# #         self.in_1 = Input(io_type)
# #         self.in_2 = Input(io_type)
# #         self.out = Output(io_type)
# #
# #
# # class Mux(Module):
# #     def __init__(self, mux_type: Data):
# #         super().__init__()
# #         self.io = Mux_IO(mux_type).IO()
# #         self.register = Reg(mux_type)
#
#
#
#
# class Adder_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.a = Input(UInt(1))
#         self.b = Input(UInt(1))
#         self.cin = Input(UInt(1))
#         self.s = Output(UInt(1))
#         self.cout = Output(UInt(1))
#
#
# class Adder(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = Adder_IO().IO()
#
#         self.io.s <<= self.io.a ^ self.io.b ^ self.io.cin
#         self.io.cout <<= self.io.a & self.io.b | self.io.a & self.io.cin | self.io.b & self.io.cin
#
#
# class Timer_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.out = Output(UInt(32))
#
#
# class Timer(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = Timer_IO().IO()
#
#         self.timer = RegInit(0, UInt(32))
#         self.timer <<= self.timer + U(1)
#
#         self.io.out <<= self.timer
#
#
# class PC_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.next_pc = Input(UInt(32))
#         self.pc_out = Output(UInt(32))
#
#
# class PC(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = PC_IO().IO()
#
#         self.pc_reg = RegInit(0, UInt(32))
#         self.pc_reg <<= self.io.next_pc
#         self.io.pc_out <<= self.pc_reg
#
#
# class VecTest_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.a = Input(UInt(32))
#         self.b = Input(UInt(32))
#         self.v = Input(Vec(4, UInt(32)))
#         self.out = Output(UInt(32))
#
#
# class VecTest(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = VecTest_IO().IO()
#
#         self.r_vec = Reg(Vec(2, UInt(32)))
#         self.r_vec[0] <<= self.io.a * self.io.b
#         self.r_vec[1] <<= self.r_vec[0].to_bool() + self.io.a
#
#         self.io.out <<= Mux((self.io.a + self.io.b).to_bool(), self.io.v[1], self.io.v[0])
#
#
# class SimpleRom_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.rsignal = Input(UInt(1))
#         self.addr = Input(UInt(32))
#         self.rdata = Output(UInt(32))
#
#
# class SimpleRom(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = SimpleRom_IO().IO()
#         self.memory = Mem(1024, UInt(32))
#
#         self.io.rdata <<= Mux(self.io.rsignal.to_bool(), self.memory[self.io.addr], U(0))
#
#
# class SimpleMux_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.sel = Input(UInt(1))
#         self.a = Input(UInt(32))
#         self.b = Input(UInt(32))
#         self.out = Output(UInt(32))
#
#
# class SimpleMux(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = SimpleMux_IO().IO()
#
#         self.w = Wire(UInt(32))
#         self.w <<= validif(self.io.a.to_bool(), self.io.b)
#
#         self.io.out <<= Mux(self.io.sel, self.io.a, self.io.b)
#
#
# class Tile_IO(Bundle):
#     def __init__(self):
#         super().__init__()
#         self.test_pc = Input(UInt(32))
#         self.inst_out = Output(UInt(32))
#
#
# class Tile(Module):
#     def __init__(self):
#         super().__init__()
#         self.io = Tile_IO().IO()
#
#         self.pc = PC().gen()
#         self.instcache = SimpleRom().gen()
#         self.test = Test().gen()
#
#         self.pc.io.next_pc <<= self.io.test_pc
#         self.instcache.io.addr <<= self.pc.io.pc_out
#         self.instcache.io.rsignal <<= U(1)
#         self.io.inst_out <<= self.instcache.io.rdata
#
#         self.test.io.extend_io.base_io.q <<= self.io.test_pc + self.pc.io.pc_out
