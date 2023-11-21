`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 10:26:19 AM
// Design Name: 
// Module Name: lab6_p1
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


module lab6_p1(
    input [1:0] in,
    output tub_sel,
    output reg [7:0] tub_control
    );
    assign tub_sel = 1'b1;
    always @(in)
    begin
        case ({in})
            2'b00: tub_control = 8'b10011110;
            2'b01: tub_control = 8'b00001010;
            2'b10: tub_control = 8'b11001110;
            2'b11: tub_control = 8'b10110110;
        endcase
    end
endmodule
