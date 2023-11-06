module imm_addr_tb;
  // Inputs
  reg [31:0] pc_in;
  reg [31:0] rs1_in;
  reg [31:0] imm_in;
  reg iadd;

  // Outputs
  wire [31:0] iadd_out;

  // Instantiate the imm_addr module
  imm_addr uut (
    .pc_in(pc_in),
    .rs1_in(rs1_in),
    .imm_in(imm_in),
    .iadd(iadd),
    .iadd_out(iadd_out)
  );

  // Stimulus generation
  initial begin
    // Test case 1: iadd is 1 (true)
    pc_in = 32'h12345678;
    rs1_in = 32'h98765432;
    imm_in = 32'h0000000F;
    iadd = 1'b1;

    // Check the output
    if (iadd_out !== 32'h98765441) begin
      $display("Test failed: iadd_out is incorrect for iadd = 1");
    end

    // Test case 2: iadd is 0 (false)
    imm_in = 32'h00000001;
    iadd = 1'b0;

    // Check the output
    if (iadd_out !== 32'h12345679) begin
      $display("Test failed: iadd_out is incorrect for iadd = 0");
    end

    // Other test cases can be added as needed

    $finish;
  end
endmodule

