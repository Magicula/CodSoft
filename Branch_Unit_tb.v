module branch_tb;
  // Inputs
  reg [6:2] opcode_6_to_2_in;
  reg [2:0] funct3_in;
  reg [31:0] rs1_in;
  reg [31:0] rs2_in;

  // Outputs
  wire branch_taken_out;

  // Instantiate the branch module
  branch uut (
    .opcode_6_to_2_in(opcode_6_to_2_in),
    .funct3_in(funct3_in),
    .rs1_in(rs1_in),
    .rs2_in(rs2_in),
    .branch_taken_out(branch_taken_out)
  );

  // Stimulus generation
  initial begin
    // Test case 1: BEQ
    opcode_6_to_2_in = 7'b1100011; // BEQ opcode
    funct3_in = 3'b000; // Funct3 for BEQ
    rs1_in = 32'h00000001;
    rs2_in = 32'h00000001;

    // Check the output
    if (branch_taken_out !== 1'b1) begin
      $display("Test failed: branch_taken_out is incorrect for BEQ");
    end

    // Test case 2: BNE
    funct3_in = 3'b001; // Funct3 for BNE
    rs2_in = 32'h00000002;

    // Check the output
    if (branch_taken_out !== 1'b0) begin
      $display("Test failed: branch_taken_out is incorrect for BNE");
    end

    // Test case 3: BLT
    funct3_in = 3'b100; // Funct3 for BLT
    rs1_in = 32'hFFFFFFFE;
    rs2_in = 32'h00000002;

    // Check the output
    if (branch_taken_out !== 1'b1) begin
      $display("Test failed: branch_taken_out is incorrect for BLT");
    end

    // Test case 4: BGE
    funct3_in = 3'b101; // Funct3 for BGE
    rs1_in = 32'hFFFFFFFE;
    rs2_in = 32'h00000001;

    // Check the output
    if (branch_taken_out !== 1'b0) begin
      $display("Test failed: branch_taken_out is incorrect for BGE");
    end

    // Test case 5: BLTU
    funct3_in = 3'b110; // Funct3 for BLTU
    rs1_in = 32'h00000001;
    rs2_in = 32'hFFFFFFFF;

    // Check the output
    if (branch_taken_out !== 1'b0) begin
      $display("Test failed: branch_taken_out is incorrect for BLTU");
    end

    // Test case 6: BGEU
    funct3_in = 3'b111; // Funct3 for BGEU

    // Check the output
    if (branch_taken_out !== 1'b1) begin
      $display("Test failed: branch_taken_out is incorrect for BGEU");
    end

    // Other test cases can be added as needed

    $finish;
  end
endmodule

