circuit Test : @[muxlookup_test.py:22]
  module Test : @[muxlookup_test.py:22]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    output io : {flip a : UInt<32>, flip b : UInt<32>, flip ctl : UInt<2>, out : UInt<32>} @[muxlookup_test.py:13]

    node _T_8 = add(io.a, io.b) @[muxlookup_test.py:26]
    node _T_9 = sub(io.a, io.b) @[muxlookup_test.py:27]
    node _T_10 = and(io.a, io.b) @[muxlookup_test.py:28]
    node _T_11 = or(io.a, io.b) @[muxlookup_test.py:29]
    node _T_12 = eq(io.ctl, UInt(0)) @[muxlookup_test.py:29]
    node _T_13 = mux(_T_12, _T_8, UInt(0)) @[muxlookup_test.py:29]
    node _T_14 = eq(io.ctl, UInt<1>(1)) @[muxlookup_test.py:29]
    node _T_15 = mux(_T_14, _T_9, _T_13) @[muxlookup_test.py:29]
    node _T_16 = eq(io.ctl, UInt<2>(2)) @[muxlookup_test.py:29]
    node _T_17 = mux(_T_16, _T_10, _T_15) @[muxlookup_test.py:29]
    node _T_18 = eq(io.ctl, UInt<2>(3)) @[muxlookup_test.py:29]
    node _T_19 = mux(_T_18, _T_11, _T_17) @[muxlookup_test.py:29]
    io.out <= _T_19 @[muxlookup_test.py:29]


