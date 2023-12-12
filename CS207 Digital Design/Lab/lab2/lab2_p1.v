module lab2_p1(input x, input y, input z, output A);
	wire not_x, not_y, x_and_not_y, not_x_and_z;

	not nx (not_x, x);
	not ny (not_y, y);
	and a1 (x_and_not_y, x, not_y);
	and a2 (not_x_and_z, not_x, z);
	or o1(A, x_and_not_y, not_x_and_z);
endmodule