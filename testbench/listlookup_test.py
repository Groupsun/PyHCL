from pyhcl import *


class Inst:
    ADD = BitPat("b0000000??????????000?????0110011")
    SUB = BitPat("b0100000??????????000?????0110011")
    AND = BitPat("b0000000??????????111?????0110011")
    OR = BitPat("b0000000??????????110?????0110011")
    LW = BitPat("b?????????????????010?????0000011")
    SW = BitPat("b?????????????????010?????0100011")


class Control:
    # ALUOP
    ALUOP_XXX = U(0)
    ALUOP_ADD = U(0)
    ALUOP_SUB = U(1)
    ALUOP_AND = U(2)
    ALUOP_OR = U(3)

    # MEM_READ
    MEM_READ_FALSE = U(0)
    MEM_READ_TRUE = U(1)

    # MEM_WRITE
    MEM_WRITE_FALSE = U(0)
    MEM_WRITE_TRUE = U(1)

    # REG_WRITE
    REG_WRITE_FALSE = U(0)
    REG_WRITE_TRUE = U(1)

    # default case
    default = [ALUOP_XXX, MEM_READ_FALSE, MEM_WRITE_FALSE, REG_WRITE_FALSE]

    # map dict
    map = {
        Inst.ADD: [ALUOP_ADD, MEM_READ_FALSE, MEM_WRITE_FALSE, REG_WRITE_TRUE],
        Inst.SUB: [ALUOP_SUB, MEM_READ_FALSE, MEM_WRITE_FALSE, REG_WRITE_TRUE],
        Inst.AND: [ALUOP_AND, MEM_READ_FALSE, MEM_WRITE_FALSE, REG_WRITE_TRUE],
        Inst.OR: [ALUOP_OR, MEM_READ_FALSE, MEM_WRITE_FALSE, REG_WRITE_TRUE],
        Inst.LW: [ALUOP_XXX, MEM_READ_TRUE, MEM_WRITE_FALSE, REG_WRITE_TRUE],
        Inst.SW: [ALUOP_XXX, MEM_READ_FALSE, MEM_WRITE_TRUE, REG_WRITE_FALSE]
    }


class TestIO(Bundle):
    def __init__(self, type):
        super().__init__()
        self.inst = Input(type)
        self.ALUOP = Output(type)
        self.MEM_READ = Output(type)
        self.MEM_WRITE = Output(type)
        self.REG_WRITE = Output(type)

        self.a = Input(type)
        self.b = Input(type)
        self.v = Input(Vec(4, type))
        self.out = Output(type)


class Test(Module):
    def __init__(self):
        super().__init__()
        self.io = TestIO(UInt(32)).IO()

        stmt_default = [self.io.a + self.io.b, self.io.a - self.io.b,
                        self.io.a & self.io.b, self.io.a | self.io.b]

        stmt_map = {
            Inst.ADD: [self.io.a * self.io.b, self.io.a / self.io.b,
                       self.io.a ^ self.io.b, self.io.a % self.io.b],
            Inst.SUB: [self.io.a == self.io.b, self.io.a != self.io.b,
                       self.io.a < self.io.b, self.io.a > self.io.b]
        }

        stmt_list = ListLookup(self.io.inst, stmt_default, stmt_map)

        temp_sum = U(0)

        for i in range(0, 4):
            temp_sum = temp_sum + self.io.v[i]

        self.io.out <<= stmt_list[0] + stmt_list[1] + stmt_list[2] + stmt_list[3] + temp_sum

        ctrlsignal = ListLookup(self.io.inst, Control.default, Control.map)

        self.io.ALUOP <<= ctrlsignal[0]
        self.io.MEM_READ <<= ctrlsignal[1]
        self.io.MEM_WRITE <<= ctrlsignal[2]
        self.io.REG_WRITE <<= ctrlsignal[3]


if __name__ == '__main__':
    builder.emit(builder.elaborate(Test().gen()), "listlookup_test.fir")
    builder.dumpverilog("listlookup_test.fir", "listlookup_test.v")
