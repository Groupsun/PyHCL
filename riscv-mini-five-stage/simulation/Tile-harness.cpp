#include "VTile.h"
#include "simulator.h"
using namespace std;

class Tile_Simulator: public Simulator<DataWrapper*>
{
private:
    VTile* dut;
    VerilatedVcdC *tfp;
    int psize;

public:
    Tile_Simulator(VTile* _dut): Simulator()
    {
        this->dut = _dut;
        this->psize = getpagesize();
    }

    ~Tile_Simulator()
    {
        munmap(this->in, this->psize);
        munmap(this->sig, this->psize);
        munmap(this->out, this->psize);
        close(this->in_fd);
        close(this->out_fd);
        close(this->sig_fd);
        remove("./in.dat");
        remove("./sig.dat");
        remove("./out.dat");
    }

    void init_tfp(VerilatedVcdC *_tfp)
    {
        this->tfp = _tfp;
    }

    void init_simdata()
    {
        this->sim_datas.inputs.clear();
        this->sim_datas.outputs.clear();

		this->sim_datas.inputs.push_back(new CDataWrapper(&(dut->clock)));
		this->sim_datas.inputs.push_back(new CDataWrapper(&(dut->reset)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_if_pc_out)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_if_next_pc)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_id_rs1)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_id_rs2)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_id_rs1_out)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_id_rs2_out)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_ex_rs1_out)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_ex_rs2_out)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_ex_alu_sum)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_ex_alu_conflag)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_ex_rd)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_mem_rd)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_mem_alu_sum)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_mem_writedata)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_mem_dataout)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_wb_rd)));
		this->sim_datas.outputs.push_back(new IDataWrapper(&(dut->io_wb_registerwrite)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_Forward_A)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_Forward_B)));
		this->sim_datas.outputs.push_back(new CDataWrapper(&(dut->io_MemWrite_Src)));
	}

    virtual void step()
    {
        this->dut->clock = 0;
        this->dut->eval();
        this->tfp->dump(this->main_time);
        this->main_time++;

        this->dut->clock = 1;
        this->dut->eval();
        this->tfp->dump(this->main_time);
        this->main_time++;
    }

    virtual void reset()
    {
        this->dut->reset = 1;
        step();
    }

    virtual void start()
    {
        this->dut->reset = 0;
        step();
    }
};

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);
    Verilated::traceEverOn(true);
    VTile *top = new VTile;
    VerilatedVcdC *tfp = new VerilatedVcdC;
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("Tile.vcd");
    Tile_Simulator sim(top);
    sim.init_simdata();
    sim.init_tfp(tfp);
    
    top->reset = 1;

    while(!sim.isexit())
        sim.tick();

    delete tfp;
    delete top;
    exit(0);
}        
        