"""Forward control unit

Filename: forward.py
Author: SunnyChen
"""
from config import *


class Forward_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.ex_mem_Reg_Write = Input(UInt(REG_WRITE_SIG_WIDTH))
        self.ex_mem_rd = Input(UInt(RLEN))
        self.ex_mem_Mem_Write = Input(UInt(MEM_WRITE_SIG_LEN))
        self.ex_mem_rs2 = Input(UInt(RLEN))
        self.mem_wb_Reg_Write = Input(UInt(REG_WRITE_SIG_WIDTH))
        self.mem_wb_rd = Input(UInt(RLEN))
        self.id_ex_rs1 = Input(UInt(RLEN))
        self.id_ex_rs2 = Input(UInt(RLEN))

        self.Forward_A = Output(UInt(FORWARD_A_SIG_LEN))
        self.Forward_B = Output(UInt(FORWARD_B_SIG_LEN))
        self.MemWrite_Src = Output(UInt(MEMWRITE_SRC_SIG_LEN))


class Forward(Module):
    def __init__(self):
        super().__init__()
        self.io = Forward_IO().IO()

        self.ex_mem_a_con = self.io.ex_mem_Reg_Write.to_bool() & (self.io.ex_mem_rd != U(0)) & \
                            (self.io.ex_mem_rd == self.io.id_ex_rs1)
        self.ex_wb_a_con = self.io.mem_wb_Reg_Write.to_bool() & (self.io.mem_wb_rd != U(0)) & \
                           (~self.ex_mem_a_con) & (self.io.mem_wb_rd == self.io.id_ex_rs1)

        self.ex_mem_b_con = self.io.ex_mem_Reg_Write.to_bool() & (self.io.ex_mem_rd != U(0)) & \
                            (self.io.ex_mem_rd == self.io.id_ex_rs2)
        self.ex_wb_b_con = self.io.mem_wb_Reg_Write.to_bool() & (self.io.mem_wb_rd != U(0)) & \
                           (~self.ex_mem_b_con) & (self.io.mem_wb_rd == self.io.id_ex_rs2)

        self.io.Forward_A <<= Cat(self.ex_mem_a_con, self.ex_wb_a_con)
        self.io.Forward_B <<= Cat(self.ex_mem_b_con, self.ex_wb_b_con)

        # Memory forward
        self.mem_forward_con = self.io.mem_wb_Reg_Write.to_bool() & self.io.ex_mem_Mem_Write.to_bool() & \
                               (self.io.ex_mem_rs2 == self.io.mem_wb_rd)

        self.io.MemWrite_Src <<= Mux(self.mem_forward_con, MemWrite_Src_wb, MemWrite_Src_rs2)


if __name__ == '__main__':
    builder.emit(builder.elaborate(Forward().gen()), "./firrtl/Forward.fir")
    builder.dumpverilog("./firrtl/Forward.fir", "./verilog/Forward.v")
