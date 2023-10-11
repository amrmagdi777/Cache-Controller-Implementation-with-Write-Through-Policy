module inst_mem #(parameter WIDTH = 32,DEPTH = 64)(
    input wire [WIDTH-1:0] address,
    output wire [WIDTH-1:0] read_inst
);

reg [WIDTH-1:0] rom [DEPTH-1:0] ;

initial begin
    $readmemh("Program1.txt",rom);
end

assign read_inst = rom[address >> 2];

endmodule
