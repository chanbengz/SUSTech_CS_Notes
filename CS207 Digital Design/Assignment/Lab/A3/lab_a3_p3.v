module moor_s1s2_rst_asyn(
    input clk, rst, x,
    output reg [1:0] state, next_s
    );
    always @(posedge clk, posedge rst) begin
        if(rst)
            state <= 2'b01;
        else
            state <= next_s;
    end
    
    always @(state, x) begin
        case(state)
            2'b01: next_s = x ? 2'b01 : 2'b10;
            2'b10: next_s = x ? 2'b10 : 2'b01;
        endcase
    end
endmodule