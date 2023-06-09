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
`include "reg_if.sv"

module register (reg_if _if);

    always_ff @ (posedge _if.clk)
    begin
        if (_if.rst)
            _if.out <= 32'd0;
        else
            _if.out <= _if.in;
    end

endmodule
