module pc_count #(parameter WIDTH = 32) (
    input wire clk,
    input wire rst,
    input wire stall,
    input wire [WIDTH-1:0] pc_next,
    output reg [WIDTH-1:0] pc
);
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        pc <= 'b0;
    end
    else begin
        if(!stall)
        pc <= pc_next;
    end
end
endmodule
