module tb_moor_s1s2_rst_syn_asyn( );
    reg clk, rst, x;
    wire [1:0] state, next_s, state_asy, next_s_asy;
    moor_s1s2_rst_syn dut_asy(clk, rst, x, state, next_s);
    moor_s1s2_rst_asyn dut_syn(clk, rst, x, state_asy, next_s_asy);
    initial begin
        $monitor ("%d %d %d %d %d %d %d", x, clk, rst, state, next_s, state_asy, next_s_asy);
        clk = 1;
        x = 0;
        rst = 0;
        #3 rst = 1;
        #23 rst = 0;
        #94 $finish;
    end

    initial fork
        forever #5 clk = ~clk;
    join

    initial fork
        forever #16 x = ~x;
    join
endmodule
