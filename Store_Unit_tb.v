module marv32_store_unit_tb;
  // Inputs
  reg [1:0] funct3_in;
  reg [31:0] iadder_in;
  reg [31:0] rs2_in;
  reg mem_wr_req_in;
  reg ahb_ready_in;
  
  // Outputs
  wire [31:0] d_addr_out;
  wire [31:0] data_out;
  wire [3:0] wr_mask_out;
  wire [1:0] ahb_htrans_out;
  wire wr_req_out;

  // Instantiate the marv32_store_unit module
  marv32_store_unit uut (
    .funct3_in(funct3_in),
    .iadder_in(iadder_in),
    .rs2_in(rs2_in),
    .mem_wr_req_in(mem_wr_req_in),
    .ahb_ready_in(ahb_ready_in),
    .d_addr_out(d_addr_out),
    .data_out(data_out),
    .wr_mask_out(wr_mask_out),
    .ahb_htrans_out(ahb_htrans_out),
    .wr_req_out(wr_req_out)
  );

  // Define clock and reset signals
  reg clk;
  reg reset;

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #10 reset = 1;
    #10 reset = 0;
    // Add more test cases here
    // Test case 1: Store byte
    funct3_in = 2'b00;
    iadder_in = 32'h1000;
    rs2_in = 32'hA5;
    mem_wr_req_in = 1;
    ahb_ready_in = 1;
    // Add more test cases here

    $finish; // End simulation
  end

  // Testbench logic here (provide stimulus as needed)

endmodule

