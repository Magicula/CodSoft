module msrv32_wb_mux_sel_unit_tb;
  // Inputs
  reg [2:0] wb_mux_sel_reg_in;
  reg [31:0] alu_result_in;
  reg [31:0] lu_output_in;
  reg [31:0] imm_reg_in;
  reg [31:0] iadder_out_reg_in;
  reg [31:0] csr_data_in;
  reg [31:0] pc_plus_4_reg_in;
  reg [31:0] rs2_reg_in;
  reg alu_source_reg_in;

  // Outputs
  wire [31:0] wb_mux_out;
  wire [31:0] alu_2nd_src_mux_out;

  // Instantiate the msrv32_wb_mux_sel_unit module
  msrv32_wb_mux_sel_unit uut (
    .wb_mux_sel_reg_in(wb_mux_sel_reg_in),
    .alu_result_in(alu_result_in),
    .lu_output_in(lu_output_in),
    .imm_reg_in(imm_reg_in),
    .iadder_out_reg_in(iadder_out_reg_in),
    .csr_data_in(csr_data_in),
    .pc_plus_4_reg_in(pc_plus_4_reg_in),
    .rs2_reg_in(rs2_reg_in),
    .alu_source_reg_in(alu_source_reg_in),
    .wb_mux_out(wb_mux_out),
    .alu_2nd_src_mux_out(alu_2nd_src_mux_out)
  );

  // Test cases
  initial begin
    // Test Case 1: WB_ALU
    wb_mux_sel_reg_in = 3'b000;
    alu_result_in = 32'h00000003;
    lu_output_in = 32'h00000000;
    imm_reg_in = 32'h00000001;
    iadder_out_reg_in = 32'h00000004;
    csr_data_in = 32'h00000002;
    pc_plus_4_reg_in = 32'h00000005;
    rs2_reg_in = 32'h00000006;
    alu_source_reg_in = 1'b0;
    // wb_mux_out should be alu_result_in = 32'h00000003
    // alu_2nd_src_mux_out should be imm_reg_in = 32'h00000001
    if (wb_mux_out !== 32'h00000003 || alu_2nd_src_mux_out !== 32'h00000001) $display("Test Case 1 Failed");

    // Test Case 2: WB_LU
    wb_mux_sel_reg_in = 3'b001;
    alu_result_in = 32'h00000000;
    lu_output_in = 32'h00000007;
    imm_reg_in = 32'h00000008;
    iadder_out_reg_in = 32'h00000009;
    csr_data_in = 32'h0000000A;
    pc_plus_4_reg_in = 32'h0000000B;
    rs2_reg_in = 32'h0000000C;
    alu_source_reg_in = 1'b0;
    // wb_mux_out should be lu_output_in = 32'h00000007
    // alu_2nd_src_mux_out should be imm_reg_in = 32'h00000008
    if (wb_mux_out !== 32'h00000007 || alu_2nd_src_mux_out !== 32'h00000008) $display("Test Case 2 Failed");

    // Add more test cases for other mux selections

    $finish; // End simulation
  end
endmodule

