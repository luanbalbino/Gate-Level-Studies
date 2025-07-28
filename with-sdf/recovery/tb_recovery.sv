`timescale 1ns/1ps
module tb;
  logic async = 0, clk = 0;
  wire out;

  recovery dut (.async(async), .clk(clk), .out(out));

  initial begin
    $sdf_annotate("recovery.sdf", dut);
    $display("Start $recovery violation test");
    $monitor("%0t: clk=%b async=%b out=%b", $time, clk, async, out);

    async = 0; clk = 0;
    #10 async = 1;
    #6 clk = 1; // < 5ns between async and clk, should violate
    #10 $finish;
  end
endmodule
