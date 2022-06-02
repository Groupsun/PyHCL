circuit Test : @[general_test.py:70]
  module Base : @[general_test.py:56]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    output io : {flip x : UInt<32>, flip y : UInt<32>, out : UInt<32>} @[general_test.py:48]

    node _T_14 = add(io.x, io.y) @[general_test.py:58]
    io.out <= _T_14 @[general_test.py:58]


  module Test : @[general_test.py:70]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    output io : {flip a : UInt<32>, flip b : UInt<32>, out : UInt<32>} @[general_test.py:40]
    output base_io : {flip x : UInt<32>, flip y : UInt<32>, out : UInt<32>} @[general_test.py:48]

    inst base of Base
    base.clock <= clock @[rawmodule.py:110]
    base.reset <= reset @[rawmodule.py:110]
    base.base_io.x <= io.a @[general_test.py:75]
    base.base_io.y <= io.b @[general_test.py:76]
    io.out <= base.base_io.out @[general_test.py:77]


