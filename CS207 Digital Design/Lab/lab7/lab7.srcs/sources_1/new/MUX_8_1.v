`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 10:49:59 AM
// Design Name: 
// Module Name: MUX_8_1
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


module MUX_8_1(
    input[7:0] in_data,
    input[2:0] sel,
    output reg out
    );
    always @* begin
        case(sel) 
            3'b000: out = in_data[0];
            3'b001: out = in_data[1];
            3'b010: out = in_data[2];
            3'b011: out = in_data[3];
            3'b100: out = in_data[4];
            3'b101: out = in_data[5];
            3'b110: out = in_data[6];
            3'b111: out = in_data[7];
        endcase
    end
endmodule
