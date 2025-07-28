`timescale 1ns/1ps
module tb;
  logic async = 0, clk = 0;
  wire out;

  removal dut (.async(async), .clk(clk), .out(out));

  initial begin
    $sdf_annotate("removal.sdf", dut);
    $display("Start $removal violation test");
    $monitor("%0t: clk=%b async=%b out=%b", $time, clk, async, out);

    async = 1; clk = 0;
    #10 async = 0;
    #4 clk = 1; // < 5ns between removal and clk, should violate
    #10 $finish;
  end
endmodule
