`define ART_LOG_OP 7'b0110011  // R type
`define LOAD_OP    7'b0000011  // I type
`define STORE_OP   7'b0100011  // S type
`define BRANCH_OP  7'b1100011  // B type

module Controller (
    input  [31:0] inst, 
    output reg Branch, ALUSrc, MemRead, MemWrite, MemtoReg, RegWrite,
    output reg [1:0] ALUOp
);

    always @(*) begin
        case (inst[6:0])
            `ART_LOG_OP: begin
                Branch   = 0;
                ALUOp    = 2;
                ALUSrc   = 0;
                MemWrite = 0;
                MemRead  = 0;
                RegWrite = 1;
                MemtoReg = 0;
            end
            `LOAD_OP: begin
                Branch   = 0;
                ALUOp    = 0;
                ALUSrc   = 1;
                MemWrite = 0;
                MemRead  = 1;
                RegWrite = 1;
                MemtoReg = 1;
            end
            `STORE_OP: begin
                Branch   = 0;
                ALUOp    = 0;
                ALUSrc   = 1;
                MemWrite = 1;
                MemRead  = 0;
                RegWrite = 0;
                MemtoReg = 0;
            end
            `BRANCH_OP: begin
                Branch   = 1;
                ALUOp    = 1;
                ALUSrc   = 0;
                MemWrite = 0;
                MemRead  = 0;
                RegWrite = 0;
                MemtoReg = 0;
            end
            default: begin
                Branch   = 0;
                ALUOp    = 3;
                ALUSrc   = 0;
                MemWrite = 0;
                MemRead  = 0;
                RegWrite = 0;
                MemtoReg = 0;
            end
        endcase
    end

endmodule
