module marv32_alu_tb;
  // Inputs
  reg [31:0] op_1_in;
  reg [31:0] op_2_in;
  reg [3:0] opcode_in;

  // Outputs
  wire [31:0] result_out;

  // Instantiate the marv32_alu module
  marv32_alu uut (
    .op_1_in(op_1_in),
    .op_2_in(op_2_in),
    .opcode_in(opcode_in),
    .result_out(result_out)
  );

  // Test cases
  initial begin
    // Test Case 1: ADD
    op_1_in = 32'h00000001;
    op_2_in = 32'h00000002;
    opcode_in = 4'b0000;
    // result_out should be op_1_in + op_2_in = 32'h00000003
    if (result_out !== 32'h00000003) $display("Test Case 1 Failed");

    // Test Case 2: SUB
    op_1_in = 32'h00000003;
    op_2_in = 32'h00000002;
    opcode_in = 4'b1000;
    // result_out should be op_1_in - op_2_in = 32'h00000001
    if (result_out !== 32'h00000001) $display("Test Case 2 Failed");

    // Add more test cases for other instructions

    $finish; // End simulation
  end
endmodule

