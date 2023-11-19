module lab_a2_p10();
    reg[3:0] in;
    wire a2_p5_somin, a2_p5_pomax, a2_p6_more1, a2_p7_more1, a2_p8_more1, a2_p9_more1;
    lab_a2_p5 uut5(.a(in[3]), .b(in[2]), .c(in[1]), .d(in[0]), .more1_somin(a2_p5_somin), .more1_pomax(a2_p5_pomax));
    lab_a2_p6 uut6(.in(in), .more1(a2_p6_more1));
    lab_a2_p7 uut7(.in(in), .more1(a2_p7_more1));
    lab_a2_p8 uut8(.in(in), .more1(a2_p8_more1));
    lab_a2_p9 uut9(.in(in), .more1(a2_p9_more1));

    initial begin
		$monitor ("%d %d %d %d %d %d %d", in, a2_p5_somin, a2_p5_pomax, a2_p6_more1, a2_p7_more1, a2_p8_more1, a2_p9_more1);
		in = 4'b0000;
		repeat(15) begin
			#10 in = in + 1;
		end
		#10 $finish;
	end
endmodule