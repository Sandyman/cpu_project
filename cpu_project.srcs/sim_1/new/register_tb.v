`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 08:26:45 PM
// Design Name: 
// Module Name: register_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_tb;

reg reset = 1;
reg clock = 0;

wire[11:0] dut_out;
wire[11:0] dut_in;

register dut(
    .in (dut_in),
    .out (dut_out),
    .rst (reset),
    .clk (clock)
);

always #10 clock <= ~clock;

initial
begin
    #15 reset <= 0;
end

endmodule
