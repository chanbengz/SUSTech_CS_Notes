module tb_T_FF_pos_rst_n();
    reg T, clk, rst_n;
    wire Q, Qn;
    T_FF_pos_rst_n_by_JKFF tff(T, clk, rst_n, Q, Qn);

    initial begin
        $monitor ("%d %d %d %d %d", T, clk, rst_n, Q, Qn);
        rst_n = 0;
        T = 1;
        #3 T = 0;
        #15 T = ~T;
        #15 T = ~T;
        #10 rst_n = 1;
        #5 T = ~T;
        #15 T = ~T;
        #15 T = ~T;
        #15 T = ~T;
        #7 $finish;
    end

    initial fork
        clk = 1;
        forever begin
            #5 clk = ~clk;
        end
    join
endmodule
