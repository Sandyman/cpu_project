`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 06:26:22 PM
// Design Name: 
// Module Name: register_file
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
`include "reg_file_if.sv"

module register_file (reg_file_if.RTL _if);

    logic32 registers [31:0];

    assign _if.out_1 = registers[_if.rs];
    assign _if.out_2 = registers[_if.rt];

    always_ff @ (posedge _if.clk)
    begin
        if (_if.rst)
            for (integer i = 0; i < 'd32; i = i + 1)
                registers[i] <= 'd0;
        else
            if (_if.wr)
                if (_if.rd != 0)
                    registers[_if.rd] <= _if.in;
                else
                    registers[0] <= 'd0;
    end

endmodule
