`timescale 1ns/1ps

module tb;

  logic clk = 0;
  wire toggled;

  period_check dut (.clk(clk), .toggled(toggled));

  always #4 clk = ~clk;

  initial begin
    $sdf_annotate("period_check.sdf", dut);
    $display("Start $period check test");
    $monitor("%0t: clk=%b toggled=%b", $time, clk, toggled);

    #50;
    $finish;
  end

endmodule
