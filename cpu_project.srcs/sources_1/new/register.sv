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


module register(
    input [11:0] in,
    output [11:0] out,
    input rst,
    input clk
    );

logic [11:0] data = 12'd0;

assign out = data;

always @ (posedge clk, posedge rst)
begin
    if (rst)
        data <= 12'd0;
    else
        data <= in;
end

endmodule
