module imm_addr(
input [31:0] pc_in,rs1_in,imm_in,
input iadd,
output [31:0] iadd_out);
assign iadd_out=iadd?(rs1_in+imm_in):pc_in+imm_in;
endmodule
