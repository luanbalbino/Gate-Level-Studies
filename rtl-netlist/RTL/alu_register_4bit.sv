module alu_register_4bit (
    input  logic        clk,
    input  logic        reset,
    input  logic [3:0]  data_in,
    input  logic [1:0]  alu_op,
    input  logic        load,
    output logic [3:0]  data_out,
    output logic        zero_flag
);

    logic [3:0] alu_result;

    // 00: data_in + 1
    // 01: data_in - 1
    // 10: data_in AND 4'b1010
    // 11: data_in OR  4'b0101

    always_comb begin
        case (alu_op)
            2'b00: alu_result = data_in + 4'd1;
            2'b01: alu_result = data_in - 4'd1;
            2'b10: alu_result = data_in & 4'b1010;
            2'b11: alu_result = data_in | 4'b0101;
            default: alu_result = 4'b0000;
        endcase
    end

    always_ff @(posedge clk or negedge reset) begin
        if (!reset)
            data_out <= 4'b0000;
        else if (load)
            data_out <= alu_result;
    end

    assign zero_flag = (data_out == 4'b0000);

endmodule
