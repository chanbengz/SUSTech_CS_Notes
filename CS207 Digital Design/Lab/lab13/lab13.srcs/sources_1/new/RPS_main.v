`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/15 10:37:34
// Design Name: 
// Module Name: RPS_main
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


module RPS_main(
    input clk, rst, eval,
    input [2:0] p1, p2,
    output reg [1:0] seg_en,
    output [7:0] seg_ctrl1, seg_ctrl2,
    output reg [1:0] led
    );
    reg state, rst_n, eval_n;
    reg [2:0] usr1, usr2;
    reg [15:0] cnt1, cnt2;
    wire [1:0] led_n;
    
    RPS_display(.rps(usr1), .seg_ctrl(seg_ctrl1));
    RPS_display(.rps(usr2), .seg_ctrl(seg_ctrl2));
    RPS_comparator(.p1(usr1), .p2(usr2), .winner(led_n));
    
    always @(posedge clk) begin
        if(eval) begin
            if(cnt1 == 16'hFFFF) begin
                eval_n <= 1;
                cnt1 <= 0;
            end
            else begin
                eval_n <= 0;
                cnt1 <= cnt1 + 1;
            end
        end
        else cnt1 <= 0;
    end
    
        always @(posedge clk) begin
        if(!rst) begin
            if(cnt2 == 16'hFFFF) begin
                rst_n <= 0;
                cnt2 <= 0;
            end
            else begin
                rst_n <= 1;
                cnt2 <= cnt2 + 1;
            end
        end
        else cnt2 <= 0;
    end
    
    always @(posedge eval_n, negedge rst_n) begin
        if(!rst_n) state <= 0;
        else if(eval_n) state <= 1;
    end
    
    always @(state) begin
        if(!state) begin
            usr1 = p1;
            usr2 = p2;
            seg_en = 2'b00;
            led = 0;
        end
        else begin
            led = led_n;
            seg_en = 2'b11;
        end
    end
endmodule
