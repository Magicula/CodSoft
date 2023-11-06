module Imm_gen_tb;
  // Inputs
  reg [2:0] imm_type_in;
  reg [32:7] inst_in;

  // Outputs
  wire [31:0] imm_out;

  // Instantiate the Imm_gen module
  Imm_gen uut (
    .imm_type_in(imm_type_in),
    .inst_in(inst_in),
    .imm_out(imm_out)
  );

  // Stimulus generation
  initial begin
    imm_type_in = 3'b000; // Test case for imm_type_in = 000
    inst_in = 32'h12345678; // Example instruction

    // Check the output
    if (imm_out !== 32'hF0000000) begin
      $display("Test failed: imm_out is incorrect for imm_type_in = 000");
    end

    imm_type_in = 3'b001; // Test case for imm_type_in = 001

    // Check the output
    if (imm_out !== 32'hF0000000) begin
      $display("Test failed: imm_out is incorrect for imm_type_in = 001");
    end

    imm_type_in = 3'b010; // Test case for imm_type_in = 010

    // Check the output
    if (imm_out !== 32'h00F00078) begin
      $display("Test failed: imm_out is incorrect for imm_type_in = 010");
    end

    // Other test cases can be added as needed

    $finish;
  end
endmodule

