circuit Test : @[filp_test.py:30]
  module Test : @[filp_test.py:30]
    input clock : Clock @[rawmodule.py:100]
    input reset : UInt<1> @[rawmodule.py:101]
    input io : {bio : {aio : {flip a : UInt<32>, flip b : UInt<32>, x : UInt<32>}, flip c : UInt<32>, y : UInt<32>}, flip d : UInt<32>, z : UInt<32>} @[filp_test.py:22]

    io.bio.aio.a <= io.bio.aio.x @[filp_test.py:33]
    io.bio.aio.b <= io.bio.aio.x @[filp_test.py:34]
    io.bio.c <= io.bio.y @[filp_test.py:35]
    io.d <= io.z @[filp_test.py:36]


