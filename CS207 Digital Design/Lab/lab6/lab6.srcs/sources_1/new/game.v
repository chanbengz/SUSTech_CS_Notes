`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 11:24:11 AM
// Design Name: 
// Module Name: game
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


module game(
    input [1:0] in1, in2,
    output [2:0] o,
    output tub_sel1, tub_sel2,
    output [7:0] tub_control1, tub_control2
    );
    comparator c(.in1(in1), .in2(in2), .o(o));
    decoder u1(.in(in1), .tub_sel(tub_sel1), .tub_control(tub_control1));
    decoder u2(.in(in2), .tub_sel(tub_sel2), .tub_control(tub_control2));
endmodule
