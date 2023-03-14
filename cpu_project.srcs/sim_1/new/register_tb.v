`timescale 1ns / 1ns
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
reg[11:0] dut_in = 0;

integer i;

register dut(
    .in (dut_in),
    .out (dut_out),
    .rst (reset),
    .clk (clock)
);

always #2 clock <= ~clock;

initial
begin
    #3 reset <= 0;
    
    #3 for (i=0; i <= 12'b111111111111; i=i+1)
    begin
        #2 dut_in = i;
    end
end

endmodule
