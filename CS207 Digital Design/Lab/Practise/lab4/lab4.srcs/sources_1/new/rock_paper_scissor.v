`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 10:39:51 AM
// Design Name: 
// Module Name: rock_paper_scissor
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


module rock_paper_scissor(
    input p1_1, p1_2, p2_1, p2_2,
    output reg o1,o2,o3
    );
    always@(p1_1,p1_2,p2_1,p2_2)
    begin
        case({p1_1,p1_2,p2_1,p2_2})
            4'b1001, 4'b1110, 4'b0111:
                {o1,o2,o3} = 3'b100;
            4'b0110, 4'b1011, 4'b1101:
                {o1,o2,o3} = 3'b010;
            4'b0101, 4'b1010, 4'b1111:
                {o1,o2,o3} = 3'b001;
            default:
                {o1,o2,o3} = 3'b000;
        endcase
    end
    
endmodule
