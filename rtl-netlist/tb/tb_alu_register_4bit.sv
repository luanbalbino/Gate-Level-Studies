module tb_alu_register_4bit;
    logic clk, reset;
    logic [3:0] data_in;
    logic [1:0] alu_op;
    logic load;
    logic [3:0] data_out;
    logic zero_flag;

    alu_register_4bit dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .alu_op(alu_op),
        .load(load),
        .data_out(data_out),
        .zero_flag(zero_flag)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        data_in = 0;
        alu_op = 0;
        load = 0;

        #12;
        reset = 1;

        for (int op = 0; op < 4; op++) begin
            alu_op = op;
            repeat(3) begin 
                @(negedge clk);
                data_in = $urandom_range(0, 15);
                load = 1;
                @(posedge clk);   
                @(negedge clk);   
                load = 0;         
                $display("ALU_OP=%b | data_in=0x%01h | data_out=0x%01h | zero_flag=%b", alu_op, data_in, data_out, zero_flag);
            end
        end

        $finish;
    end
endmodule
