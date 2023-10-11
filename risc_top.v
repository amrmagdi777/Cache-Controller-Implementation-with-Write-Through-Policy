module risc_top #(parameter WIDTH = 32)(
    input wire clk,
    input wire rst
);

//Instruction memory
wire [WIDTH-1:0] pc;
wire [WIDTH-1:0] inst_read;
inst_mem inst(pc,inst_read);

//add4
wire [WIDTH-1:0] pc_plus4;
add_4 add_4(pc,pc_plus4);

//adder for pc target
wire [WIDTH-1:0] imm_ext;
wire [WIDTH-1:0] pc_target;
adder adder(pc,imm_ext,pc_target);

// mux for specify value of pc
wire pc_sel;
wire [WIDTH-1:0] pc_next;
mux2x1 mux_pc(pc_target,pc_plus4,pc_sel,pc_next);

//pc
wire stall;
pc_count pc_count(clk,rst,stall,pc_next,pc);

//mux for specify value of write data
wire [WIDTH-1:0] alu_res,mem_read_data,write_data;
wire [1:0] sel_write_data;
mux4x1 mux_write(alu_res,mem_read_data,pc_plus4,32'b0,sel_write_data,write_data);

// reg file
wire reg_write;
wire [WIDTH-1:0] read_data1,read_data2;
reg_file reg_file(clk,rst,reg_write,inst_read[19:15],inst_read[24:20],inst_read[11:7],write_data,read_data1,read_data2);

//sign extend
wire [1:0] imm_src;
extend extend(inst_read[31:7],imm_src,imm_ext);

//mux for specify srcb
wire alu_src;
wire [WIDTH-1:0] srcb;
mux2x1 mux_srcb(imm_ext,read_data2,alu_src,srcb);

//ALU
wire [2:0] alu_ctrl;
wire zero;
alu alu(read_data1,srcb,alu_ctrl,alu_res,zero);

//data memory
wire Mem_Write;
wire Mem_Read;
top_cache cache(clk,rst,Mem_Read,Mem_Write,alu_res[9:0],read_data2,stall,mem_read_data);
//data_mem data_mem(clk,Mem_Write,alu_res,read_data2,mem_read_data);

//controller
wire branch;
wire jump;
control_unit control_unit(inst_read[6:0],inst_read[14:12],inst_read[30],zero,branch,jump,pc_sel,Mem_Write,Mem_Read,sel_write_data
    ,alu_ctrl,alu_src,imm_src,reg_write);

endmodule