`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 11:25:24 AM
// Design Name: 
// Module Name: comparator
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


module comparator(
    input [1:0] in1,
    input [1:0] in2,
    output reg[2:0] o
    );
    always @(in1, in2)
    begin
        case({in1,in2})
            4'b1001, 4'b1110, 4'b0111:
                  o = 3'b100;
            4'b0110, 4'b1011, 4'b1101:
                  o = 3'b001;
            4'b0101, 4'b1010, 4'b1111:
                  o = 3'b010;
            default:
                  o = 3'b000;
        endcase
    end
endmodule
