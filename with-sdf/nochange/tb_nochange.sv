`timescale 1ns/1ps
module tb;
  logic clk = 0, a = 0;
  wire y;

  nochange dut (.clk(clk), .a(a), .y(y));

  initial begin
    $sdf_annotate("nochange.sdf", dut);
    $display("Start $nochange violation test");

    a = 1;
    #3 clk = 1;
    #1 a = 0; // violates hold requirement after clk
    #10 $finish;
  end
endmodule
