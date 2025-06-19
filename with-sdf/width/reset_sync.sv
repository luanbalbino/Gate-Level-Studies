// rtl/reset_sync.v
`timescale 1ns/1ps

module reset_sync (
    input  wire clk,
    input  wire rst_n,
    output reg  valid
);

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      valid <= 0;
    else
      valid <= 1;
  end

  specify
    $width(negedge rst_n, 3); // rst minimum width =  5ns
  endspecify

endmodule
