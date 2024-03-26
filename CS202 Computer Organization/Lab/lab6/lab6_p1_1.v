module adder(
    input  [2:0] in1,
    input  [2:0] in2,
    output [2:0] sum,
    output overflow
);

    assign sum = in1 + in2;
    assign overflow = (in1[2] & in2[2] & ~sum[2]) | (~in1[2] & ~in2[2] & sum[2]); 
endmodule