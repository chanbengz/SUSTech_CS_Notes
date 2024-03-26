module adderTb();
    reg [2:0] in1, in2;
    wire overflow1, overflow2;
    wire [2:0] sum, res;
    adder ad(in1, in2, sum, overflow1);
    subtraction sb(in1, in2, res, overflow2);
    
    initial begin
        {in1,in2} = 6'b0;
        repeat(15) #10 {in1,in2} = {in1,in2} + 1;
        #10 $finish;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, adderTb);
    end
endmodule