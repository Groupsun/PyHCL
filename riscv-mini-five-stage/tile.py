"""Top level model

Filename: tile.py
Author: SunnyChen
"""
from pc import PC
from instcache import InstCache
from datapath import Datapath
from if_id_register import IF_ID_Register
from regfile import RegFile
from immgen import ImmGen
from control import Control
from id_ex_register import ID_EX_Register
from hazard_detection import Hazard_Detection
from alu import ALU
from branch_predictor import Branch_Predictor
from datacache import DataCache
from ex_mem_register import EX_MEM_Register
from forward import Forward
from mem_wb_register import MEM_WB_Register
from config import *


class Tile_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.if_pc_out         = Output(UInt(WLEN))
        self.if_next_pc        = Output(UInt(WLEN))
        self.id_rs1            = Output(UInt(RLEN))
        self.id_rs2            = Output(UInt(RLEN))
        self.id_rs1_out        = Output(UInt(WLEN))
        self.id_rs2_out        = Output(UInt(WLEN))
        self.ex_rs1_out        = Output(UInt(WLEN))
        self.ex_rs2_out        = Output(UInt(WLEN))
        self.ex_alu_sum        = Output(UInt(WLEN))
        self.ex_alu_conflag    = Output(UInt(CONFLAG_SIG_LEN))
        self.ex_rd             = Output(UInt(RLEN))
        self.mem_rd            = Output(UInt(RLEN))
        self.mem_alu_sum       = Output(UInt(WLEN))
        self.mem_writedata     = Output(UInt(WLEN))
        self.mem_dataout       = Output(UInt(WLEN))
        self.wb_rd             = Output(UInt(RLEN))
        self.wb_registerwrite  = Output(UInt(WLEN))
        
        self.Forward_A         = Output(UInt(FORWARD_A_SIG_LEN))
        self.Forward_B         = Output(UInt(FORWARD_B_SIG_LEN))
        self.MemWrite_Src      = Output(UInt(MEMWRITE_SRC_SIG_LEN))


class Tile(Module):
    def __init__(self):
        super().__init__()
        self.io = Tile_IO().IO()

        # ---------------------------------------------------------------------------- #
        # Generate submodule
        # ---------------------------------------------------------------------------- #
        self.pc = PC().gen()
        self.instcache = InstCache().gen()
        self.datapath = Datapath().gen()
        self.if_id_register = IF_ID_Register().gen()
        self.regfile = RegFile().gen()
        self.immgen = ImmGen().gen()
        self.control = Control().gen()
        self.id_ex_register = ID_EX_Register().gen()
        self.hazard_detection = Hazard_Detection().gen()
        self.alu = ALU().gen()
        self.branch_predictor = Branch_Predictor().gen()
        self.datacache = DataCache().gen()
        self.ex_mem_register = EX_MEM_Register().gen()
        self.forward = Forward().gen()
        self.mem_wb_register = MEM_WB_Register().gen()

        # ---------------------------------------------------------------------------- #
        # Datapath - IF stage
        # ---------------------------------------------------------------------------- #
        self.datapath.io.if_io.if_pc <<= self.pc.io.pc_out
        self.datapath.io.if_io.new_addr <<= self.branch_predictor.io.new_addr
        self.datapath.io.if_io.PC_Sel <<= self.branch_predictor.io.PC_Sel
        self.datapath.io.if_io.pc_recover <<= self.branch_predictor.io.pc_recover

        # ---------------------------------------------------------------------------- #
        # PC
        # ---------------------------------------------------------------------------- #
        self.pc.io.next_pc <<= self.datapath.io.if_io.if_new_pc
        self.pc.io.PC_Write <<= self.hazard_detection.io.PC_Write.to_bool()

        # ---------------------------------------------------------------------------- #
        # InstCache
        # ---------------------------------------------------------------------------- #
        self.instcache.io.addr <<= self.pc.io.pc_out

        # ********************** #
        self.io.if_pc_out <<= self.pc.io.pc_out
        self.io.if_next_pc <<= self.datapath.io.if_io.if_new_pc
        # ********************** #

        # ---------------------------------------------------------------------------- #
        # IF/ID pipeline register
        # ---------------------------------------------------------------------------- #
        self.if_id_register.io.if_pc <<= self.pc.io.pc_out
        self.if_id_register.io.if_pc_4 <<= self.datapath.io.if_io.if_pc_4
        self.if_id_register.io.if_inst <<= self.instcache.io.inst
        self.if_id_register.io.IF_ID_Flush <<= self.branch_predictor.io.IF_ID_Flush
        self.if_id_register.io.IF_ID_Write <<= self.hazard_detection.io.IF_ID_Write

        # ---------------------------------------------------------------------------- #
        # Register File
        # ---------------------------------------------------------------------------- #
        self.regfile.io.rs1 <<= self.if_id_register.io.id_rs1
        self.regfile.io.rs2 <<= self.if_id_register.io.id_rs2
        self.regfile.io.rd <<= self.mem_wb_register.io.wb_rd
        self.regfile.io.wdata <<= self.datapath.io.wb_io.wb_reg_writedata
        self.regfile.io.Reg_Write <<= self.mem_wb_register.io.wb_Reg_Write

        # ---------------------------------------------------------------------------- #
        # Immediate generator
        # ---------------------------------------------------------------------------- #
        self.immgen.io.inst <<= self.if_id_register.io.id_inst
        self.immgen.io.Imm_Sel <<= self.control.io.ctrl.Imm_Sel

        # ---------------------------------------------------------------------------- #
        # Main control unit
        # ---------------------------------------------------------------------------- #
        self.control.io.inst <<= self.if_id_register.io.id_inst

        # ---------------------------------------------------------------------------- #
        # Hazard detection unit
        # ---------------------------------------------------------------------------- #
        self.hazard_detection.io.rs1 <<= self.if_id_register.io.id_rs1
        self.hazard_detection.io.rs2 <<= self.if_id_register.io.id_rs2
        self.hazard_detection.io.ex_rd <<= self.id_ex_register.io.ex_rd
        self.hazard_detection.io.Imm_Sel <<= self.control.io.ctrl.Imm_Sel
        self.hazard_detection.io.ex_Mem_Read <<= self.id_ex_register.io.ex_ctrl_out.Mem_Read

        # ---------------------------------------------------------------------------- #
        # Datapath - ID stage
        # ---------------------------------------------------------------------------- #

        # Connect main control units output to the datapath ID stage
        ctrlsignal_list = filter(lambda x: not x.startswith("_") and not x.startswith("__"),
                                 list([k for k in self.datapath.io.id_io.ctrl_in.__dict__]))
        for k in ctrlsignal_list:
            self.datapath.io.id_io.ctrl_in.__dict__[k] <<= self.control.io.ctrl.__dict__[k]
        self.datapath.io.id_io.Bubble <<= self.hazard_detection.io.Bubble

        # ---------------------------------------------------------------------------- #
        # ID/EX pipeline register
        # ---------------------------------------------------------------------------- #
        self.id_ex_register.io.id_pc <<= self.if_id_register.io.id_pc
        self.id_ex_register.io.id_pc_4 <<= self.if_id_register.io.id_pc_4
        self.id_ex_register.io.id_rs1_out <<= self.regfile.io.rs1_out
        self.id_ex_register.io.id_rs2_out <<= self.regfile.io.rs2_out
        self.id_ex_register.io.id_imm <<= self.immgen.io.imm
        self.id_ex_register.io.id_inst <<= self.if_id_register.io.id_inst
        self.id_ex_register.io.id_rs1 <<= self.if_id_register.io.id_rs1
        self.id_ex_register.io.id_rs2 <<= self.if_id_register.io.id_rs2
        self.id_ex_register.io.ID_EX_Flush <<= self.branch_predictor.io.ID_EX_Flush

        ctrlsignal_list = filter(lambda x: not x.startswith("_") and not x.startswith("__"),
                                 list([k for k in self.datapath.io.id_io.ctrl_out.__dict__]))
        for k in ctrlsignal_list:
            self.id_ex_register.io.id_ctrl_in.__dict__[k] <<= self.datapath.io.id_io.ctrl_out.__dict__[k]

        # ********************** #
        self.io.id_rs1 <<= self.if_id_register.io.id_rs1
        self.io.id_rs2 <<= self.if_id_register.io.id_rs2
        self.io.id_rs1_out <<= self.regfile.io.rs1_out
        self.io.id_rs2_out <<= self.regfile.io.rs2_out
        # ********************** #

        # ---------------------------------------------------------------------------- #
        # Datapath - EX stage
        # ---------------------------------------------------------------------------- #
        self.datapath.io.ex_io.ex_pc <<= self.id_ex_register.io.ex_pc
        self.datapath.io.ex_io.ex_imm <<= self.id_ex_register.io.ex_imm
        self.datapath.io.ex_io.ex_rs1_out <<= self.id_ex_register.io.ex_rs1_out
        self.datapath.io.ex_io.ex_Branch_Src <<= self.id_ex_register.io.ex_ctrl_out.Branch_Src

        self.datapath.io.ex_io.ex_Branch <<= self.id_ex_register.io.ex_ctrl_out.Branch
        self.datapath.io.ex_io.ex_alu_conflag <<= self.alu.io.conflag
        self.datapath.io.ex_io.ex_Jump_Type <<= self.id_ex_register.io.ex_ctrl_out.Jump_Type
        self.datapath.io.ex_io.ex_Imm_Sel <<= self.id_ex_register.io.ex_ctrl_out.Imm_Sel

        self.datapath.io.mem_io.mem_alu_sum <<= self.ex_mem_register.io.mem_alu_sum
        self.datapath.io.mem_io.mem_pc_4 <<= self.ex_mem_register.io.mem_pc_4
        self.datapath.io.mem_io.mem_imm <<= self.ex_mem_register.io.mem_imm
        self.datapath.io.mem_io.mem_aui_pc <<= self.ex_mem_register.io.mem_aui_pc
        self.datapath.io.mem_io.mem_Mem_to_Reg <<= self.ex_mem_register.io.mem_Mem_to_Reg

        self.datapath.io.ex_io.Forward_A <<= self.forward.io.Forward_A
        self.datapath.io.ex_io.Forward_B <<= self.forward.io.Forward_B

        self.datapath.io.ex_io.ex_rs2_out <<= self.id_ex_register.io.ex_rs2_out
        self.datapath.io.ex_io.ex_ALU_Src <<= self.id_ex_register.io.ex_ctrl_out.ALU_Src

        # ---------------------------------------------------------------------------- #
        # ALU
        # ---------------------------------------------------------------------------- #
        self.alu.io.src_a <<= self.datapath.io.ex_io.alu_a_src
        self.alu.io.src_b <<= self.datapath.io.ex_io.alu_b_src
        self.alu.io.ALUOp <<= self.id_ex_register.io.ex_ctrl_out.ALUOp

        # ********************** #
        self.io.ex_rs1_out <<= self.id_ex_register.io.ex_rs1_out
        self.io.ex_rs2_out <<= self.id_ex_register.io.ex_rs2_out
        self.io.ex_alu_sum <<= self.alu.io.sum
        self.io.ex_alu_conflag <<= self.alu.io.conflag
        self.io.ex_rd <<= self.id_ex_register.io.ex_rd
        # ********************** #

        # ---------------------------------------------------------------------------- #
        # EX/MEM pipeline register
        # ---------------------------------------------------------------------------- #
        self.ex_mem_register.io.ex_alu_sum <<= self.alu.io.sum
        self.ex_mem_register.io.ex_rs2_out <<= self.datapath.io.ex_io.forward_rs2_out
        self.ex_mem_register.io.ex_rd <<= self.id_ex_register.io.ex_rd
        self.ex_mem_register.io.ex_pc_4 <<= self.id_ex_register.io.ex_pc_4
        self.ex_mem_register.io.ex_imm <<= self.id_ex_register.io.ex_imm
        self.ex_mem_register.io.ex_aui_pc <<= self.datapath.io.ex_io.ex_aui_pc
        self.ex_mem_register.io.ex_rs2 <<= self.id_ex_register.io.ex_rs2
        self.ex_mem_register.io.ex_Mem_Read <<= self.id_ex_register.io.ex_ctrl_out.Mem_Read
        self.ex_mem_register.io.ex_Mem_Write <<= self.id_ex_register.io.ex_ctrl_out.Mem_Write
        self.ex_mem_register.io.ex_Data_Size <<= self.id_ex_register.io.ex_ctrl_out.Data_Size
        self.ex_mem_register.io.ex_Load_Type <<= self.id_ex_register.io.ex_ctrl_out.Load_Type
        self.ex_mem_register.io.ex_Reg_Write <<= self.id_ex_register.io.ex_ctrl_out.Reg_Write
        self.ex_mem_register.io.ex_Mem_to_Reg <<= self.id_ex_register.io.ex_ctrl_out.Mem_to_Reg

        # ---------------------------------------------------------------------------- #
        # Datapath - MEM stage
        # ---------------------------------------------------------------------------- #
        self.datapath.io.mem_io.mem_rs2_out <<= self.ex_mem_register.io.mem_rs2_out
        self.datapath.io.mem_io.MemWrite_Src <<= self.forward.io.MemWrite_Src

        # ---------------------------------------------------------------------------- #
        # Data cache
        # ---------------------------------------------------------------------------- #
        self.datacache.io.addr <<= self.ex_mem_register.io.mem_alu_sum
        self.datacache.io.write_data <<= self.datapath.io.mem_io.mem_writedata
        self.datacache.io.Mem_Read <<= self.ex_mem_register.io.mem_Mem_Read
        self.datacache.io.Mem_Write <<= self.ex_mem_register.io.mem_Mem_Write
        self.datacache.io.Data_Size <<= self.ex_mem_register.io.mem_Data_Size
        self.datacache.io.Load_Type <<= self.ex_mem_register.io.mem_Load_Type

        # ********************** #
        self.io.mem_rd <<= self.ex_mem_register.io.mem_rd
        self.io.mem_alu_sum <<= self.ex_mem_register.io.mem_alu_sum
        self.io.mem_writedata <<= self.datapath.io.mem_io.mem_writedata
        self.io.mem_dataout <<= self.datacache.io.data_out
        # ********************** #

        # ---------------------------------------------------------------------------- #
        # MEM/WB pipeline register
        # ---------------------------------------------------------------------------- #
        self.mem_wb_register.io.mem_Reg_Write <<= self.ex_mem_register.io.mem_Reg_Write
        self.mem_wb_register.io.mem_Mem_to_Reg <<= self.ex_mem_register.io.mem_Mem_to_Reg
        self.mem_wb_register.io.mem_dataout <<= self.datacache.io.data_out
        self.mem_wb_register.io.mem_alu_sum <<= self.ex_mem_register.io.mem_alu_sum
        self.mem_wb_register.io.mem_rd      <<= self.ex_mem_register.io.mem_rd
        self.mem_wb_register.io.mem_pc_4    <<= self.ex_mem_register.io.mem_pc_4
        self.mem_wb_register.io.mem_imm     <<= self.ex_mem_register.io.mem_imm
        self.mem_wb_register.io.mem_aui_pc  <<= self.ex_mem_register.io.mem_aui_pc

        # ---------------------------------------------------------------------------- #
        # Datapath - WB stage
        # ---------------------------------------------------------------------------- #
        self.datapath.io.wb_io.wb_alu_sum <<= self.mem_wb_register.io.wb_alu_sum
        self.datapath.io.wb_io.wb_dataout <<= self.mem_wb_register.io.wb_dataout
        self.datapath.io.wb_io.wb_pc_4 <<= self.mem_wb_register.io.wb_pc_4
        self.datapath.io.wb_io.wb_imm <<= self.mem_wb_register.io.wb_imm
        self.datapath.io.wb_io.wb_aui_pc <<= self.mem_wb_register.io.wb_aui_pc
        self.datapath.io.wb_io.wb_Mem_to_Reg <<= self.mem_wb_register.io.wb_Mem_to_Reg

        # ********************** #
        self.io.wb_rd <<= self.mem_wb_register.io.wb_rd
        self.io.wb_registerwrite <<= self.datapath.io.wb_io.wb_reg_writedata
        # ********************** #

        # ---------------------------------------------------------------------------- #
        # Forward unit
        # ---------------------------------------------------------------------------- #
        self.forward.io.ex_mem_Reg_Write <<= self.ex_mem_register.io.mem_Reg_Write
        self.forward.io.ex_mem_rd <<= self.ex_mem_register.io.mem_rd
        self.forward.io.mem_wb_Reg_Write <<= self.mem_wb_register.io.wb_Reg_Write
        self.forward.io.mem_wb_rd <<= self.mem_wb_register.io.wb_rd
        self.forward.io.id_ex_rs1 <<= self.id_ex_register.io.ex_rs1
        self.forward.io.id_ex_rs2 <<= self.id_ex_register.io.ex_rs2
        self.forward.io.ex_mem_rs2 <<= self.ex_mem_register.io.mem_rs2
        self.forward.io.ex_mem_Mem_Write <<= self.ex_mem_register.io.mem_Mem_Write

        # ---------------------------------------------------------------------------- #
        # Branch predictor
        # ---------------------------------------------------------------------------- #
        self.branch_predictor.io.inst <<= self.instcache.io.inst
        self.branch_predictor.io.branch_addr <<= self.datapath.io.ex_io.branch_addr
        self.branch_predictor.io.PC_Src <<= self.datapath.io.ex_io.PC_Src
        self.branch_predictor.io.pc <<= self.pc.io.pc_out
        self.branch_predictor.io.ex_Branch <<= self.id_ex_register.io.ex_ctrl_out.Branch
        self.branch_predictor.io.ex_Jump_Type <<= self.id_ex_register.io.ex_ctrl_out.Jump_Type

        # ********************** #
        self.io.Forward_A <<= self.forward.io.Forward_A
        self.io.Forward_B <<= self.forward.io.Forward_B
        self.io.MemWrite_Src <<= self.forward.io.MemWrite_Src
        # ********************** #


if __name__ == '__main__':
    # builder.emit(builder.elaborate(Tile().gen()), "./firrtl/Tile.fir")
    # builder.dumpverilog("./firrtl/Tile.fir", "./verilog/Tile.v")
    tile = Tile().gen()
    sim = Simulator(tile)

    # Simulate begin
    sim.start()

    for i in range(0, 1000):
        sim.step()

    sim.term()
    # Simulate end
