`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2023 06:23:47 PM
// Design Name: 
// Module Name: alu_if
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

interface alu_if;

    logic32 dest;
    logic32 src_1;
    logic32 src_2;
    logic16 imm;
    logic5 ctrl;
    
    modport TB (input dest, output src_1, src_2, ctrl, imm);

    modport RTL (input src_1, src_2, ctrl, imm, output dest);
    
endinterface
