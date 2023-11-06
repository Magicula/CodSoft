// Testbench for PCMux module
module PCMux_tb;

  // Inputs
  reg rst_in;
  reg [1:0] pc_src_in;
  reg [31:0] ecp_in;
  reg [31:0] trap_address_in;
  reg branch_taken_in;
  reg [31:1] iaddr_in;
  reg ahb_ready_in;
  reg [31:0] pc_in;

  // Outputs
  wire [31:0] iaddr_out;
  wire [31:0] pc_plus_4_out;
  wire misaligned_instr_logic_out;
  wire [31:0] pc_mux_out;

  // Instantiate the PCMux module
  PCMux uut (
    .rst_in(rst_in),
    .pc_src_in(pc_src_in),
    .ecp_in(ecp_in),
    .trap_address_in(trap_address_in),
    .branch_taken_in(branch_taken_in),
    .iaddr_in(iaddr_in),
    .ahb_ready_in(ahb_ready_in),
    .pc_in(pc_in),
    .iaddr_out(iaddr_out),
    .pc_plus_4_out(pc_plus_4_out),
    .misaligned_instr_logic_out(misaligned_instr_logic_out),
    .pc_mux_out(pc_mux_out)
  );

  // Clock generation
  reg clk;
  always begin
    #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    rst_in = 1'b1;
    #10 rst_in = 1'b0;
  end

  // Stimulus generation
  initial begin
    // Provide inputs and simulate
    clk = 0;
    pc_src_in = 2'b00; // Set pc_src_in to 00
    ecp_in = 32'd1234;
    trap_address_in = 32'd5678;
    branch_taken_in = 1'b0;
    iaddr_in = 32'b0000110000000000;
    ahb_ready_in = 1'b1;
    pc_in = 32'd9876;

    #10; // Allow some time for the internal signals to settle

    // Check the outputs
    if (pc_mux_out !== 32'd9876) begin
      $display("Test failed: pc_mux_out is incorrect");
    end
    if (iaddr_out !== 32'b0000110000000000) begin
      $display("Test failed: iaddr_out is incorrect");
    end
    if (misaligned_instr_logic_out !== 1'b0) begin
      $display("Test failed: misaligned_instr_logic_out is incorrect");
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

