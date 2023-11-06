module msrv32_lu (
    input [1:0] load_size_in,
    input clk_in,
    input load_unsigned_in,
    input [31:0] data_in,
    input [1:0] ladder_1_to_0_in,
    input ahb_resp_in,
    output reg [31:0] lu_output
);

reg [7:0] data_byte;
reg [15:0] data_half;
wire [23:0] byte_ext;
wire [15:0] half_ext;

always @(*)
begin
    if (!ahb_resp_in)
    begin
        case (load_size_in)
            2'b00: lu_output = {8'h00, data_byte};
            2'b01: lu_output = {16'h0000, data_half};
            2'b10: lu_output = 32'b0;
            2'b11: lu_output = data_in;
        endcase
    end
    else
    begin
        lu_output = 32'b0; // Set lu_output to zero when ahb_resp_in is active.
    end
end

always @(*)
begin
    case (ladder_1_to_0_in)
        2'b00: data_byte = data_in[7:0];
        2'b01: data_byte = data_in[15:8];
        2'b10: data_byte = data_in[23:16];
        2'b11: data_byte = data_in[31:24];
    endcase
end

always @(*)
begin
    case (ladder_1_to_0_in[1])
        1'b0: data_half = data_in[15:0];
        1'b1: data_half = data_in[31:16];
    endcase
end

assign byte_ext = load_unsigned_in ? {24 {data_byte[7]}} : 24'b0;
assign half_ext = load_unsigned_in ? {16 {data_half[15]}} : 16'b0;

endmodule

