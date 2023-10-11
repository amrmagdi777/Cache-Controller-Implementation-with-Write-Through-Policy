module cache_mem #(parameter WIDTH = 32, DEPTH = 128,ADDRESS = 7) (
    input wire clk,
    input wire mem_read,
    input wire cach_write,
    input wire miss_read,
    input wire [1:0] counter,
    input wire [WIDTH-1:0] data_in,
    input wire [WIDTH-1:0] read_cache_data,
    input wire [ADDRESS-1:0] addr,
    output wire [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] mem [DEPTH-1:0];

always @(negedge clk) begin
    if(cach_write) begin
        mem[addr] <= data_in;
    end
    else if(miss_read) begin
        case (counter)
           2'b00 :  mem [{addr[6:2],2'b00}] <= read_cache_data;
           2'b01 :  mem [{addr[6:2],2'b01}] <= read_cache_data;
           2'b10 :  mem [{addr[6:2],2'b10}] <= read_cache_data;
           2'b11 :  mem [{addr[6:2],2'b11}] <= read_cache_data;
        endcase        
    end
end

assign data_out = (mem_read) ? mem[addr] : data_out;  

endmodule