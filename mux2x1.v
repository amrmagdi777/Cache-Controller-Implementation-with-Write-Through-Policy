module mux2x1 #(parameter N = 32) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire sel,
    output wire [N-1:0]c
);

assign c = sel ? a:b;

endmodule