`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 10:40:59 AM
// Design Name: 
// Module Name: lab7_p2_tb
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


module lab7_p2_tb();
    reg [3:0] in;
    wire [15:0] out1, out2;
    lab7_p2 u1(.in(in), .out(out1));
    decoder_4_16 u2(.in(in), .out(out2));
    initial begin
        $monitor("%d %d %d", in, out1, out2);
        {in} = 4'b0000;
        repeat(15) begin
            #10 {in} = {in} + 1;
        end
        #10 $finish;
    end
endmodule
