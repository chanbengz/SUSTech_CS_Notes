module lab_a1_p2(input A, input B, input C, input D, output X, output Y);
	wire nA, AD, ABC;

	assign AD = (A & ~D) | (~A & D);
	assign nA = ~(~A & AD);
	assign ABC = (~A | (B & C));

	assign Y = nA & ABC;
	assign X = AD | ABC;
endmodule