module tb;
    logic clk = 0;
    logic d;
    logic q;

    dff dff_inst (.clk(clk), .d(d), .q(q));

    // Clock period: 10 time units
    always #5 clk = ~clk;

    initial begin
        $sdf_annotate("dff.sdf", dff_inst);
        $display("Start of setup timing test");
        $display("All the cases will fail");
    
        apply_violation(4, 10, "CASE 1");
        apply_violation(1, 12, "CASE 2");
        apply_violation(7, 10, "CASE 3");
        apply_violation(11, 9, "CASE 4");
        apply_violation(15, 5, "CASE 5");
        apply_violation(19, 1, "CASE 6");
    
        #20;
        $finish;
    end

    task apply_violation(input int delay_before, input int delay_after, input string label);
        d = 0;
        $display("[%0t] %s", $time, label);
        #delay_before d = 1;
        #delay_after;
    endtask
   
endmodule
