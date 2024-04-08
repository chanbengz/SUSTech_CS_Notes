`timescale 1ns / 1ps

// Bus Widths
`define DATA_WID    31:0
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

module lab8_p1 (
    input [31:0] inst,
    output reg writeR, writeM
);

    always @* begin
        case (inst[6:0])
            `ART_LOG_OP: begin
                writeR = 1;
                writeM = 0;
            end
            `ART_IMM_OP: begin
                writeR = 1;
                writeM = 0;
            end
            `LOAD_OP: begin
                writeR = 1;
                writeM = 0;
            end
            `STORE_OP: begin
                writeR = 0;
                writeM = 1;
            end
            `BRANCH_OP: begin
                writeR = 0;
                writeM = 0;
            end
            `JALR_OP: begin
                writeR = 1;
                writeM = 0;
            end
            `JAL_OP: begin
                writeR = 1;
                writeM = 0;
            end
            `LUI_OP: begin
                writeR = 1;
                writeM = 0;
            end
            `AUIPC_OP: begin
                writeR = 1;
                writeM = 0;
            end
            default: begin
                writeR = 0;
                writeM = 0;
            end
        endcase
    end
    
endmodule