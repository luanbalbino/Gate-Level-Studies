`timescale 1ps/1ps
module tb;
    reg A, B;
    wire OUT;

    // Instance of the test_and module
    test_and uut (.OUT(OUT), .A(A), .B(B));

    initial begin
      $display("Start timing violation test");
      $monitor("%0t: A=%b B=%b OUT=%b", $time, A, B, OUT);

      // Initialization
      A = 0; B = 0;
      #10;

      // CASE 1: Passes setup and hold for A and B (well-separated transitions)
      $display("\nCASE 1 - No violations expected");
      A = 1; B = 0;
      #20;  
      B = 1;  // OUT should rise here
      #30;

      // CASE 2: Setup violation on A (A changes too close to the OUT rising edge)
      $display("\nCASE 2 - Setup violation on A expected");
      A = 0;
      #5;
      B = 1;
      #2;    // Less than 5 ps setup for A before posedge OUT
      A = 1;
      #20;

      // CASE 3: Hold violation on A (A changes right after OUT rising edge)
      $display("\nCASE 3 - Hold violation on A expected");
      A = 1; B = 0;
      #10;
      B = 1; // posedge OUT
      #2;    // Less than 5 ps hold after the edge
      A = 0; // A hold violation
      #20;

      // CASE 4: Setup violation on B (B changes too close to OUT rising edge)
      $display("\nCASE 4 - Setup violation on B expected");
      A = 1; B = 0;
      #10;
      B = 1;
      #3;  // Less than 8 ps setup for B before posedge OUT
      B = 0;
      #20;

      // CASE 5: Hold violation on B (B changes right after OUT rising edge)
      $display("\nCASE 5 - Hold violation on B expected");
      A = 1; B = 0;
      #10;
      B = 1; // posedge OUT
      #3;    // Less than 5 ps hold after the edge
      B = 0; // B hold violation
      #20;

      // CASE 6: Another hold violation on A to reinforce the test
      $display("\nCASE 6 - Hold violation on A expected again");
      A = 1; B = 0;
      #10;
      B = 1; // posedge OUT
      #1;    // Less than 5 ps hold
      A = 0; // A hold violation
      #20;

      $finish;
  end
endmodule
