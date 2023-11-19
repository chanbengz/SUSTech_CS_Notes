module lab_a1_p1(input A, input B, input C, input D, output X, output Y);
	wire not_A, and_BC, nand_A, or_ABC, xnor_AD;

	not n1 (not_A, A);
	and a1 (and_BC, B, C);
	xnor x1 (xnor_AD, not_A, D);
	or o1 (or_ABC, not_A, and_BC);
	nand na1 (nand_A, not_A, xnor_AD);

	or out1 (X, xnor_AD, or_ABC);
	and out2 (Y, nand_A, or_ABC);
endmodule