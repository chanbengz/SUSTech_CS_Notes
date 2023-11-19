module lab_a1_p1(
  input A,
  input B,
  input C,
  input D,
  output X,
  output Y
);

  wire not_A, and_BC;
  not n1 (not_A, A);
  and a1 (and_BC, B, C);

  wire xnor_D_notA;
  xnor x1 (xnor_D_notA, not_A, D);

  wire nand_notA_x1, or_BC_notA;
  nand n1 (nand_notA_x1, not_A, xnor_D_notA);
  or o1 (or_BC_notA, and_BC, not_A);

  and a2 (Y, nand_notA_x1, or_BC_notA);
  or o2 (X, or_BC_notA, xnor_D_notA);
endmodule
