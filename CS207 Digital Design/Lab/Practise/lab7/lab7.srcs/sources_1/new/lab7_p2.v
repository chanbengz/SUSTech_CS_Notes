`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 10:33:56 AM
// Design Name: 
// Module Name: lab7_p2
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


module lab7_p2(
    input [3:0] in,
    output [15:0] out
    );
    decoder_en_3_8 d1(.in(in[2:0]), .en(~in[3]), .out(out[15:8]));
    decoder_en_3_8 d2(.in(in[2:0]), .en(in[3]), .out(out[7:0]));
endmodule
