module clock_div_7(
    input clk, rst_n,
    output clk_out
    );
    reg[2:0] cnt7;
    reg cnt;
    assign clk_out = cnt;

    always @(posedge clk, negedge clk, negedge rst_n) begin
        if(~rst_n) begin
            cnt7 <= 3'b110;
            cnt <= 1'b0;
        end
        else begin
            if(cnt7 == 3'b110) begin
                cnt7 <= 3'b000;
                cnt <= ~cnt;
            end
            else begin
                cnt7 <= cnt7 + 1'b1;
            end
        end
    end

endmodule