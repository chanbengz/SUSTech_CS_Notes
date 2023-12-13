`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/08 10:39:55
// Design Name: 
// Module Name: lab12_p1
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


module lab12_p1(
    input clk,
    input rst,
    output reg led
    );
    reg[26:0] cnt;
    parameter period = 200_000_000;
    always @(posedge clk, negedge rst) begin
        if(!rst) begin
            cnt <= 0;
            led <= 0;
        end
        else
            if (cnt == (period >> 1) - 1) begin
                cnt <= 0;
                led <= ~led;
            end
            else begin
                cnt <= cnt + 1;
            end
    end
endmodule
