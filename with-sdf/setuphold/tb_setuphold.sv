`timescale 1ps/1ps

module tb;

  logic clk = 0;
  logic d = 0;
  wire q;

  // Instância do DUT
  setuphold uut (.clk(clk), .d(d), .q(q));

  // Clock de 10 ps
  always #5 clk = ~clk;

`ifdef SDF_TEST
  initial begin
      // there's other possibilities of arguments, see the guide
      $sdf_annotate("setuphold.sdf", uut);
  end
`endif

  initial begin

    $display("Start setup/hold violation demo");
    $monitor("%0t: clk=%b d=%b q=%b", $time, clk, d, q);

    // Espera o sistema estabilizar
    #10;

    // CASO 1: Sem violação
    $display("\nCASE 1 - No violations");
    d = 0;
    #2 d = 1;
    #6; // distância suficiente para passar setup e hold
    d = 0;
    #10;

    // CASO 2: Viola setup (d muda muito perto do clk)
    $display("\nCASE 2 - Setup violation expected");
    d = 1;
    #8; // muda a 2ps antes do clk -> viola setup=5
    d = 0;
    #10;

    // CASO 3: Viola hold (d muda muito cedo após clk)
    $display("\nCASE 3 - Hold violation expected");
    d = 1;
    #2; // muda 2ps depois do clk -> viola hold=3
    d = 0;
    #10;

    // CASO 4: Viola ambos (setup e hold)
    $display("\nCASE 4 - Setup & Hold violation with setuphold");
    d = 1;
    #4 d = 0; // muda entre 4ps antes e 3ps depois -> viola ambos
    #10;

    $finish;
  end
endmodule
