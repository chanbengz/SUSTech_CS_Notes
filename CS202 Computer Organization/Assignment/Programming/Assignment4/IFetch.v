module IFetch (
    input clk, rst,
	input branch, zero,
	input [31:0] imm32,
    output [31:0] inst
);
	reg [31:0] pc = 0;
	prgrom urom( .clka(clk), .addra(pc[16:2]), .douta(inst));

	always @(negedge clk) begin
		if (!rst) begin
			pc <= 0;
		end else if (branch && zero) begin
			pc <= pc + imm32;
		end else begin
			pc <= pc + 4;
		end
	end

endmodule
