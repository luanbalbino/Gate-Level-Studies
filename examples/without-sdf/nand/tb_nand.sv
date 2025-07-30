`timescale 1ns/1ps
module tb_nand;
    logic a, b;
    wire o1;

    nand_module dut(.a(a), .b(b), .out(o1));

    initial begin
        a = 1;
        b = 1;
        #100

        a = 0;
        #1
        b = 0;

        #100
        $display("Tempo final = %t", $time);
        $finish;
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_nand);
    end
endmodule
