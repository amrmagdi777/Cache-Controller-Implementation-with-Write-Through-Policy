module adder(
    input wire [31:0] pc,
    input wire [31:0] imm_ext,
    output wire [31:0] pc_target
);

assign pc_target = pc + imm_ext;

endmodule