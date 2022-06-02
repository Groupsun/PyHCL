// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VALU__Syms.h"


//======================

void VALU::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VALU* t=(VALU*)userthis;
    VALU__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void VALU::traceChgThis(VALU__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VALU* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VALU::traceChgThis__2(VALU__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VALU* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit(c+1,(vlTOPp->clock));
	vcdp->chgBit(c+2,(vlTOPp->reset));
	vcdp->chgBus(c+3,(vlTOPp->io_src_a),32);
	vcdp->chgBus(c+4,(vlTOPp->io_src_b),32);
	vcdp->chgBus(c+5,(vlTOPp->io_ALUOp),5);
	vcdp->chgBus(c+6,(vlTOPp->io_sum),32);
	vcdp->chgBit(c+7,(vlTOPp->io_conflag));
    }
}
