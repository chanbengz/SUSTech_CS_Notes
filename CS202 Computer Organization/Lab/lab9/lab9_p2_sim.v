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

module lab9_p2_sim();
    reg clk;
    reg [`DATA_WID] inst, wdata;
    wire regWrite;
    wire [`DATA_WID] rdata1, rdata2, imm;

    Control control(
        .inst(inst),
        .writeR(regWrite)
    );

    Decoder decoder(
        .clk(clk),
        .inst(inst),
        .wdata(wdata),
        .regWrite(regWrite),
        .rdata1(rdata1),
        .rdata2(rdata2),
        .imm(imm)
    );

    initial begin
        $dumpfile("lab9_p2_sim.vcd");
        $dumpvars(0, lab9_p2_sim);
    end

    initial begin
        clk = 0;
        #1 clk = 1;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial fork
        inst = 32'h06408093;
        wdata = 0;
        
        #5 inst = 32'h00110133;
        #5 wdata = wdata + 1;

        #15 inst = 32'h00110023;
        #15 wdata = wdata + 1;

        #25 inst = 32'h00010183;
        #25 wdata = wdata + 1;

        #35 inst = 32'h00000263;
        #35 wdata = wdata + 1;

        #45 inst = 32'h004000ef;
        #45 wdata = wdata + 1;

        #55 inst = 32'h00064237;
        #55 wdata = wdata + 1;

        #65 inst = 32'h00000097;
        #65 wdata = wdata + 1;

        #70 $finish;
    join

endmodule

module Control (
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
