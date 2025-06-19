`timescale 1ns/1ps
module skew_check (
  input wire clk1,
  input wire clk2,
  output reg sync
);
  always @(posedge clk1 or posedge clk2)
    sync <= clk1 & clk2;

  specify
    $skew(posedge clk1, posedge clk2, 2); // max skew allowed between clk1 and clk2 is 2ns
  endspecify
endmodule
