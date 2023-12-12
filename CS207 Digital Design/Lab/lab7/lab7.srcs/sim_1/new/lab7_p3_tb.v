`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 10:53:41 AM
// Design Name: 
// Module Name: lab7_p3_tb
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


module lab7_p3_tb();
    reg [2:0] in;
    wire out;
    lab7_p3 u(.A(in[2]), .B(in[1]), .C(in[0]), .F(out));
    initial begin
        $monitor("%d %d", in, out);
        {in} = 3'b000;
        repeat(7) begin
            #10 {in} = {in} + 1;
        end
        #10 $finish;
    end
endmodule
