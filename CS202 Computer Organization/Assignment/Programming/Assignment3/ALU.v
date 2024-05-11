module ALU (
	input [31:0] ReadData1,
    input [31:0] ReadData2,
    input [31:0] imm32,
    input [1:0]  ALUOp, 
    input [2:0]  funct3, 
    input [6:0]  funct7, 
    input ALUSrc, 
    output reg [31:0] ALUResult,
    output zero
);
	wire [31:0] src1, src2;
	assign src1 = ReadData1;
	assign src2 = ALUSrc ? imm32 : ReadData2;
	assign zero = ALUResult == 0;

	always @(*) begin
		case(ALUOp)
			2'b00: begin
				ALUResult = $signed(src1) + $signed(src2);
			end
			2'b01: begin
				ALUResult = $signed(src1) - $signed(src2);
			end
			2'b10: begin
				case({funct7, funct3})
					10'b0000000_000: ALUResult = $signed(src1) + $signed(src2);
					10'b0100000_000: ALUResult = $signed(src1) - $signed(src2);
					10'b0000000_111: ALUResult = src1 & src2;
					10'b0000000_110: ALUResult = src1 | src2;
				endcase
			end
			default: begin
				ALUResult = 0;
			end
		endcase
	end

endmodule
