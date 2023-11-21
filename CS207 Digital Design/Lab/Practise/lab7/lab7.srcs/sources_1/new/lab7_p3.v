`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 10:53:20 AM
// Design Name: 
// Module Name: lab7_p3
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


module lab7_p3(
    input A,B,C,
    output F
    );
    wire[7:0] minterms;
    assign minterms = 8'b10011101;
    MUX_8_1 m1(.in_data(minterms), .sel({A,B,C}), .out(F));
endmodule
