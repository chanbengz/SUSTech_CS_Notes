// Bus Widths
`define DATA_WID    31:0
`define REGS_WID     4:0
`define OP_WID       6:0
// Opcode
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
    input                  clk,
    input      [`DATA_WID] inst, wdata,
    input                  regWrite,
    output reg [`DATA_WID] rdata1, rdata2,
    output     [`DATA_WID] imm
);

    reg  [`DATA_WID] regs [0:31];
    wire [`REGS_WID] rs1, rs2, rd;
    wire [`OP_WID]   opcode;
    assign opcode = inst[6:0];
    assign rs1 = (opcode == `LUI_OP || opcode == `AUIPC_OP || opcode == `JAL_OP) ? 0 : inst[19:15];
    assign rs2 = (opcode == `ART_IMM_OP || opcode == `STORE_OP || opcode == `BRANCH_OP) ? inst[24:20] : 0;
    assign rd  = (opcode == `STORE_OP || opcode == `BRANCH_OP) ? 0 : inst[11:7];

    imm32 imm_inst(
        .inst(inst),
        .imm(imm)
    );

    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            regs[i] = 0;
        end
    end

    always @(posedge clk) begin
        rdata1 <= regs[rs1];
        rdata2 <= regs[rs2];
        if (regWrite) begin
            regs[rd] <= rd ? wdata : 0;
        end else begin
            regs[rd] <= regs[rd];
        end
    end

endmodule

module imm32 (
    input      [`DATA_WID] inst,
    output reg [`DATA_WID] imm
);

    always @(*) begin
        if (inst[6:0] == `ART_IMM_OP | inst[6:0] == `LOAD_OP | inst[6:0] == `JALR_OP) begin   // I type
            imm[11:0] = inst[31:20];
            if (inst[31] == 0) begin
                imm[31:12] = 20'b0000_0000_0000_0000_0000;
            end
            else begin
                imm[31:12] = 20'b1111_1111_1111_1111_1111;
            end
        end
        else if (inst[6:0] == `STORE_OP) begin        // S type
            imm[11:0] = {inst[31:25], inst[11:7]};
            if (inst[31] == 0) begin
                imm[31:12] = 20'b0000_0000_0000_0000_0000;
            end
            else begin
                imm[31:12] = 20'b1111_1111_1111_1111_1111;
            end
        end
        else if (inst[6:0] == `BRANCH_OP) begin        // B type
            imm[12:0] = {inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
            if (inst[31] == 0) begin
                imm[31:13] = 19'b0000_0000_0000_0000_000;
            end
            else begin
                imm[31:13] = 19'b1111_1111_1111_1111_111;
            end
        end
        else if (inst[6:0] == `LUI_OP | inst[6:0] == `AUIPC_OP) begin        // U type
            imm[31:12] = inst[31:12];
            imm[11:0] = 12'b0000_0000_0000;
        end
        else if (inst[6:0] == `JAL_OP) begin        // J type
            imm[20:0] = {inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};
            if (inst[31] == 0) begin
                imm[31:21] = 11'b0000_0000_000;
            end
            else begin
                imm[31:21] = 11'b1111_1111_111;
            end
        end
        else begin                                     // R type and others
            imm[31:0] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        end
    end

endmodule
