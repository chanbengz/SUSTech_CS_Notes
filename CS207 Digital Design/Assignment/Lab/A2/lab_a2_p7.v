module lab_a2_p7(
	input [3:0] in,
	output more1
	);
	wire [15:0] in_reg;
	assign in_reg = 16'b1110100010000000;
    MUX_16_1 mux(.sel(in), .data_in(in_reg), .data_out(more1));
endmodule