`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 06:12:45 PM
// Design Name: 
// Module Name: reg_if
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

interface reg_if (input clk);

    logic rst;
    logic32 in;
    logic32 out;
    
    modport TB (input clk, out, output rst, in);
    
    modport RTL (input clk, rst, in, output out);

endinterface
