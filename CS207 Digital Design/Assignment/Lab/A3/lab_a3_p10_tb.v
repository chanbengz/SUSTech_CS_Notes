module tb_MemUnit16_8();
    reg clk, rw, rst_n;
    reg[3:0] addr;
    reg[7:0] data_in;
    wire[7:0] data_out;
    wire data_valid;
    MemUnit16_8 u(.clk(clk), .rw(rw), .rst_n(rst_n), .addr(addr), .data_in(data_in), .data_out(data_out), .data_valid(data_valid));
    initial begin
        rw = 0;
        rst_n = 0;
        clk = 1;
        addr = 0;
        data_in = 0;
        #1 rst_n = 1;
        #239 rw = 1;
        #255 $finish;
    end

    initial fork
        forever #5 clk = ~clk;
    join

    initial fork
        forever #15 addr = addr + 1;
    join

    initial fork
        forever #15 data_in = data_in + 1;
    join
endmodule