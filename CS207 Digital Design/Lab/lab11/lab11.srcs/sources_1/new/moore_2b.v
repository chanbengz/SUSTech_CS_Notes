`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/01 10:45:31
// Design Name: 
// Module Name: moore_2b
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


module moore_2b(
    input clk, rst, x_in,
    output reg [2:0] next_state, state
    );
    parameter S0 = 3'b001, S1 = 3'b010, S2 = 3'b100;
    always @(posedge clk, negedge rst) begin
        if(rst)
            state <= next_state;
        else
            state <= S0;
    end
    always @(state, x_in) begin
        case(state)
            S0: if(x_in) next_state = S1; else next_state = S0;
            S1: if(x_in) next_state = S2; else next_state = S1;
            S2: if(x_in) next_state = S0; else next_state = S2;
            default: state <= S0;
        endcase
    end
endmodule
