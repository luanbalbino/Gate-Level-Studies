`timescale 1ps/1ps
module test_and(OUT, A, B);
    output OUT;
    input A, B;
    and i1 (OUT, A, B);
    
    /*
      In this example, the inputs A and B transition to 1 at time 10. The default path delay selection algorithm schedules the
      transition at OUT by selecting the shorter delay of 5, specified for the path from A to OUT.
    */
    
    specify
      (A => OUT) = 1;
      (B => OUT) = 10;
    
      $setup(A, posedge OUT, 5);
      $hold(A, posedge OUT, 5);
    
      $setup(B, posedge OUT, 8);
      $hold(B, posedge OUT, 5);
    endspecify
    
endmodule