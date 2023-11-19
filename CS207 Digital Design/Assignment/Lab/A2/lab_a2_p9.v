module lab_a2_p9(
	input [3:0] in,
	output more1
	);
	wire [15:0] out;
    Decoder_4_16 dec(.in(in), .out(out));
	or or0(more1, out[7], out[11], out[13], out[14], out[15]);
endmodule