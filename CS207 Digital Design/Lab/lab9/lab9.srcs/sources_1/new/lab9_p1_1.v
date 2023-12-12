`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2023 10:27:49 AM
// Design Name: 
// Module Name: lab9_p1_1
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


module lab9_p1_1(
    input clk,D,
    output Q
    );
    wire Y,nY,nQ;
    D_Latch master(.En(clk), .D(D), .Q(Y), .nQ(nY));
    D_Latch slave(.En(~clk), .D(Y), .Q(Q), .nQ(nQ));
endmodule
