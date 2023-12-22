`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 21:16:20
// Design Name: 
// Module Name: RPS_comparator
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


module RPS_comparator(
    input [2:0] p1,p2,
    output reg [1:0] winner
    );
    // R: p1[2],p2[2];   P: p1[1],p2[1];     S: p1[0],p2[0]
    always@ * begin
        if (p1==p2)
            winner = 2'b00;
        else begin
            case({p1,p2})
                6'b100_001: winner = 2'b10;   //p1: R, P2: S
                6'b100_010: winner = 2'b01;   //p1: R, P2: P
                6'b010_100: winner = 2'b10;   //p1: P, P2: R
                6'b010_001: winner = 2'b01;   //p1: P, P2: S
                6'b001_100: winner = 2'b01;   //p1: S, P2: R
                6'b001_010: winner = 2'b10;   //p1: S, P2: P
                default: winner = 2'b00;
            endcase
        end    
    end
endmodule
