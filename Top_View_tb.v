module merv32_top_tb;

  reg ma_riscv32_rp_clk_in;
  reg ms_riscv32_mp_rst_in;
  reg [63:0] ms_riscv32_mp_rc_in;
  reg [31:0] ms_riscv32_mp_imaddr_out;
  reg [31:0] ms_riscv32_mp_instr_in;
  reg ms_riscv32_mp_instr_hready_in;
  wire [31:0] ms_riscv32_mp_dmaddr_out;
  wire [31:0] ms_riscv32_mp_dmdata_out;
  wire ms_riscv32_mp_drwr_req_out;
  wire [3:0] ms_riscv32_mp_drwr_mask_out;
  reg [31:0] ms_riscv32_mp_data_in;
  reg ms_riscv32_mp_data_hready_in;
  reg ms_riscv32_mp_hresp_in;
  wire [1:0] ms_riscv32_rp_data_htrans_out;
  reg ms_riscv32_mp_eirq_in;
  reg ms_riscv32_mp_tirq_in;
  reg ms_riscv32_mp_sirq_in;

  // Instantiate the merv32_top module
  merv32_top uut (
    .ma_riscv32_rp_clk_in(ma_riscv32_rp_clk_in),
    .ms_riscv32_mp_rst_in(ms_riscv32_mp_rst_in),
    .ms_riscv32_mp_rc_in(ms_riscv32_mp_rc_in),
    .ms_riscv32_mp_imaddr_out(ms_riscv32_mp_imaddr_out),
    .ms_riscv32_mp_instr_in(ms_riscv32_mp_instr_in),
    .ms_riscv32_mp_instr_hready_in(ms_riscv32_mp_instr_hready_in),
    .ms_riscv32_mp_dmaddr_out(ms_riscv32_mp_dmaddr_out),
    .ms_riscv32_mp_dmdata_out(ms_riscv32_mp_dmdata_out),
    .ms_riscv32_mp_drwr_req_out(ms_riscv32_mp_drwr_req_out),
    .ms_riscv32_mp_drwr_mask_out(ms_riscv32_mp_drwr_mask_out),
    .ms_riscv32_mp_data_in(ms_riscv32_mp_data_in),
    .ms_riscv32_mp_data_hready_in(ms_riscv32_mp_data_hready_in),
    .ms_riscv32_mp_hresp_in(ms_riscv32_mp_hresp_in),
    .ms_riscv32_rp_data_htrans_out(ms_riscv32_rp_data_htrans_out),
    .ms_riscv32_mp_eirq_in(ms_riscv32_mp_eirq_in),
    .ms_riscv32_mp_tirq_in(ms_riscv32_mp_tirq_in),
    .ms_riscv32_mp_sirq_in(ms_riscv32_mp_sirq_in)
  );

  // Create a clock signal
  reg clk = 0;
  always #5 clk = ~clk;

  // Initialize inputs
  initial begin
    ma_riscv32_rp_clk_in = 0;
    ms_riscv32_mp_rst_in = 1'b0;
    ms_riscv32_mp_rc_in = 64'h1234567890ABCDEF; // Example value
    ms_riscv32_mp_instr_in = 32'h800002B7; // Example instruction
    ms_riscv32_mp_instr_hready_in = 1'b1;
    ms_riscv32_mp_data_in = 32'h12345678; // Example data
    ms_riscv32_mp_data_hready_in = 1'b1;
    ms_riscv32_mp_hresp_in = 1'b0;
    ms_riscv32_mp_eirq_in = 1'b0;
    ms_riscv32_mp_tirq_in = 1'b0;
    ms_riscv32_mp_sirq_in = 1'b0;

    // Add more inputs for initialization as needed

    // Run simulations
    #10; // Wait for a few clock cycles

    // Verify outputs
    if (ms_riscv32_mp_dmaddr_out !== 32'h0) $display("Test failed: ms_riscv32_mp_dmaddr_out");
    if (ms_riscv32_mp_dmdata_out !== 32'h0) $display("Test failed: ms_riscv32_mp_dmdata_out");
    if (ms_riscv32_mp_drwr_req_out !== 1'b0) $display("Test failed: ms_riscv32_mp_drwr_req_out");
    if (ms_riscv32_mp_drwr_mask_out !== 4'h0) $display("Test failed: ms_riscv32_mp_drwr_mask_out");

    // Finish simulation
    $finish;
  end

  always begin
    #2.5 clk = ~clk;
  end

endmodule
