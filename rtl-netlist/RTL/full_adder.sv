module full_adder (
    input  logic clk, reset,
    input  logic a, b, cin,
    output logic sum, cout
);
    logic sum_next, cout_next;

    always_comb begin
        sum_next  = a ^ b ^ cin;
        cout_next = (a & b) | (a & cin) | (b & cin);
    end

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sum  <= 0;
            cout <= 0;
        end else begin
            sum  <= sum_next;
            cout <= cout_next;
        end
    end
endmodule
