`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 06:22:32 PM
// Design Name: 
// Module Name: reg_file_if
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

interface reg_file_if (input clk);

    reg_addr_t rd;  // destination (for write)
    reg_addr_t rs;  // source 1
    reg_addr_t rt;  // source 2
    logic wr;       // write enable
    logic rst;      // reset
    logic32 in;     // input
    logic32 out_1;  // output 1 (rs)
    logic32 out_2;  // output 2 (rt)
    
    modport RTL (input clk, in, rd, rs, rt, wr, rst, output out_1, out_2);

endinterface
