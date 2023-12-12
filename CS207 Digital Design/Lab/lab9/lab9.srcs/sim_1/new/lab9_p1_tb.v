`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2023 10:28:25 AM
// Design Name: 
// Module Name: lab9_p1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab9_p1_tb();
    reg sclk, sD;
    wire sQ;
    lab9_p1_1 u1(.clk(sclk),.D(sD),.Q(sQ));
    initial begin
        sclk = 1'b0;
        forever #5 sclk = ~sclk;
    end
    initial fork
        sD = 1'b0;
        forever #7 sD = ~sD;
        #49 $finish;
    join
endmodule
