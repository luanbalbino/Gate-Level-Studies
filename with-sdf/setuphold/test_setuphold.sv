`timescale 1ps/1ps

module test_setuphold(input wire clk, input wire d, output reg q);

  always @(posedge clk)
    q <= d;

  specify
    // Setup e Hold separados
    $setup(d, posedge clk, 5);
    $hold (d, posedge clk, 3);

    // Ou combinados:
    //$setuphold(posedge clk, d, 5, 3);
  endspecify

endmodule
