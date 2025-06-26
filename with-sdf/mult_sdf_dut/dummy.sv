`timescale 1ns/1ps

module dummy (
  input  logic clk,
  input  logic rstn,
  input  logic d,
  output logic q
);
  logic q_int;

  always_ff @(posedge clk or negedge rstn) begin
    if (!rstn)
      q_int <= 0;
    else
      q_int <= d;
  end

  // just for test delay_mode unit/zero (this will be ignored or changed to 1), replace q with q_int above
  assign q = q_int;

  specify
    (d => q) = (5:5:5);
  endspecify

endmodule