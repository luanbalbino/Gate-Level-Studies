module tb_full_adder;
    logic a, b, cin, clk, reset;
    logic sum, cout;

    full_adder dut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        a = 0; b = 0; cin = 0;

        #12;
        reset = 0;

        for (int i = 0; i < 4; i++) begin
            {a, b, cin} = i[2:0];
            #10;
            $display("a=%0b b=%0b cin=%0b -> sum=%0b cout=%0b", a, b, cin, sum, cout);
        end

        reset = 1;
        #25;
        reset = 0;

        for (int i = 4; i < 8; i++) begin
            {a, b, cin} = i[2:0];
            #10;
            $display("a=%0b b=%0b cin=%0b -> sum=%0b cout=%0b", a, b, cin, sum, cout);
        end

        $finish;
    end
endmodule
