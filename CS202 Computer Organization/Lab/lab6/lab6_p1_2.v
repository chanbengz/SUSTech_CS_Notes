module subtraction(
    input  [2:0] in1,
    input  [2:0] in2,
    output [2:0] res,
    output overflow
);

    assign res = in1 - in2;
    assign overflow = (~in1[2] & in2[2] & ~res[2]) | (in1[2] & ~in2[2] & res[2]);
endmodule