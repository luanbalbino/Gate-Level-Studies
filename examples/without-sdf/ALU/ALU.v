`timescale 1ns/1ps

module ALU (o1, i1, i2, opcode);
    input  [7:0] i1, i2;
    input  [2:1] opcode;
    output reg [7:0] o1;

    always @(*) begin
        case (opcode)
            2'b00: o1 = i1 + i2;
            2'b01: o1 = i1 - i2;
            2'b10: o1 = i1 * i2;
            default: o1 = 8'h00;
        endcase
    end

    specify
        // Timing path delays depending on the opcode value:
        
        // SUM
        // When opcode is 2'b00 (SUM operation), the delays from inputs i1 and i2 to output o1 are both 15.0 time units.
        if (opcode == 2'b00)
        (i1, i2 *> o1) = (15.0, 15.0);
        
        // SUB
        // When opcode is 2'b01 (SUB operation), the delays from inputs i1 and i2 to output o1 are both 10.0 time units.
        if (opcode == 2'b01)
        (i1, i2 *> o1) = (10.0, 10.0);
        
        // MULT
        // When opcode is 2'b10 (MULT operation), the delays from inputs i1 and i2 to output o1 are both 7.0 time units.
        if (opcode == 2'b10)
            (i1, i2 *> o1) = (7.0, 7.0);

    endspecify
endmodule