// tb/tb_reset_sync.sv
`timescale 1ns/1ps

module tb;

  logic clk = 0;
  logic rst_n;
  wire valid;

  reset_sync dut (.clk(clk), .rst_n(rst_n), .valid(valid));

  // Clock: 10ns
  always #5 clk = ~clk;

  initial begin
    $sdf_annotate("reset_sync.sdf", dut);
    $display("Start test with $width on rst_n");
    $monitor("%0t: rst_n=%b valid=%b", $time, rst_n, valid);

    // Normal reset
    rst_n = 0;
    #10;
    rst_n = 1;
    #20;

    // Glitch (violação $width)
    $display("\nCASE 1 - Reset glitch (width violation expected)");
    rst_n = 0;
    #3;      // menor que 5ns
    rst_n = 1;
    #20;

    $finish;
  end

endmodule
