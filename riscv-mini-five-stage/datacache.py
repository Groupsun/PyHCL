"""Datacache of the processor

Filename: datacache.py
Author: SunnyChen
"""
from config import *


class DataCache_IO(Bundle):
    def __init__(self):
        super().__init__()
        self.addr = Input(UInt(WLEN))
        self.write_data = Input(UInt(WLEN))
        self.Mem_Read = Input(UInt(MEM_READ_SIG_LEN))
        self.Mem_Write = Input(UInt(MEM_WRITE_SIG_LEN))
        self.Data_Size = Input(UInt(DATA_SIZE_SIG_LEN))
        self.Load_Type = Input(UInt(LOAD_TYPE_SIG_LEN))

        self.data_out = Output(UInt(WLEN))


class DataCache(Module):
    def __init__(self):
        super().__init__()
        self.io = DataCache_IO().IO()

        self.cache = Mem(DATA_CACHE_LEN, UInt(WLEN))
        fix_addr = self.io.addr / U(4)

        write_data = MuxLookUp(self.io.Data_Size, self.io.write_data, {
            Data_Size_W: self.io.write_data,
            Data_Size_H: Cat(U(0, 16), self.io.write_data[15:0]),
            Data_Size_B: Cat(U(0, 24), self.io.write_data[7:0])
        })

        read_data = MuxLookUp(Cat(self.io.Data_Size, self.io.Load_Type), self.cache[fix_addr], {
            Word_Unsigned: self.cache[fix_addr],
            HWord_Unsigned: self.cache[fix_addr][15:0],
            HWord_Signed: ((self.cache[fix_addr][15:0].assint() << U(16)) >> U(16)).asuint(),
            Byte_Unsigned: self.cache[fix_addr][7:0],
            Byte_Signed: ((self.cache[fix_addr][7:0].assint() << U(24)) >> U(24)).asuint()
        })

        self.cache[fix_addr] <<= Mux(self.io.Mem_Write.to_bool(), write_data, self.cache[fix_addr])
        self.io.data_out <<= Mux(self.io.Mem_Read.to_bool(), read_data, U(0))


if __name__ == '__main__':
    builder.emit(builder.elaborate(DataCache().gen()), "./firrtl/DataCache.fir")
    builder.dumpverilog("./firrtl/DataCache.fir", "./verilog/DataCache.v")
