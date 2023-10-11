module top_cache#(parameter WIDTH = 32,ADDRESS = 10) (
    input wire clk,
    input wire rst,
    input wire mem_read,
    input wire mem_write,
    input wire [ADDRESS-1:0] addr,
    input wire [WIDTH-1:0] data_in,
    output wire stall,
    output wire [WIDTH-1:0] data_out
);

wire [WIDTH-1:0] read_cache_data;
wire [1:0] counter;
wire cach_write,main_read,ready_cach_main;

cache_fsm fsm(clk,rst,mem_read,mem_write,addr,ready_cach_main,counter,stall,cach_write,main_read);
data_mem data(clk,mem_write,addr,data_in,main_read,counter,ready_cach_main,read_cache_data);
cache_mem cache(clk,mem_read,cach_write,main_read,counter,data_in,read_cache_data,addr[6:0],data_out);

endmodule