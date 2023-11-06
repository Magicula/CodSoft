module msrv32_lu_tb;
  // Inputs
  reg [1:0] load_size_in;
  reg clk_in;
  reg load_unsigned_in;
  reg [31:0] data_in;
  reg [1:0] ladder_1_to_0_in;
  reg ahb_resp_in;

  // Outputs
  wire [31:0] lu_output;

  // Instantiate the msrv32_lu module
  msrv32_lu uut (
    .load_size_in(load_size_in),
    .clk_in(clk_in),
    .load_unsigned_in(load_unsigned_in),
    .data_in(data_in),
    .ladder_1_to_0_in(ladder_1_to_0_in),
    .ahb_resp_in(ahb_resp_in),
    .lu_output(lu_output)
  );

  // Define clock generation
  always begin
    #5 clk_in = ~clk_in;
  end

  // Test cases
  initial begin
    clk_in = 0;
    load_size_in = 2'b00;
    load_unsigned_in = 0;
    data_in = 32'hA5A5A5A5;
    ladder_1_to_0_in = 2'b00;
    ahb_resp_in = 0;

    // Test Case 1: Load byte with sign extension
    #10 ahb_resp_in = 1; // Simulate AHB response
    #10 ahb_resp_in = 0; // Deassert AHB response
    // lu_output should be sign-extended byte: 32'hFFFFFFA5
    if (lu_output !== 32'hFFFFFFA5) $display("Test Case 1 Failed");

    // Test Case 2: Load halfword with sign extension
    load_size_in = 2'b01;
    ladder_1_to_0_in = 2'b00;
    ahb_resp_in = 0;
    #10 ahb_resp_in = 1; // Simulate AHB response
    #10 ahb_resp_in = 0; // Deassert AHB response
    // lu_output should be sign-extended halfword: 32'hFFFFA5A5
    if (lu_output !== 32'hFFFFA5A5) $display("Test Case 2 Failed");

    // Add more test cases as needed

    $finish; // End simulation
  end
endmodule

