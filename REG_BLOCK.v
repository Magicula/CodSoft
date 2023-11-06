module reg_block (
    input clk_in, rst_in,
    input [31:0] pc_mux_in,
    output [32:0] pc_out
);
    parameter Boot_address = 32'h0;
    reg [32:0] pc_out_reg;

    always @(posedge clk_in or negedge rst_in)
    begin
        if (!rst_in)
            pc_out_reg <= 33'b0; // Initialize to 33 bits wide 0
        else
            pc_out_reg <= {1'b0, pc_mux_in};
    end

    assign pc_out = pc_out_reg;
endmodule

