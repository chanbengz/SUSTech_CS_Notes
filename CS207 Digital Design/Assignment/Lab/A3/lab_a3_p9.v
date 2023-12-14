module tb_clk_div7();
    reg clk, rst_n;
    wire clk_out;
    clock_div_7 dut(.clk(clk), .rst_n(rst_n), .clk_out(clk_out));
    initial begin
        $monitor ("%d %d %d", clk, rst_n, clk_out);
        clk = 1;
        rst_n = 0;
        #16 rst_n = 1;
        #484 $finish;
    end

    initial fork
        forever #5 clk = ~clk;
    join
endmodule