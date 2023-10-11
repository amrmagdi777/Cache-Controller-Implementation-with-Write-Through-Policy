module alu #(parameter WIDTH = 32) (
    input wire signed [WIDTH-1:0] srcA,
    input wire signed [WIDTH-1:0] srcB,
    input wire [2:0] alu_ctrl,
    output reg [WIDTH-1:0] alu_res,
    output wire zero
);

wire [WIDTH-1:0] res_reg;

always @(*) begin
    case (alu_ctrl)
      'b000  : alu_res = srcA + srcB;
      'b001  : alu_res = srcA - srcB;
      'b010  : alu_res = srcA & srcB;
      'b011  : alu_res = srcA | srcB;
      'b101  : alu_res = (srcA < srcB) ? 'h00000001 : 'b0;
      default: alu_res = 'b0;
    endcase 
end

assign res_reg = alu_res;

assign zero = (alu_ctrl == 3'b001 && res_reg == 'b0) ? 1'b1:1'b0;

endmodule
    
