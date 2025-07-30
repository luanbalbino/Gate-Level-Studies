`timescale 1ns/1ps

module nand_module(a, b, out);
    input a, b;
    output out;

    assign out = ~(a & b);
    /*
    Using the pathdelay_sense specify property, the output transition time is recalculated even if the same output value
    is to be used.
    */
    specify
        // I dont think this works for questa, i'll test this after using Xcelium
        pathdelay_sense out, a, b;
        (a *> out) = (30, 29);
        (b *> out) = (10, 9);
    endspecify
endmodule