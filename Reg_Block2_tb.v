module msrv32_reg_block_2_tb;
  // Inputs
  reg [4:0] rd_addr_in;
  reg [11:0] csr_addr_in;
  reg [31:0] rs1_in;
  reg [31:0] rs2_in;
  reg [31:0] pc_in;
  reg [31:0] pc_plus_4_in;
  reg [31:0] iadder_in;
  reg [31:0] imm_in;
  reg [3:0] alu_opcode_in;
  reg [1:0] load_size_in;
  reg [2:0] wb_mux_sel_in;
  reg [2:0] csr_op_in;
  reg load_unsigned_in;
  reg alu_src_in;
  reg csr_wr_en_in;
  reg rf_wr_en_in;
  reg branch_taken;
  reg clk_in;
  reg reset_in;

  // Outputs
  wire [4:0] rd_addr_reg_out;
  wire [11:0] csr_addr_reg_out;
  wire [31:0] rs1_reg_out;
  wire [31:0] rs2_reg_out;
  wire [31:0] pc_reg_out;
  wire [31:0] pc_plus_4_reg_out;
  wire [31:0] iadder_out_reg_out;
  wire [3:0] alu_opcode_reg_out;
  wire [1:0] load_size_reg_out;
  wire load_unsigned_reg_out;
  wire alu_src_reg_out;
  wire csr_wr_en_reg_out;
  wire rf_wr_en_reg_out;
  wire [2:0] wb_mux_sel_reg_out;
  wire [2:0] csr_op_reg_out;
  wire [31:0] imm_reg_out;

  // Instantiate the msrv32_reg_block_2 module
  msrv32_reg_block_2 uut (
    .rd_addr_in(rd_addr_in),
    .csr_addr_in(csr_addr_in),
    .rs1_in(rs1_in),
    .rs2_in(rs2_in),
    .pc_in(pc_in),
    .pc_plus_4_in(pc_plus_4_in),
    .iadder_in(iadder_in),
    .imm_in(imm_in),
    .alu_opcode_in(alu_opcode_in),
    .load_size_in(load_size_in),
    .wb_mux_sel_in(wb_mux_sel_in),
    .csr_op_in(csr_op_in),
    .load_unsigned_in(load_unsigned_in),
    .alu_src_in(alu_src_in),
    .csr_wr_en_in(csr_wr_en_in),
    .rf_wr_en_in(rf_wr_en_in),
    .branch_taken(branch_taken),
    .clk_in(clk_in),
    .reset_in(reset_in),
    .rd_addr_reg_out(rd_addr_reg_out),
    .csr_addr_reg_out(csr_addr_reg_out),
    .rs1_reg_out(rs1_reg_out),
    .rs2_reg_out(rs2_reg_out),
    .pc_reg_out(pc_reg_out),
    .pc_plus_4_reg_out(pc_plus_4_reg_out),
    .iadder_out_reg_out(iadder_out_reg_out),
    .alu_opcode_reg_out(alu_opcode_reg_out),
    .load_size_reg_out(load_size_reg_out),
    .load_unsigned_reg_out(load_unsigned_reg_out),
    .alu_src_reg_out(alu_src_reg_out),
    .csr_wr_en_reg_out(csr_wr_en_reg_out),
    .rf_wr_en_reg_out(rf_wr_en_reg_out),
    .wb_mux_sel_reg_out(wb_mux_sel_reg_out),
    .csr_op_reg_out(csr_op_reg_out),
    .imm_reg_out(imm_reg_out)
  );

  // Testbench logic here (provide stimulus as needed)

endmodule

