`timescale 1ps/1ps
 module top;
  reg A, B, C;
  or_nand i1 (OUT, A, B, C);
  initial begin
      $monitor($time, , "A=%b B=%b C=%b OUT=%b", A, B, C, OUT);
      A = 0; B = 0; C = 0;
      #10 C = 1;
      #5 A = 1;
      #5 B = 1;
      #1000 $finish;
  end
 endmodule