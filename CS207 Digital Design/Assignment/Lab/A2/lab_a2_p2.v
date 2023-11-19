`timescale 1ns/1ps
module lab_a2_p2();
	reg [2:0] a, b;
	wire [2:0] sum_absolut;
	wire sum_flag;
	lab_a2_p1 u(.a(a), .b(b), .sum_flag(sum_flag), .sum_absolut(sum_absolut));
	initial begin
		$monitor ("%d %d %d %d", a, b, sum_flag, sum_absolut);
		{a,b} = 6'b000000;
		repeat(63) begin
			#10 {a,b} = {a,b} + 1;
		end
		#10 $finish;
	end
endmodule