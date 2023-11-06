module reg_block_tb;
  // Inputs
  reg clk_in;
  reg rst_in;
  reg [31:0] pc_mux_in;

  // Outputs
  wire [32:0] pc_out;

  // Instantiate the reg_block module
  reg_block uut (
    .clk_in(clk_in),
    .rst_in(rst_in),
    .pc_mux_in(pc_mux_in),
    .pc_out(pc_out)
  );

  // Clock generation
  always begin
    #5 clk_in = ~clk_in;
  end

  // Reset generation
  initial begin
    rst_in = 1'b1;
    #10 rst_in = 1'b0;
  end

  // Stimulus generation
  initial begin
    clk_in = 0;
    pc_mux_in = 32'h1234;

    #10; // Allow some time for the signals to propagate

    // Check the outputs
    if (pc_out !== 33'b0) begin
      $display("Test failed: pc_out is incorrect");
    end

    // De-assert reset
    rst_in = 1'b1;
    #10 rst_in = 1'b0;

    #10; // Allow some time for the signals to propagate

    if (pc_out !== {1'b0, pc_mux_in}) begin
      $display("Test failed: pc_out is incorrect");
    end

    $finish;
  end

  // Simulation control
  initial begin
    // Simulate for a period
    #100;

    $finish;
  end
endmodule

