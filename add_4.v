module add_4 #(parameter WIDTH = 32)(
    input wire  [WIDTH-1:0] in1,
    output wire [WIDTH-1:0] pc_next
);

assign pc_next = in1 +4;

endmodule