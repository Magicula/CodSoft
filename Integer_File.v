module Imm_gen (
    input [2:0] imm_type_in,
    input [32:7] inst_in,
    output reg [31:0] imm_out
);

    always @* begin
        case (imm_type_in)
            3'b000: imm_out = {inst_in[31], inst_in[31:30], {20{inst_in[31]}}};
            3'b001: imm_out = {inst_in[31], inst_in[31:30], {20{inst_in[31]}}};
            3'b010: imm_out = {inst_in[31], inst_in[31:25], inst_in[11:7], {15{1'b0}}};
            default: imm_out = 32'h0; // Default value in case of other imm_type_in values.
        endcase
    end

endmodule

