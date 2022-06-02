circuit Adder : @[adder.py:16]
  module Adder : @[adder.py:16]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    output io : {flip a : UInt<1>, flip b : UInt<1>, flip cin : UInt<1>, s : UInt<1>, cout : UInt<1>} @[adder.py:6]

    wire t : UInt<2> @[adder.py:19]
    node _T_10 = add(io.a, io.b) @[adder.py:20]
    node _T_11 = add(_T_10, io.cin) @[adder.py:20]
    t <= _T_11 @[adder.py:20]
    node _T_12 = bits(t, 0, 0) @[adder.py:22]
    io.s <= _T_12 @[adder.py:22]
    node _T_13 = bits(t, 1, 1) @[adder.py:23]
    io.cout <= _T_13 @[adder.py:23]


