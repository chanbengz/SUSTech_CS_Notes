module MemUnit16_8(
    input clk, rw, rst_n,
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg data_valid
    );

    reg[7:0] mem [15:0];
    integer i;
    always @(posedge clk, negedge rst_n) begin
        if(~rst_n) begin
            data_out <= 8'b0;
            data_valid <= 1'b0;
            for (i=0;i<16;i=i+1) begin
                mem[i] <= 8'b0;
            end
        end
        else if(~rw) begin
            mem[addr] <= data_in;
            data_valid <= 1'b0;
        end
    end

    always @(rw, addr) begin
        if(rw) begin
            data_valid = 1'b1;
            case(addr)
                4'b0000: data_out = mem[0];
                4'b0001: data_out = mem[1];
                4'b0010: data_out = mem[2];
                4'b0011: data_out = mem[3];
                4'b0100: data_out = mem[4];
                4'b0101: data_out = mem[5];
                4'b0110: data_out = mem[6];
                4'b0111: data_out = mem[7];
                4'b1000: data_out = mem[8];
                4'b1001: data_out = mem[9];
                4'b1010: data_out = mem[10];
                4'b1011: data_out = mem[11];
                4'b1100: data_out = mem[12];
                4'b1101: data_out = mem[13];
                4'b1110: data_out = mem[14];
                4'b1111: data_out = mem[15];
                default: data_out = 8'b0;
            endcase
        end
    end
endmodule