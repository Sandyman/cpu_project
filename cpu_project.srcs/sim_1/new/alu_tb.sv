`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2023 08:24:32 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    alu_if      alu0();
    alu         dut(alu0.RTL);
    
    logic32 out_1, out_2;
    logic5 ctrl;
    logic16 imm;
    logic32 imm32;
    logic33 imm33s;
    logic32 result;
    
    assign alu0.imm = imm;
    assign alu0.ctrl = ctrl;
    assign result = alu0.dest;
    assign alu0.src_1 = out_1;
    assign alu0.src_2 = out_2;
    assign imm32 = { {16{imm[15]}}, imm };
    assign imm33s = { {17{imm[15]}}, imm };

    initial
    begin
        imm <= 2 << 6;
        ctrl <= CTRL_SLL;
        out_1 <= 1;
        out_2 <= 6;

        #1
        imm <= 24 << 6;
        ctrl <= CTRL_SRL;
        out_1 <= 1;
        out_2 <= 32'hffffffff;

        #1
        imm <= 24 << 6;
        ctrl <= CTRL_SRA;
        out_1 <= 1;
        out_2 <= 32'hffffffff;

        #1
        imm <= 24 << 6;
        ctrl <= CTRL_SRA;
        out_1 <= 1;
        out_2 <= 32'h7fffffff;

        #1
        imm <= 0;
        ctrl <= CTRL_SLLV;
        out_1 <= 4;
        out_2 <= 1;

        #1
        ctrl <= CTRL_SRLV;
        out_1 <= 5;
        out_2 <= 32'h8fffffff;

        #1
        ctrl <= CTRL_SRAV;
        out_1 <= 16;
        out_2 <= 32'h7fffffff;

        #1
        ctrl <= CTRL_SRAV;
        out_1 <= 3;
        out_2 <= 32'hffffffff;

        #1
        imm = 32767;
        ctrl <= CTRL_ADDI;
        out_1 <= 1;
        out_2 <= 32768;

        #1
        imm = 32768;
        ctrl <= CTRL_ADDI;
        out_1 <= 1;
        out_2 <= 32768;

        #1
        imm = 32767;
        ctrl <= CTRL_ADDIU;
        out_1 <= 1;
        out_2 <= 32768;

        #1
        imm = 32768;
        ctrl <= CTRL_ADDIU;
        out_1 <= 1;
        out_2 <= 32768;

        #1
        ctrl <= CTRL_SLTIU;
        imm = 32768;
        out_1 <= 1;
        out_2 <= 32'hffffffff;
        
        #1
        ctrl <= CTRL_SLTIU;
        imm = 32768;
        out_1 <= 1;
        out_2 <= 32'hffff7000;

        #1
        ctrl <= CTRL_ANDI;
        imm = 16'h7fe1;
        out_1 <= 1;
        out_2 <= 32'hffff4e21;

        #1
        ctrl <= CTRL_ORI;
        imm = 16'hc038;
        out_1 <= 1;
        out_2 <= 32'hff3f4831;

        #1
        imm <= 0;
        ctrl <= CTRL_ADD;
        out_1 <= 1;
        out_2 <= 2;

        #1
        ctrl <= CTRL_ADD;
        out_1 <= 2;
        out_2 <= -1; 
        
        #1
        ctrl <= CTRL_ADD;
        out_1 <= 32768;
        out_2 <= -128;
        
        #1
        ctrl <= CTRL_AND;
        out_1 <= 32'hffffffff;
        out_2 <= 32'h55aa55aa;
        
        #1
        ctrl <= CTRL_XOR;
        out_1 <= 32'hffffffff;
        out_2 <= 32'h55aa55aa;

        #1
        ctrl <= CTRL_NOR;
        out_1 <= 32'h55aa55aa;
        out_2 <= 32'h00330033;

        #1
        ctrl <= CTRL_SLTU;
        out_1 <= 10;
        out_2 <= 5;

        #1
        ctrl <= CTRL_SLTU;
        out_1 <= 100000;
        out_2 <= 5000000;

        #1
        ctrl <= CTRL_SLT;
        out_1 <= -3;
        out_2 <= 5;

        #1
        ctrl <= CTRL_SLT;
        out_1 <= -3;
        out_2 <= -5;

        #1  
        $finish;
    end
endmodule
