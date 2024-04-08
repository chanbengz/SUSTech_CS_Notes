`timescale 1ns / 1ps

module lab8_p2_tb();
    reg [31:0] inst;
    wire [31:0] imm;
    lab8_p2 tb(inst, imm);

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
        $dumpfile("lab8_p2_tb.vcd");
        $dumpvars(0, lab8_p2_tb);
    end

endmodule
