`define ART_LOG_OP 7'b0110011  // R type
`define ART_IMM_OP 7'b0010011  // I type
`define LOAD_OP    7'b0000011  // I type
`define STORE_OP   7'b0100011  // S type for sb, sh, sw, I type for sd
`define BRANCH_OP  7'b1100011  // B type (SB type)
`define JALR_OP    7'b1100111  // I type
`define JAL_OP     7'b1101111  // J type (UJ type)
`define LUI_OP     7'b0110111  // U type
`define AUIPC_OP   7'b0010111  // U type

module Decoder (
      input clk, rst,
      input regWrite,
      input [31:0] inst,
      input [31:0] writeData,
      output [31:0] rs1Data, rs2Data,
      output reg [31:0] imm32 
);

	reg [31:0] regs [0:31];
	assign rs1Data = regs[inst[19:15]];
    assign rs2Data = regs[inst[24:20]];

	initial begin
		regs[0] = 0;
		regs[1] = 0;
		regs[2] = 0;
		regs[3] = 0;
		regs[4] = 0;
		regs[5] = 0;
		regs[6] = 0;
		regs[7] = 0;
		regs[8] = 0;
		regs[9] = 0;
		regs[10] = 0;
		regs[11] = 0;
		regs[12] = 0;
		regs[13] = 0;
		regs[14] = 0;
		regs[15] = 0;
		regs[16] = 0;
		regs[17] = 0;
		regs[18] = 0;
		regs[19] = 0;
		regs[20] = 0;
		regs[21] = 0;
		regs[22] = 0;
		regs[23] = 0;
		regs[24] = 0;
		regs[25] = 0;
		regs[26] = 0;
		regs[27] = 0;
		regs[28] = 0;
		regs[29] = 0;
		regs[30] = 0;
		regs[31] = 0;
	end

	always @(posedge clk) begin
        if (!rst) begin
            regs[0] <= 0;
			regs[1] <= 0;
			regs[2] <= 0;
			regs[3] <= 0;
			regs[4] <= 0;
			regs[5] <= 0;
			regs[6] <= 0;
			regs[7] <= 0;
			regs[8] <= 0;
			regs[9] <= 0;
			regs[10] <= 0;
			regs[11] <= 0;
			regs[12] <= 0;
			regs[13] <= 0;
			regs[14] <= 0;
			regs[15] <= 0;
			regs[16] <= 0;
			regs[17] <= 0;
			regs[18] <= 0;
			regs[19] <= 0;
			regs[20] <= 0;
			regs[21] <= 0;
			regs[22] <= 0;
			regs[23] <= 0;
			regs[24] <= 0;
			regs[25] <= 0;
			regs[26] <= 0;
			regs[27] <= 0;
			regs[28] <= 0;
			regs[29] <= 0;
			regs[30] <= 0;
			regs[31] <= 0;
        end  else if (regWrite) begin
            if (inst[11:7] != 0) regs[inst[11:7]] <= writeData;
        end
    end

	always @(*) begin
        if (inst[6:0] == `ART_IMM_OP | inst[6:0] == `LOAD_OP | inst[6:0] == `JALR_OP) begin   // I type
            imm32[11:0] = inst[31:20];
            if (inst[31] == 0) begin
                imm32[31:12] = 20'b0000_0000_0000_0000_0000;
            end
            else begin
                imm32[31:12] = 20'b1111_1111_1111_1111_1111;
            end
        end
        else if (inst[6:0] == `STORE_OP) begin        // S type
            imm32[11:0] = {inst[31:25], inst[11:7]};
            if (inst[31] == 0) begin
                imm32[31:12] = 20'b0000_0000_0000_0000_0000;
            end
            else begin
                imm32[31:12] = 20'b1111_1111_1111_1111_1111;
            end
        end
        else if (inst[6:0] == `BRANCH_OP) begin        // B type
            imm32[12:0] = {inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
            if (inst[31] == 0) begin
                imm32[31:13] = 19'b0000_0000_0000_0000_000;
            end
            else begin
                imm32[31:13] = 19'b1111_1111_1111_1111_111;
            end
        end
        else if (inst[6:0] == `LUI_OP | inst[6:0] == `AUIPC_OP) begin        // U type
            imm32[31:12] = inst[31:12];
            imm32[11:0] = 12'b0000_0000_0000;
        end
        else if (inst[6:0] == `JAL_OP) begin        // J type
            imm32[20:0] = {inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};
            if (inst[31] == 0) begin
                imm32[31:21] = 11'b0000_0000_000;
            end
            else begin
                imm32[31:21] = 11'b1111_1111_111;
            end
        end
        else begin                                     // R type and others
            imm32[31:0] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        end
    end

endmodule
