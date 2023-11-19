`timescale 1ns / 1ps
module lab3_p1_sim();
    reg x_tb, y_tb, z_tb;
    wire o1_tb, o2_tb, o3_tb;
    
    lab3_p1 TEST (
        .x(x_tb),
        .y(y_tb),
        .z(z_tb),
        .o1(o1_tb),
        .o2(o2_tb),
        .o3(o3_tb)
    );
    
    initial begin
        {x_tb, y_tb, z_tb} = 3'b000;
        repeat(7) begin
            #10 {x_tb, y_tb, z_tb} = {x_tb, y_tb, z_tb} + 1;
        end
        #10 $finish;
    end

    /*iverilog */
    initial
    begin            
        $dumpfile("wave.vcd");
        $dumpvars(0, lab3_p1_sim);
    end
    /*iverilog */
endmodule
