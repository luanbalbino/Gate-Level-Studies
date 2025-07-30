module tb_register_4bit;
    logic clk, reset;
    logic [3:0] data_in;
    logic [3:0] data_out;

    register_4bit dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #10 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        data_in = 4'b0000;

        #12;
        reset = 0;

        for (int i = 0; i < 16; i++) begin
            data_in = i[3:0];
            #10;
            $display("data_in=%0h -> data_out=%0h", data_in, data_out);
        end

        reset = 1;
        #25;
        reset = 0;

        for (int i = 0; i < 16; i++) begin
            data_in = 5*(15 - i);
            #10;
            $display("data_in=%h -> data_out=%h", data_in, data_out);
        end

        $finish;
    end
endmodule
