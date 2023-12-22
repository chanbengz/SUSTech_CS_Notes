module check_dif(
    input clk, rst, x,
    output reg z
    );
    reg[1:0] last;
    always @(posedge clk) begin
        if(rst)
            z <= 0;
        else begin
            last <= {last[0], x};
            if (last[1] != last[0]) z <= 1;
            else z <= 0;
        end
    end
endmodule