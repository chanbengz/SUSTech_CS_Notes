module lab_a2_p3_tub_display(
    input [3:0] in_b4,
    input tub_sel_in,
    output tub_sel_out,
    output reg [7:0] tub_control
    );
    assign tub_sel_out = tub_sel_in;
    always @(*)
    begin
        case(in_b4)
        4'b0000: tub_control = 8'b1111_1100;
        4'b0001: tub_control = 8'b0110_0000;
        4'b0010: tub_control = 8'b1101_1010;
        4'b0011: tub_control = 8'b1111_0010;
        4'b0100: tub_control = 8'b0110_0110;
        4'b0101: tub_control = 8'b1011_0110;
        4'b0110: tub_control = 8'b1011_1110;
        4'b0111: tub_control = 8'b1110_0000;
        4'b1000: tub_control = 8'b1111_1110;
        4'b1001: tub_control = 8'b1110_0110;
        4'b1111: tub_control = 8'b0000_0010;
        default: tub_control = 8'b1001_1110; 
        endcase
    end
endmodule