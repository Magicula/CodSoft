module msrv32_dec_tb;
  // Inputs
  reg [6:0] opcode_in;
  reg funct7_5_in;
  reg [2:0] funct3_in;
  reg [1:0] iadder_1_to_0_in;
  reg trap_taken_in;

  // Outputs
  wire [3:0] alu_opcode_out;
  wire mem_wr_req_out;
  wire [1:0] load_size_out;
  wire load_unsigned_out;
  wire alu_src_out;
  wire iadder_src_out;
  wire csr_wr_en_out;
  wire rf_wr_en_out;
  wire [2:0] wb_mux_sel_out;
  wire [2:0] imm_type_out;
  wire [2:0] csr_op_out;
  wire illegal_instr_out;
  wire misaligned_load_out;
  wire misaligned_store_out;

  // Instantiate the msrv32_dec module
  msrv32_dec uut (
    .opcode_in(opcode_in),
    .funct7_5_in(funct7_5_in),
    .funct3_in(funct3_in),
    .iadder_1_to_0_in(iadder_1_to_0_in),
    .trap_taken_in(trap_taken_in),
    .alu_opcode_out(alu_opcode_out),
    .mem_wr_req_out(mem_wr_req_out),
    .load_size_out(load_size_out),
    .load_unsigned_out(load_unsigned_out),
    .alu_src_out(alu_src_out),
    .iadder_src_out(iadder_src_out),
    .csr_wr_en_out(csr_wr_en_out),
    .rf_wr_en_out(rf_wr_en_out),
    .wb_mux_sel_out(wb_mux_sel_out),
    .imm_type_out(imm_type_out),
    .csr_op_out(csr_op_out),
    .illegal_instr_out(illegal_instr_out),
    .misaligned_load_out(misaligned_load_out),
    .misaligned_store_out(misaligned_store_out)
  );

  // Testbench logic here (provide stimulus as needed)

endmodule

