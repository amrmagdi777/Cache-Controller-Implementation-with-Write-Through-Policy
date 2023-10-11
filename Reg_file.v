module reg_file #(parameter Addr = 5,WIDTH = 32,DEPTH = 32) (
    input wire clk,
    input wire rst,
    input wire WE,
    input wire [Addr-1:0] read_address1,
    input wire [Addr-1:0] read_address2,
    input wire [Addr-1:0] write_address,
    input wire [WIDTH-1:0] write_data,
    output wire [WIDTH-1:0] read_data1,
    output wire [WIDTH-1:0] read_data2
);

reg [WIDTH-1:0] mem [DEPTH-1:0];
 integer I;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        for(I = 0;I < 32;I = I+1) begin
          mem [I] <= 'b0;
        end
    end
    else begin
        if(WE) begin
            mem[write_address] <= write_data;
        end 
    end   
end

assign read_data1 = mem[read_address1];
assign read_data2 = mem[read_address2];           

    
endmodule
