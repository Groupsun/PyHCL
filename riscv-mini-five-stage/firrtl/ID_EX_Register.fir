circuit ID_EX_Register : @[id_ex_register.py:40]
  module ID_EX_Register : @[id_ex_register.py:40]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    output io : {flip id_pc : UInt<32>, flip id_pc_4 : UInt<32>, flip id_rs1_out : UInt<32>, flip id_rs2_out : UInt<32>, flip id_imm : UInt<32>, flip id_inst : UInt<32>, flip id_rs1 : UInt<5>, flip id_rs2 : UInt<5>, ex_pc : UInt<32>, ex_pc_4 : UInt<32>, ex_rs1_out : UInt<32>, ex_rs2_out : UInt<32>, ex_rd : UInt<5>, ex_imm : UInt<32>, ex_rs1 : UInt<5>, ex_rs2 : UInt<5>, ex_inst : UInt<32>, flip ID_EX_Flush : UInt<1>, flip id_ctrl_in : {Reg_Write : UInt<1>, Imm_Sel : UInt<3>, ALU_Src : UInt<1>, ALUOp : UInt<5>, Branch : UInt<1>, Branch_Src : UInt<1>, Mem_Read : UInt<1>, Mem_Write : UInt<1>, Data_Size : UInt<2>, Load_Type : UInt<1>, Mem_to_Reg : UInt<3>, Jump_Type : UInt<1>}, ex_ctrl_out : {Reg_Write : UInt<1>, Imm_Sel : UInt<3>, ALU_Src : UInt<1>, ALUOp : UInt<5>, Branch : UInt<1>, Branch_Src : UInt<1>, Mem_Read : UInt<1>, Mem_Write : UInt<1>, Data_Size : UInt<2>, Load_Type : UInt<1>, Mem_to_Reg : UInt<3>, Jump_Type : UInt<1>}} @[id_ex_register.py:12]

    reg pc : UInt<32>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:44]
    reg pc_4 : UInt<32>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:45]
    reg rs1_out : UInt<32>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:46]
    reg rs2_out : UInt<32>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:47]
    reg imm : UInt<32>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:48]
    reg inst : UInt<32>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:49]
    reg rs1 : UInt<5>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:50]
    reg rs2 : UInt<5>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:51]
    reg alu_src : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:52]
    reg aluop : UInt<5>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:53]
    reg branch : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:54]
    reg branch_src : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:55]
    reg jump_type : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:56]
    reg mem_read : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:57]
    reg mem_write : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:58]
    reg data_size : UInt<2>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:59]
    reg load_type : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:60]
    reg reg_write : UInt<1>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:61]
    reg mem_to_reg : UInt<3>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:62]
    reg imm_sel : UInt<3>, clock with: (reset => (reset, UInt(0))) @[id_ex_register.py:63]
    node _T_70 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_71 = mux(_T_70, UInt(0), io.id_pc) @[id_ex_register.py:66]
    pc <= _T_71 @[id_ex_register.py:66]
    node _T_72 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_73 = mux(_T_72, UInt(0), io.id_pc_4) @[id_ex_register.py:67]
    pc_4 <= _T_73 @[id_ex_register.py:67]
    node _T_74 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_75 = mux(_T_74, UInt(0), io.id_rs1_out) @[id_ex_register.py:68]
    rs1_out <= _T_75 @[id_ex_register.py:68]
    node _T_76 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_77 = mux(_T_76, UInt(0), io.id_rs2_out) @[id_ex_register.py:69]
    rs2_out <= _T_77 @[id_ex_register.py:69]
    node _T_78 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_79 = mux(_T_78, UInt(0), io.id_imm) @[id_ex_register.py:70]
    imm <= _T_79 @[id_ex_register.py:70]
    node _T_80 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_81 = mux(_T_80, UInt(0), io.id_inst) @[id_ex_register.py:71]
    inst <= _T_81 @[id_ex_register.py:71]
    node _T_82 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_83 = mux(_T_82, UInt(0), io.id_rs1) @[id_ex_register.py:72]
    rs1 <= _T_83 @[id_ex_register.py:72]
    node _T_84 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_85 = mux(_T_84, UInt(0), io.id_rs2) @[id_ex_register.py:73]
    rs2 <= _T_85 @[id_ex_register.py:73]
    node _T_86 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_87 = mux(_T_86, UInt(0), io.id_ctrl_in.ALU_Src) @[id_ex_register.py:74]
    alu_src <= _T_87 @[id_ex_register.py:74]
    node _T_88 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_89 = mux(_T_88, UInt(0), io.id_ctrl_in.ALUOp) @[id_ex_register.py:75]
    aluop <= _T_89 @[id_ex_register.py:75]
    node _T_90 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_91 = mux(_T_90, UInt(0), io.id_ctrl_in.Branch) @[id_ex_register.py:76]
    branch <= _T_91 @[id_ex_register.py:76]
    node _T_92 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_93 = mux(_T_92, UInt(0), io.id_ctrl_in.Branch_Src) @[id_ex_register.py:77]
    branch_src <= _T_93 @[id_ex_register.py:77]
    node _T_94 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_95 = mux(_T_94, UInt(0), io.id_ctrl_in.Jump_Type) @[id_ex_register.py:78]
    jump_type <= _T_95 @[id_ex_register.py:78]
    node _T_96 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_97 = mux(_T_96, UInt(0), io.id_ctrl_in.Mem_Read) @[id_ex_register.py:79]
    mem_read <= _T_97 @[id_ex_register.py:79]
    node _T_98 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_99 = mux(_T_98, UInt(0), io.id_ctrl_in.Mem_Write) @[id_ex_register.py:80]
    mem_write <= _T_99 @[id_ex_register.py:80]
    node _T_100 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_101 = mux(_T_100, UInt(0), io.id_ctrl_in.Data_Size) @[id_ex_register.py:81]
    data_size <= _T_101 @[id_ex_register.py:81]
    node _T_102 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_103 = mux(_T_102, UInt(0), io.id_ctrl_in.Load_Type) @[id_ex_register.py:82]
    load_type <= _T_103 @[id_ex_register.py:82]
    node _T_104 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_105 = mux(_T_104, UInt(0), io.id_ctrl_in.Reg_Write) @[id_ex_register.py:83]
    reg_write <= _T_105 @[id_ex_register.py:83]
    node _T_106 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_107 = mux(_T_106, UInt(0), io.id_ctrl_in.Mem_to_Reg) @[id_ex_register.py:84]
    mem_to_reg <= _T_107 @[id_ex_register.py:84]
    node _T_108 = bits(io.ID_EX_Flush, 0, 0) @[define.py:161]
    node _T_109 = mux(_T_108, UInt(0), io.id_ctrl_in.Imm_Sel) @[id_ex_register.py:85]
    imm_sel <= _T_109 @[id_ex_register.py:85]
    io.ex_pc <= pc @[id_ex_register.py:87]
    io.ex_pc_4 <= pc_4 @[id_ex_register.py:88]
    io.ex_rs1_out <= rs1_out @[id_ex_register.py:89]
    io.ex_rs2_out <= rs2_out @[id_ex_register.py:90]
    io.ex_rs1 <= rs1 @[id_ex_register.py:91]
    io.ex_rs2 <= rs2 @[id_ex_register.py:92]
    io.ex_imm <= imm @[id_ex_register.py:93]
    io.ex_inst <= inst @[id_ex_register.py:94]
    node _T_110 = bits(inst, 11, 7) @[id_ex_register.py:95]
    io.ex_rd <= _T_110 @[id_ex_register.py:95]
    io.ex_ctrl_out.ALU_Src <= alu_src @[id_ex_register.py:97]
    io.ex_ctrl_out.ALUOp <= aluop @[id_ex_register.py:98]
    io.ex_ctrl_out.Branch <= branch @[id_ex_register.py:99]
    io.ex_ctrl_out.Branch_Src <= branch_src @[id_ex_register.py:100]
    io.ex_ctrl_out.Jump_Type <= jump_type @[id_ex_register.py:101]
    io.ex_ctrl_out.Mem_Read <= mem_read @[id_ex_register.py:102]
    io.ex_ctrl_out.Mem_Write <= mem_write @[id_ex_register.py:103]
    io.ex_ctrl_out.Reg_Write <= reg_write @[id_ex_register.py:104]
    io.ex_ctrl_out.Mem_to_Reg <= mem_to_reg @[id_ex_register.py:105]
    io.ex_ctrl_out.Data_Size <= data_size @[id_ex_register.py:106]
    io.ex_ctrl_out.Load_Type <= load_type @[id_ex_register.py:107]
    io.ex_ctrl_out.Imm_Sel <= imm_sel @[id_ex_register.py:108]


