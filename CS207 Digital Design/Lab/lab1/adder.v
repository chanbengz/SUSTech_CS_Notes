module adder(a, b, c);
    input [1:0] a;
    input [1:0] b;
    output [2:0] c;

    wire [1:0] a;
    wire [1:0] b;
    wire [2:0] c;

    assign c = a + b;
endmodule