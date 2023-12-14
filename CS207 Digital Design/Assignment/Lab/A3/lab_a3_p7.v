module tb_check_dif();
    reg clk, rst, x;
    wire z;
    check_dif check_dif(.clk(clk), .rst(rst), .x(x), .z(z));
    initial begin
        $monitor ("%d %d %d %d", clk, rst, x, z);
        clk = 1;
        rst = 1;
        x = 0;
        #6 rst = 0;
        #6 x = ~x;
        #36 x = ~x;
        #40 x = ~x;
        #40 x = ~x;
        #20 x = ~x;
        #12 $finish;
    end
    
    initial fork
        forever #5 clk = ~clk;
    join
endmodule