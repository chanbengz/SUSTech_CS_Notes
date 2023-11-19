module lab_a2_p6(
	input [3:0] in,
	output reg more1
	);
    always @(in) begin
		case(in)
			4'b1111: more1 = 1'b1;
			4'b1110: more1 = 1'b1;
			4'b1101: more1 = 1'b1;
			4'b1011: more1 = 1'b1;
			4'b0111: more1 = 1'b1;
			default: more1 = 1'b0;
		endcase
	end
endmodule