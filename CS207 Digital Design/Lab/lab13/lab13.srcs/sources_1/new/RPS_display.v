`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 21:25:53
// Design Name: 
// Module Name: RPS_display
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


module RPS_display(
input [2:0] rps,
output reg [7:0] seg_ctrl
    );
    always@* begin
    case(rps) 
      3'b100: seg_ctrl = 8'b0000_1010;   //8'b {a,b,c,d,e,f,g,dot}
      3'b010: seg_ctrl = 8'b1100_1110;   //8'b {a,b,c,d,e,f,g,dot}
      3'b001: seg_ctrl = 8'b1011_0110;   //8'b {a,b,c,d,e,f,g,dot}
      default: seg_ctrl = 8'b1001_1110;  
    endcase
    end
endmodule
