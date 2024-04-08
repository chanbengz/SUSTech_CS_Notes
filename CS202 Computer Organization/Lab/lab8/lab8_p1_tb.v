`timescale 1ns / 1ps

module lab8_p1_tb();
    reg [31:0] inst;
    wire writeR, writeM;
    lab8_p1 tb(inst, writeR, writeM);

    initial begin
        inst = 32'h00100863;
        #10
        inst = 32'h00150513;
        #10
        inst = 32'h00a747b3;
        #10
        inst = 32'h00a788b3;
        #10
        inst = 32'h00012583;
        #10
        inst = 32'h00a12223;
        #10
        $finish;
    end

    initial begin
        $dumpfile("lab8_p1_tb.vcd");
        $dumpvars(0, lab8_p1_tb);
    end

endmodule
