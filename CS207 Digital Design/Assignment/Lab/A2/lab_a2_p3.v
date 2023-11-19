module lab_a2_p3(
	input signed [2:0] a,b,
	output tub_sflag_sel, tub_sabsolut_sel,
    output [7:0] tub_sflag_control, tub_sabsolut_control
	);
    wire sum_flag;
    wire [2:0] sum_absolut;
    reg [3:0] num, rflag;
    reg open;
    lab_a2_p1 u(.a(a), .b(b), .sum_flag(sum_flag), .sum_absolut(sum_absolut));
    lab_a2_p3_tub_display flag(.in_b4(rflag), .tub_sel_in(sum_flag), .tub_sel_out(tub_sflag_sel), .tub_control(tub_sflag_control));
    lab_a2_p3_tub_display number(.in_b4(num), .tub_sel_in(open), .tub_sel_out(tub_sabsolut_sel), .tub_control(tub_sabsolut_control));
    always @(*) begin
        if (sum_flag == 1'b1) begin
            rflag = 4'b1111;
            num = sum_absolut;
            open = 1;
        end
        else begin
            rflag = 4'b0000;
            num = sum_absolut;
            open = 1;
        end
    end
endmodule