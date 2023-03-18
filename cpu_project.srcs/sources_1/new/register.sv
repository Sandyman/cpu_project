`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 07:59:59 PM
// Design Name: 
// Module Name: register
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

`include "types.svh"


module register(
    input logic32 in,
    output logic32 out,
    input rst,
    input clk
    );

logic32 data = 32'd0;

assign out = data;

always_ff @ (posedge clk)
begin
    if (rst)
        data <= 32'd0;
    else
        data <= in;
end

endmodule
