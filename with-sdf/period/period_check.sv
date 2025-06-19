`timescale 1ns/1ps

module period_check (
  input wire clk,
  output logic toggled
);

  initial toggled = 0;

  always @(posedge clk)
    toggled <= ~toggled;

  specify
    $period(posedge clk, 10); // minimum, can be overwritten by SDF
  endspecify

endmodule