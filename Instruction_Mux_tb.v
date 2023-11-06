module marv32_instruction_decoder_tb;
  // Inputs
  reg flush_in;
  reg [31:0] instr_in;

  // Outputs
  wire [6:0] opcode_out;
  wire [2:0] funct3_out;
  wire [31:0] funct7_out;
  wire [4:0] rs1_addr_out;
  wire [4:0] rs2_addr_out;
  wire [4:0] rd_addr_out;
  wire [11:0] csr_addr_out;
  wire [24:0] instr_31_7_out;

  // Instantiate the marv32_instruction_decoder module
  marv32_instruction_decoder uut (
    .flush_in(flush_in),
    .instr_in(instr_in),
    .opcode_out(opcode_out),
    .funct3_out(funct3_out),
    .funct7_out(funct7_out),
    .rs1_addr_out(rs1_addr_out),
    .rs2_addr_out(rs2_addr_out),
    .rd_addr_out(rd_addr_out),
    .csr_addr_out(csr_addr_out),
    .instr_31_7_out(instr_31_7_out)
  );

  // Stimulus generation
  initial begin
    // Test case 1: Normal instruction
    flush_in = 1'b0;
    instr_in = 32'h12345678;

    // Check the outputs
    if (opcode_out !== 7'b1001001) begin
      $display("Test failed: opcode_out is incorrect for normal instruction");
    end

    if (funct3_out !== 3'b000) begin
      $display("Test failed: funct3_out is incorrect for normal instruction");
    end

    if (funct7_out !== 32'h12) begin
      $display("Test failed: funct7_out is incorrect for normal instruction");
    end

    if (rs1_addr_out !== 5'b00100) begin
      $display("Test failed: rs1_addr_out is incorrect for normal instruction");
    end

    if (rs2_addr_out !== 5'b00101) begin
      $display("Test failed: rs2_addr_out is incorrect for normal instruction");
    end

    if (rd_addr_out !== 5'b00000) begin
      $display("Test failed: rd_addr_out is incorrect for normal instruction");
    end

    if (csr_addr_out !== 12'b000000000001) begin
      $display("Test failed: csr_addr_out is incorrect for normal instruction");
    end

    if (instr_31_7_out !== 25'h000091A3) begin
      $display("Test failed: instr_31_7_out is incorrect for normal instruction");
    end

    // Test case 2: Flush instruction
    flush_in = 1'b1;

    // Check the outputs
    if (opcode_out !== 7'b0000011) begin
      $display("Test failed: opcode_out is incorrect for flush instruction");
    end

    if (funct3_out !== 3'b000) begin
      $display("Test failed: funct3_out is incorrect for flush instruction");
    end

    if (funct7_out !== 32'h00) begin
      $display("Test failed: funct7_out is incorrect for flush instruction");
    end

    if (rs1_addr_out !== 5'b00000) begin
      $display("Test failed: rs1_addr_out is incorrect for flush instruction");
    end

    if (rs2_addr_out !== 5'b00000) begin
      $display("Test failed: rs2_addr_out is incorrect for flush instruction");
    end

    if (rd_addr_out !== 5'b00000) begin
      $display("Test failed: rd_addr_out is incorrect for flush instruction");
    end

    if (csr_addr_out !== 12'b000000000000) begin
      $display("Test failed: csr_addr_out is incorrect for flush instruction");
    end

    if (instr_31_7_out !== 25'h00000000) begin
      $display("Test failed: instr_31_7_out is incorrect for flush instruction");
    end

    // Other test cases can be added as needed

    $finish;
  end
endmodule

