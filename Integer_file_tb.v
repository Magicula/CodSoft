module integer_file_tb;
  // Inputs
  reg clk_in;
  reg reset_in;
  reg [4:0] rs_1_addr_in;
  reg [4:0] rs_2_addr_in;
  reg [4:0] rd_addr_in;
  reg wr_en_in;
  reg [31:0] rd_in;

  // Outputs
  wire [31:0] rs_1_out;
  wire [31:0] rs_2_out;

  // Instantiate the integer_file module
  integer_file uut (
    .clk_in(clk_in),
    .reset_in(reset_in),
    .rs_1_addr_in(rs_1_addr_in),
    .rs_2_addr_in(rs_2_addr_in),
    .rs_1_out(rs_1_out),
    .rs_2_out(rs_2_out),
    .rd_addr_in(rd_addr_in),
    .wr_en_in(wr_en_in),
    .rd_in(rd_in)
  );

  // Clock generation
  always begin
    #5 clk_in = ~clk_in;
  end

  // Reset generation
  initial begin
    reset_in = 1'b1;
    #10 reset_in = 1'b0;
  end

  // Stimulus generation
  initial begin
    clk_in = 0;
    rs_1_addr_in = 5'b00100; // Test values for rs_1_addr_in
    rs_2_addr_in = 5'b00011; // Test values for rs_2_addr_in
    rd_addr_in = 5'b01010; // Test value for rd_addr_in
    wr_en_in = 1'b0; // Disable write
    rd_in = 32'h12345678; // Test value for rd_in

    // Check the outputs
    if (rs_1_out !== 32'b0) begin
      $display("Test failed: rs_1_out is incorrect when wr_en_in is 0");
    end

    if (rs_2_out !== 32'b0) begin
      $display("Test failed: rs_2_out is incorrect when wr_en_in is 0");
    end

    // Enable write and write data
    wr_en_in = 1'b1;
    rd_in = 32'hABCDEF01;

    #10; // Allow some time for the signals to propagate

    // Check the outputs after write
    if (rs_1_out !== 32'b0) begin
      $display("Test failed: rs_1_out is incorrect after write");
    end

    if (rs_2_out !== 32'b0) begin
      $display("Test failed: rs_2_out is incorrect after write");
    end

    // Change rs_1 and rs_2 addresses
    rs_1_addr_in = 5'b01010; // New address for rs_1
    rs_2_addr_in = 5'b01100; // New address for rs_2

    #10; // Allow some time for the signals to propagate

    // Check the outputs after changing addresses
    if (rs_1_out !== 32'hABCDEF01) begin
      $display("Test failed: rs_1_out is incorrect after changing rs_1 address");
    end

    if (rs_2_out !== 32'h0) begin
      $display("Test failed: rs_2_out is incorrect after changing rs_2 address");
    end

    $finish;
  end
endmodule

