`timescale 1ns/1ps

module tb_dummy;

  logic clk = 0;
  logic rstn;
  logic d;
  logic q, q2;

  dummy dummy_inst (
    .clk(clk),
    .rstn(rstn),
    .d(d),
    .q(q)
  );

  dummy dummy_inst2 (
    .clk(clk),
    .rstn(rstn),
    .d(d),
    .q(q2)
  );

  always #5 clk = ~clk; // 10ns clock period

`ifdef SDF_TEST
  initial begin
      // there's other possibilities of arguments, see the guide
      $display("i'm here....");
      $sdf_annotate("dummy.sdf", dummy_inst);
      $sdf_annotate("second_dummy.sdf", dummy_inst2);
  end
`endif

  initial begin
    $display("Start simulation");
    rstn = 0;
    d    = 0;
    #15;
    rstn = 1;
    #10;

    d = 1; #10;
    d = 0; #10;
    d = 1; #10;

    $finish;
  end

endmodule
