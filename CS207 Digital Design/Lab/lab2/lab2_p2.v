module lab2_p2(input x, input y, input z, output B);
	wire not_x, not_y, x_and_ny, nx_and_z;

	not nx (not_x, x);
	not ny (not_y, y);
	and a1 (x_and_ny, x, not_y);
	and a2 (nx_and_z, not_x, z);
	or o1(B, x_and_ny, nx_and_z);
endmodule