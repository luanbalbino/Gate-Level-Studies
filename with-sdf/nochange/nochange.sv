`timescale 1ns/1ps
module nochange (
  input wire a,
  input wire clk,
  output reg y
);
  always @(posedge clk)
    y <= a;

  specify
    $nochange(posedge clk, a, 3, 3); // a must remain stable 3ns before and after clk
  endspecify
endmodule
