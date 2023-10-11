module mux4x1 #(parameter N = 32) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire [N-1:0] c,
    input wire [N-1:0] d,
    input wire [1:0] sel,
    output reg [N-1:0] out
);

always @(*) begin
    case (sel)
      2'b00  : out = a;
      2'b01  : out = b;
      2'b10  : out = c;
      2'b11  : out = d;
    endcase
    
end

endmodule