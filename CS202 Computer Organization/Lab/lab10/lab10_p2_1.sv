`include "Const.svh"

module ALU (
    input  logic [`DATA_WID ] src1, src2,
    input  logic [`ALUOP_WID] ALU_op,
    output logic [`DATA_WID ] result
);

    always_comb begin
        unique case (ALU_op)
        `ALU_AND:  result = src1 & src2;
        `ALU_OR :  result = src1 | src2;
        `ALU_XOR:  result = src1 ^ src2;
        `ALU_ADD:  result = $signed(src1) + $signed(src2);
        `ALU_SUB:  result = $signed(src1) - $signed(src2);
        `ALU_SLL:  result = src1 << src2[4:0];
        `ALU_SRL:  result = src1 >> src2[4:0];
        `ALU_SRA:  result = $signed(src1) >>> src2[4:0];
        `ALU_SLT:  result = ($signed(src1) < $signed(src2)) ? 1 : 0;
       `ALU_SLTU:  result = ($unsigned(src1) < $unsigned(src2)) ? 1 : 0;
         default:  result = 0;
        endcase
    end

endmodule
