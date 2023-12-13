`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/01 11:15:01
// Design Name: 
// Module Name: lab11_p3_tb
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


module lab11_p3_tb();
    reg clk, x_in, rst;
    wire[2:0] state, next_state;
    moore_2b m(.x_in(x_in), .clk(clk), .rst(rst), .state(state), .next_state(next_state));
    initial #90 $finish;
    initial begin
        clk = 1'b0;
        rst = 1'b0;
        forever #5 clk = ~clk;
    end
    initial fork
        x_in = 1'b0;
        #1 rst = 1'b1;
        #3 x_in = 1'b1;
        #35 x_in = 1'b0;
        #40 x_in = 1'b1;
        #80 rst = 1'b0;
    join
endmodule
