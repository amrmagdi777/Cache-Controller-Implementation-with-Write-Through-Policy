module extend(
    input wire [31:7] Instr,
    input wire [1:0] imm_src,
    output reg [31:0] ext
);

always @(*) begin
    case(imm_src)
      2'b00 : ext = {{20{Instr[31]}}, Instr[31:20]};
      2'b01 : ext = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
      2'b10 : ext = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};
      2'b11 : ext = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0};
    endcase
end

endmodule