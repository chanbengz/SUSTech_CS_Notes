module xb2yg(input [3:0] xb, output [3:0] yg);
	xor x1 (yg[0], xb[0], xb[1]);
	xor x2 (yg[1], xb[1], xb[2]);
	xor x3 (yg[2], xb[2], xb[3]);
	buf b1 (yg[3], xb[3]);
endmodule