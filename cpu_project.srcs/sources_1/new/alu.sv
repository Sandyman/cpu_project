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
    logic5 shamt;
    logic16 imm;
    logic32 src_1, src_2, dest, imm32;
    logic33 imm33u;

    assign ctrl = _if.ctrl;
    assign imm = _if.imm;
    assign shamt = imm[10:6];
    assign _if.dest = dest;
    assign src_1 = _if.src_1;
    assign src_2 = _if.src_2;
    assign imm32 = { {16{imm[15]}}, imm };
    assign imm33s = { imm[15], imm32 };

    always_comb
    begin
        case (ctrl)
            CTRL_SLL:   dest = src_2 << shamt;
            CTRL_SRL:   dest = src_2 >> shamt;
            CTRL_SRA:   dest = $signed(src_2) >>> shamt;
            CTRL_SLLV:  dest = src_2 << src_1;
            CTRL_SRLV:  dest = src_2 >> src_1;
            CTRL_SRAV:  dest = $signed(src_2) >>> src_1;
            CTRL_ADDI:
            begin
                logic33 src33s, dest33;
                src33s = { src_2[31], src_2 };
                dest33 = src33s + imm33s;
                dest = dest33[31:0];
            end
            CTRL_ADDIU: dest = src_2 + imm32;
            CTRL_SLTI:  dest = ( $signed(src_2) < imm32 );
            CTRL_SLTIU:
            begin
                // {imm} is sign-extended but we do an UNsigned comparison
                logic33 src33u = { 0, src_2 };
                dest = ( src33u < imm33u );
            end
            CTRL_ANDI:  dest = src_2 & imm;
            CTRL_ORI:   dest = src_2 | imm;
            CTRL_XORI:  dest = src_2 ^ imm;
            CTRL_ADD:   dest = src_1 + src_2;
            CTRL_ADDU:  dest = src_1 + src_2;
            CTRL_SUB:   dest = src_1 - src_2;
            CTRL_SUBU:  dest = src_1 - src_2;
            CTRL_AND:   dest = src_1 & src_2;
            CTRL_OR:    dest = src_1 | src_2;
            CTRL_XOR:   dest = src_1 ^ src_2;
            CTRL_NOR:   dest = ~( src_1 | src_2 );
            CTRL_SLTU:  dest = ( src_1 < src_2 );
            CTRL_SLT:   dest = ( $signed(src_1) < $signed(src_2) );
            default:    dest = 0;
        endcase
    end

endmodule
