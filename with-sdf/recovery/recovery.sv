`timescale 1ns/1ps
module recovery_check (
  input wire async,
  input wire clk,
  output reg out
);
  always @(posedge clk)
    out <= async;

  specify
    $recovery(posedge async, posedge clk, 5); // async must recover 5ns before clk
  endspecify
endmodule
