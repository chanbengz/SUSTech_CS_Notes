`timescale 1ns/1ns
module lab_a1_p6();
    reg [3:0] in_tb;
    wire [3:0] out_xb2yg, out_yg2xb;

    xb2yg XY (
        .xb(in_tb),
        .yg(out_xb2yg)
    );

    yg2xb YX (
        .yg(in_tb),
        .xb(out_yg2xb)
    );

    initial begin
        $monitor("%d %d %d", in_tb, out_xb2yg, out_yg2xb); 
        {in_tb} = 4'b0000;
        repeat(15) begin
            #10 {in_tb} = {in_tb} + 1'b1;
        end
        #150 $finish;
    end
endmodule