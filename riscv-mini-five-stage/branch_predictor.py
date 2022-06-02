"""Branch predictor

Filename: branch_predictor.py
Author: SunnyChen
"""
from config import *
from control import default, decode_map
from addr_buffer import Addr_Buffer


class Branch_Predictor_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.inst = Input(UInt(WLEN))
        self.branch_addr = Input(UInt(WLEN))
        self.PC_Src = Input(UInt(PC_SRC_SIG_LEN))
        self.pc = Input(UInt(WLEN))
        self.ex_Branch = Input(UInt(BRANCH_SRC_SIG_LEN))
        self.ex_Jump_Type = Input(UInt(JUMP_TYPE_SIG_LEN))

        self.PC_Sel = Output(UInt(PC_SEL_SIG_WIDTH))
        self.new_addr = Output(UInt(WLEN))
        self.pc_recover = Output(UInt(WLEN))
        self.IF_ID_Flush = Output(UInt(IF_ID_FLUSH_SIG_LEN))
        self.ID_EX_Flush = Output(UInt(ID_EX_FLUSH_SIG_LEN))


class Branch_Predictor(Module):
    def __init__(self):
        super().__init__()
        self.io = Branch_Predictor_IO().IO()
        self.addr_buffer = Addr_Buffer().gen()

        current_inst_ctrl = ListLookup(self.io.inst, default, decode_map)

        self.dynamic_counter_status = RegInit(0, UInt(2))
        pc_4 = self.io.pc + U(4)

        # Conditions
        is_nonconditional_jump = current_inst_ctrl[4].to_bool() & (current_inst_ctrl[11] == NonConditional)
        is_conditional_jump = current_inst_ctrl[4].to_bool() & (current_inst_ctrl[11] == Conditional)
        noncon_addr_is_resolved = self.io.ex_Branch.to_bool() & (self.io.ex_Jump_Type == NonConditional)
        con_addr_is_resolved = self.io.ex_Branch.to_bool() & (self.io.ex_Jump_Type == Conditional)
        noncon_flush = noncon_addr_is_resolved
        need_record_pc_4 = is_conditional_jump & ((self.dynamic_counter_status == Strong_Taken) |
                                                  (self.dynamic_counter_status == Weak_Taken))

        self.addr_buffer.io.record <<= need_record_pc_4
        self.addr_buffer.io.addr_input <<= pc_4

        # Non-conditional jump
        noncon_address = Mux(noncon_addr_is_resolved, self.io.branch_addr, U(0))
        noncon_PC_Sel = Mux(noncon_addr_is_resolved, PC_Sel_new_addr, PC_Sel_pc_4)

        # Conditional jump
        update_status = Mux(con_addr_is_resolved,
                            Mux(self.io.PC_Src.to_bool(), MuxLookUp(self.dynamic_counter_status, self.dynamic_counter_status, {
                                Strong_Nottaken: Weak_Nottaken,
                                Weak_Nottaken: Weak_Taken,
                                Weak_Taken: Strong_Taken,
                                Strong_Taken: Strong_Taken
                            }), MuxLookUp(self.dynamic_counter_status, self.dynamic_counter_status, {
                                Strong_Nottaken: Strong_Nottaken,
                                Weak_Nottaken: Strong_Nottaken,
                                Weak_Taken: Weak_Nottaken,
                                Strong_Taken: Weak_Taken
                            })), self.dynamic_counter_status)

        self.dynamic_counter_status <<= update_status

        predict_fail = con_addr_is_resolved & ((update_status == Weak_Taken) | (update_status == Weak_Nottaken))
        # predict_success = con_addr_is_resolved & ((update_status == Strong_Taken) | (update_status == Strong_Nottaken))
        need_recover_pc = predict_fail & (((update_status == Weak_Taken) & (self.dynamic_counter_status == Strong_Taken)) |
                                          ((update_status == Weak_Nottaken) & (self.dynamic_counter_status == Weak_Taken)))

        flush = noncon_flush | predict_fail

        self.addr_buffer.io.flush <<= flush

        predict_PC_Sel = MuxLookUp(self.dynamic_counter_status, PC_Sel_pc_4, {
            Strong_Nottaken: PC_Sel_pc_4,
            Weak_Nottaken: PC_Sel_pc_4,
            Weak_Taken: PC_Sel_new_addr,
            Strong_Taken: PC_Sel_new_addr
        })

        predict_addr = (self.io.pc.assint() + Cat(self.io.inst[31], self.io.inst[7], self.io.inst[30:25],
                                                  self.io.inst[11:8], U(0, 2)).assint()).asuint()

        con_PC_Sel = Mux(predict_fail, Mux(need_recover_pc, PC_Sel_pc_recover, PC_Sel_new_addr), PC_Sel_pc_4)

        # Output
        self.io.PC_Sel <<= Mux(noncon_addr_is_resolved, noncon_PC_Sel,
                               Mux(con_addr_is_resolved & predict_fail, con_PC_Sel,
                                   Mux(is_conditional_jump, predict_PC_Sel, PC_Sel_pc_4)))

        self.io.new_addr <<= Mux(noncon_addr_is_resolved, self.io.branch_addr,
                                 Mux(con_addr_is_resolved, self.io.branch_addr,
                                     Mux(is_conditional_jump, predict_addr, U(0))))

        self.io.pc_recover <<= self.addr_buffer.io.front

        # Flush signal
        self.io.IF_ID_Flush <<= Mux(flush, IF_ID_Flush_True, IF_ID_Flush_False)
        self.io.ID_EX_Flush <<= Mux(flush, ID_EX_Flush_True, ID_EX_Flush_False)


if __name__ == '__main__':
    builder.emit(builder.elaborate(Branch_Predictor().gen()), "./firrtl/Branch_Predictor.fir")
    builder.dumpverilog("./firrtl/Branch_Predictor.fir", "./verilog/Branch_Predictor.v")
