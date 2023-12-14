module T_FF_pos_rst_n_by_JKFF(
    input T, clk, rst_n,
    output Q, Qn
    );
    wire J, nT, K;
    not (nT, T);
    or (K, nT, rst_n);
    and (J, T, rst_n);
    JK_FF_Pos u (
        .J(J), .K(K), .clk(clk),
        .Q(Q), .Qn(Qn)
    );
endmodule
