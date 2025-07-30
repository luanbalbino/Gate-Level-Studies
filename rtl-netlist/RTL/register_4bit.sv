module register_4bit (
    input  logic        clk,    
    input  logic        reset,  
    input  logic [3:0]  data_in, 
    output logic [3:0]  data_out  
);

    always_ff @(posedge clk) begin
        if (reset) begin
            data_out <= 4'b0000;
        end else begin
            data_out <= data_in;
        end
    end

endmodule
