circuit PC : @[pc.py:20]
  module PC : @[pc.py:20]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    output io : {flip next_pc : UInt<32>, flip PC_Write : UInt<1>, pc_out : UInt<32>} @[pc.py:12]

    reg pc_reg : UInt<32>, clock with: (reset => (reset, UInt(0))) @[pc.py:23]
    node _T_8 = bits(io.PC_Write, 0, 0) @[define.py:161]
    node _T_9 = mux(_T_8, io.next_pc, pc_reg) @[pc.py:24]
    pc_reg <= _T_9 @[pc.py:24]
    io.pc_out <= pc_reg @[pc.py:25]


