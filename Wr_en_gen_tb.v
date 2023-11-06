module wr_en_generator_tb;
  // Inputs
  reg flush_in;
  reg rf_wr_en_reg_in;
  reg csr_wr_en_reg_in;

  // Outputs
  wire wr_en_int_file_out;
  wire wr_en_csr_file_out;

  // Instantiate the wr_en_generator module
  wr_en_generator uut (
    .flush_in(flush_in),
    .rf_wr_en_reg_in(rf_wr_en_reg_in),
    .csr_wr_en_reg_in(csr_wr_en_reg_in),
    .wr_en_int_file_out(wr_en_int_file_out),
    .wr_en_csr_file_out(wr_en_csr_file_out)
  );

  // Stimulus generation
  initial begin
    // Test case 1: flush_in is 0
    flush_in = 1'b0;
    rf_wr_en_reg_in = 1'b1; // Enable write to int_file
    csr_wr_en_reg_in = 1'b0; // Disable write to csr_file

    // Check the outputs
    if (wr_en_int_file_out !== 1'b1) begin
      $display("Test failed: wr_en_int_file_out is incorrect when flush_in is 0");
    end

    if (wr_en_csr_file_out !== 1'b0) begin
      $display("Test failed: wr_en_csr_file_out is incorrect when flush_in is 0");
    end

    // Test case 2: flush_in is 1
    flush_in = 1'b1;

    // Check the outputs
    if (wr_en_int_file_out !== 1'b0) begin
      $display("Test failed: wr_en_int_file_out is incorrect when flush_in is 1");
    end

    if (wr_en_csr_file_out !== 1'b0) begin
      $display("Test failed: wr_en_csr_file_out is incorrect when flush_in is 1");
    end

    $finish;
  end
endmodule

