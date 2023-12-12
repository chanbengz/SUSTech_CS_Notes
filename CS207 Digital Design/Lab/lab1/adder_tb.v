`timescale 1ns/1ns
module adder_tb();
    reg [1:0] a;
    reg [1:0] b;
    wire [2:0] c;

    adder DUT (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        a = 2'b00;
        b = 2'b00;
        repeat(16) begin
            #5 $display("%d %d %d", a, b, c);
            #5 {a, b} = {a, b} + 1'b1;
        end
        $finish;
    end
endmodule