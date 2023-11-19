module lab_a2_p5(
	input a,b,c,d,
	output more1_somin, more1_pomax
	);
    assign more1_somin = (~a & b & c& d) | (a & ~b & c& d) | (a & b & ~c& d) | (a & b & c& ~d) | (a & b & c& d);
	assign more1_pomax = (a | b | c | d) & (a | b | c | ~d) & (a | b | ~c | d) & (a | b | ~c | ~d) & (a | ~b | c | d) & (a | ~b | c | ~d) & (a | ~b | ~c | d) & (~a | b | c | d) & (~a | b | c | ~d) & (~a | b | ~c | d) & (~a | ~b | c | d);
endmodule