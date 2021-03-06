"""Configuration file

Filename: config.py
Author: SunnyChen
"""
from pyhcl import *

# ------------------------------------------------------------------ #
# Basic Parameters
# ------------------------------------------------------------------ #
WLEN = 32
BLEN = 8
RLEN = 5        # Register number's width
INSTCACHE_SIZE = 1024
REGFILE_LEN = 32

# ------------------------------------------------------------------ #
# Control signal width
# ------------------------------------------------------------------ #
PC_WRITE_SIG_WIDTH = 1
PC_SEL_SIG_WIDTH = 2
IF_ID_WRITE_SIG_WIDTH = 1
IF_IF_FLUSH_SIG_WIDTH = 1
REG_WRITE_SIG_WIDTH = 1
IMM_SEL_SIG_WIDTH = 3
ALU_SRC_SIG_LEN = 1
ALUOP_SIG_LEN = 5
BRANCH_SIG_LEN = 1
BRANCH_SRC_SIG_LEN = 1
MEM_READ_SIG_LEN = 1
MEM_WRITE_SIG_LEN = 1
DATA_SIZE_SIG_LEN = 2
LOAD_TYPE_SIG_LEN = 1
REG_SRC_SIG_LEN = 3
JUMP_TYPE_SIG_LEN = 1
BUBBLE_SIG_LEN = 1
ID_EX_FLUSH_SIG_LEN = 1
CONFLAG_SIG_LEN = 1
FORWARD_A_SIG_LEN = 2
FORWARD_B_SIG_LEN = 2
MEMWRITE_SRC_SIG_LEN = 1
DATA_CACHE_LEN = 32
PC_SRC_SIG_LEN = 1
IF_ID_FLUSH_SIG_LEN = 1

# ================================================================== #
# Main control signals
# ================================================================== #

# ------------------------------------------------------------------ #
# PC_Sel
# ------------------------------------------------------------------ #
PC_Sel_pc_4 = U(0, 2)
PC_Sel_pc_recover = U(1, 2)
PC_Sel_new_addr = U(2, 2)

# ------------------------------------------------------------------ #
# Register write
# ------------------------------------------------------------------ #
Reg_Write_False = U(0, 1)
Reg_Write_True = U(1, 1)

# ------------------------------------------------------------------ #
# Imm_Sel
# ------------------------------------------------------------------ #
IMM_X = U(0, 3)
IMM_R = U(1, 3)
IMM_I = U(2, 3)
IMM_S = U(3, 3)
IMM_SB = U(4, 3)
IMM_U = U(5, 3)
IMM_UJ = U(6, 3)

# ------------------------------------------------------------------ #
# ALU_Src
# ------------------------------------------------------------------ #
ALU_B_XXX = U(0, 1)
ALU_B_rs2 = U(0, 1)
ALU_B_imm = U(1, 1)

# ------------------------------------------------------------------ #
# ALU_Op
# ------------------------------------------------------------------ #
ALU_ADD     = U(0, 5)
ALU_SUB     = U(1, 5)
ALU_AND     = U(2, 5)
ALU_OR      = U(3, 5)
ALU_XOR     = U(4, 5)
ALU_SLL     = U(5, 5)
ALU_SRL     = U(6, 5)
ALU_SRA     = U(7, 5)
ALU_SLT     = U(8, 5)
ALU_SLTU    = U(9, 5)
ALU_BEQ     = U(10, 5)
ALU_BNE     = U(11, 5)
ALU_BLT     = U(12, 5)
ALU_BGE     = U(13, 5)
ALU_BLTU    = U(14, 5)
ALU_BGEU    = U(15, 5)
ALU_OP_XXX  = U(16, 5)

# ------------------------------------------------------------------ #
# Branch
# ------------------------------------------------------------------ #
Branch_False = U(0, 1)
Branch_True = U(1, 1)

# ------------------------------------------------------------------ #
# Branch_Src
# ------------------------------------------------------------------ #
Branch_XXX = U(0, 1)
Branch_PC = U(0, 1)
Branch_Rs1 = U(1, 1)

# ------------------------------------------------------------------ #
# Jump_Type
# ------------------------------------------------------------------ #
Conditional = U(0, 1)
NonConditional = U(1, 1)

# ------------------------------------------------------------------ #
# Mem_Read
# ------------------------------------------------------------------ #
Mem_Read_False = U(0, 1)
Mem_Read_True = U(1, 1)

# ------------------------------------------------------------------ #
# Mem_Write
# ------------------------------------------------------------------ #
Mem_Write_False = U(0, 1)
Mem_Write_True = U(1, 1)

# ------------------------------------------------------------------ #
# Data size
# ------------------------------------------------------------------ #
Data_Size_W = U(0, 2)
Data_Size_H = U(1, 2)
Data_Size_B = U(2, 2)

# ------------------------------------------------------------------ #
# Memory load type
# ------------------------------------------------------------------ #
Load_XXX = U(0, 1)
Load_Signed = U(0, 1)
Load_Unsigned = U(1, 1)

# ------------------------------------------------------------------ #
# Memory to register source
# ------------------------------------------------------------------ #
RegWrite_XXX = U(0, 3)
RegWrite_ALU = U(0, 3)
RegWrite_Mem = U(1, 3)
RegWrite_PC_4 = U(2, 3)
RegWrite_imm = U(3, 3)
RegWrite_ipc = U(4, 3)

# ================================================================== #
# Hazard detection unit signal
# ================================================================== #

# ------------------------------------------------------------------ #
# Bubble
# ------------------------------------------------------------------ #
Bubble_False = U(0, 1)
Bubble_True = U(1, 1)

# ------------------------------------------------------------------ #
# IF/ID register write
# ------------------------------------------------------------------ #
IF_ID_Write_False = U(0, 1)
IF_ID_Write_True = U(1, 1)

# ------------------------------------------------------------------ #
# PC_Write
# ------------------------------------------------------------------ #
PC_Write_False = U(0, 1)
PC_Write_True = U(1, 1)

# ================================================================== #
# Forward unit signal
# ================================================================== #

# ------------------------------------------------------------------ #
# Forward A signal
# ------------------------------------------------------------------ #
Forward_A_rs1 = U(0, 2)
Forward_A_mem_wb_rd = U(1, 2)
Forward_A_ex_mem_rd = U(2, 2)

# ------------------------------------------------------------------ #
# Forward B signal
# ------------------------------------------------------------------ #
Forward_B_rs1 = U(0, 2)
Forward_B_mem_wb_rd = U(1, 2)
Forward_B_ex_mem_rd = U(2, 2)

# ------------------------------------------------------------------ #
# Memory forward signal
# ------------------------------------------------------------------ #
MemWrite_Src_rs2 = U(0, 1)
MemWrite_Src_wb = U(1, 1)

# ================================================================== #
# Memory cache load signal
# ================================================================== #
Word_Signed     = U(0, 3)
Word_Unsigned   = U(1, 3)
HWord_Signed    = U(2, 3)
HWord_Unsigned  = U(3, 3)
Byte_Signed     = U(4, 3)
Byte_Unsigned   = U(5, 3)

# ================================================================== #
# Address buffer write index
# ================================================================== #
Write_0 = U(0)
Write_1 = U(1)
Write_2 = U(2)

# ================================================================== #
# Branch predictor signal
# ================================================================== #

# ------------------------------------------------------------------ #
# IF_ID_Flush signal
# ------------------------------------------------------------------ #
IF_ID_Flush_False = U(0, 1)
IF_ID_Flush_True = U(1, 1)

# ------------------------------------------------------------------ #
# ID_EX_Flush signal
# ------------------------------------------------------------------ #
ID_EX_Flush_False = U(0, 1)
ID_EX_Flush_True = U(1, 1)

# ------------------------------------------------------------------ #
# 2-bit dynamic saturating counter status
# ------------------------------------------------------------------ #
Strong_Nottaken = U(0, 2)
Weak_Nottaken = U(1, 2)
Strong_Taken = U(2, 2)
Weak_Taken = U(3, 2)
