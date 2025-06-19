`timescale 1ns/1ps

module tb_ALU;
    logic [7:0] i1, i2;
    logic [2:1] opcode;
    wire [7:0] o1;

    ALU dut(o1, i1, i2, opcode);

    initial begin
        // INIT
        i1 = 8'd0;
        i2 = 8'd0;
        opcode = 2'b00;

        // add: i1 + i2
        opcode = 2'b00; 
        i1 = 8'd5; 
        i2 = 8'd10; #20;
        i1 = 8'd8; #20;
        i2 = 8'd20; #20;
        
        opcode = 2'b01; 
        i1 = 8'd100; 
        i2 = 8'd77; #20;
        i1 = 8'd55; #20;
        
        opcode = 2'b10; i1 = 8'd33; i2 = 8'd200; #20;
        i2 = 8'd88; #20;

        i1 = 8'd10; 
        i2 = 8'd25;
        opcode = 2'b00; #25;
        i1 = 8'd8; 
        i2 = 8'd2;    
        opcode = 2'b01; #25;   
        i1 = 8'd1; 
        i2 = 8'd28;  
        opcode = 2'b10; #25;
        $display("Tempo final = %t", $time);
        $finish;
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_ALU);
    end
endmodule
