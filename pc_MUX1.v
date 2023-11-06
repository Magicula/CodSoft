module PCMux(
input rst_in,
input [1:0] pc_src_in,
input [31:0] ecp_in,
input [31:0] trap_address_in,
input branch_taken_in,
input [31:1] iaddr_in,
input ahb_ready_in,
input [31:0] pc_in,
output [31:0] iaddr_out,
output [31:0] pc_plus_4_out,
output misaligned_instr_logic_out,
output reg [31:0] pc_mux_out);
reg [31:0] i_addr;
parameter Boot_address=32'd0;
wire [31:0] next_pc;
assign misaligned_instr_logic_out=branch_taken_in & next_pc[1];
assign pc_plus_4_out=pc_in+32'd0000004;
assign next_pc=branch_taken_in?{iaddr_in,1'b0}: pc_plus_4_out;
assign i_addr_out=i_addr;
always @(*)
begin
    case(pc_src_in)
        0:pc_mux_out=Boot_address;
        1:pc_mux_out=ecp_in;
        2:pc_mux_out=trap_address_in;
        3:pc_mux_out=next_pc;
        default:pc_mux_out=next_pc;
    endcase
end
always @(*)
    begin
        if(rst_in)
            i_addr= Boot_address;
        else if (ahb_ready_in)
            i_addr=pc_mux_out;
    end
endmodule
