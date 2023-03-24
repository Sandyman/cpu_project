`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2023 06:15:15 PM
// Design Name: 
// Module Name: alu
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
`include "opcodes.svh"
`include "alu_if.sv"

module alu (alu_if.RTL _if);

    logic5 ctrl;
    logic32 src_1, src_2, dest;
    
    assign ctrl = _if.ctrl;
    assign _if.dest = dest;
    assign src_1 = _if.src_1;
    assign src_2 = _if.src_2;

    always_comb
    begin
        case (ctrl)
            CTRL_SLLV:  dest = src_2 << src_1;
            CTRL_SRLV:  dest = $signed(src_2) >>> src_1;
            CTRL_SRAV:  dest = src_2 >> src_1;
            CTRL_ADD:   dest = src_1 + src_2;
            CTRL_ADDU:  dest = src_1 + src_2;
            CTRL_SUB:   dest = src_1 - src_2;
            CTRL_SUBU:  dest = src_1 - src_2;
            CTRL_AND:   dest = src_1 & src_2;
            CTRL_OR:    dest = src_1 | src_2;
            CTRL_XOR:   dest = src_1 ^ src_2;
            CTRL_NOR:   dest = ~(src_1 | src_2);
            CTRL_SLTU:  dest = (src_1 < src_2);
            CTRL_SLT:   dest = ($signed(src_1) < $signed(src_2));   
            default:    dest = 0;
        endcase
    end

endmodule
