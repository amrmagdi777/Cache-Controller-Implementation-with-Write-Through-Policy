`timescale 1ns/1ns

module test;

reg clk,rst;

risc_top risc(clk,rst);

always #5 clk = ~clk;

initial begin
    clk = 1'b0;
    rst = 1'b1;
    #3
    rst = 1'b0;
    #5
    rst = 1'b1;
    #200
    $stop;
end


endmodule