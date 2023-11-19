module lab_a2_p1(
	input signed [2:0] a,b,
	output reg sum_flag,
	output reg [2:0] sum_absolut
	);
	always @(a,b)
	begin
		if(a + b >= 0) begin
			sum_flag = 1'b0;
			sum_absolut = a + b;
		end
		else begin
			sum_flag = 1'b1;
			sum_absolut = - a - b;
		end
	end
endmodule