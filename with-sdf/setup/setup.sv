module setup (
    input clk,
    input d,
    output logic q
);
    always_ff @(posedge clk)
        q <= d;

    // d need to be stable at minimum 2 time units before clk posedge (this will be overwritten by the SDF file)
    specify
        $setup(d, posedge clk, 2);
    endspecify
endmodule