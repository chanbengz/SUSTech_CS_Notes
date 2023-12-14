module check_dif(
    input clk, rst, x,
    output reg z
    );
    reg last_x1, last_x2;
    always @(posedge clk) begin
        if(rst)
            z <= 0;
        else begin
            if(last_x1 != last_x2)
                z <= 1;
            else
                z <= 0;
            last_x2 <= last_x1;
            last_x1 <= x;
        end
    end
endmodule