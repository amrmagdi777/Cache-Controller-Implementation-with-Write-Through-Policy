module data_mem #(parameter Addr = 10,WIDTH = 32,DEPTH = 1000) (
    input wire clk,
    input wire mem_write,
    input wire [Addr-1:0] address,
    input wire [WIDTH-1:0] write_data,
    input wire mem_read,
    input wire [1:0] counter,
    output reg ready,
    output reg [WIDTH-1:0] read_cache_data
);

reg [WIDTH-1:0] mem [DEPTH:0];

always @(negedge clk) begin
    if(mem_write) begin
        mem[address] <= write_data;
    end
end

always @(*) begin
    if(mem_read) begin
        ready = 1'b0;
        case (counter)
           2'b00 :  read_cache_data = mem[{address[9:2],2'b00}];
           2'b01 :  read_cache_data = mem[{address[9:2],2'b01}];
           2'b10 :  read_cache_data = mem[{address[9:2],2'b10}];
           2'b11 :  begin
                     read_cache_data = mem[{address[9:2],2'b11}];
                     ready = 1'b1;
                    end
        endcase
    end
    else begin
        ready = 1'b0;
        read_cache_data = 'b0;
    end    
end

endmodule

