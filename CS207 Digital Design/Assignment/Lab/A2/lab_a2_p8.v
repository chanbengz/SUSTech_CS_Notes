module lab_a2_p8(
	input [3:0] in,
	output more1
	);
    wire [7:0] in_reg;
	assign in_reg = {1'b1, in[3], in[3], 1'b0, in[3], 3'b000};
    MUX_8_1 mux(.sel(in[2:0]), .data_in(in_reg), .data_out(more1));
endmodule