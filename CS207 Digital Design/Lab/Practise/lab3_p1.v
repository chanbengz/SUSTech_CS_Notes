module lab3_p1(
    input x,
    input y,
    input z,
    output o1,
    output o2,
    output o3
    );
    
    assign o1 = (x & y & z) + (x & y & ~z);
    assign o2 = x & y & (z | ~z);
    assign o3 = x & y;
endmodule
