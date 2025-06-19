`timescale 1ns/1ps
module removal_check (
  input wire async,
  input wire clk,
  output reg out
);
  always @(posedge clk)
    out <= async;

  specify
    $removal(posedge async, posedge clk, 5); // async must be removed 5ns before clk
  endspecify
endmodule
