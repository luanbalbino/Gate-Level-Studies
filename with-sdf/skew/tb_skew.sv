`timescale 1ns/1ps
module tb;
  logic clk1 = 0, clk2 = 0;
  wire sync;

  skew_check dut (.clk1(clk1), .clk2(clk2), .sync(sync));

  initial begin
    $sdf_annotate("skew_check.sdf", dut);
    $display("Start $skew violation test");
    $monitor("%0t: clk1=%b clk2=%b sync=%b", $time, clk1, clk2, sync);

    clk1 = 0; clk2 = 0;
    #10 clk1 = 1;
    #1 clk2 = 1;  // < 2ns apart, should trigger $skew violation
    #10 $finish;
  end
endmodule
