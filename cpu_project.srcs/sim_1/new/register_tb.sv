`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 08:26:45 PM
// Design Name: 
// Module Name: register_tb
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


module register_tb;

    bit clk;

    always #10 clk = ~clk;
    
    reg_if  _reg0(clk);
    
    register dut(reg_if.RTL);

    logic rst;
    logic32 in_data;
    logic32 out_data;
    
    assign rst = _reg0.rst;
    assign out_data = _reg0.out;
    assign in_data = _reg0.in;
    
    initial
    begin
        _reg0.rst <= 1;
        _reg0.in <= 32'd0;

        #15 _reg0.rst <= 0;

        #30 _reg0.in <= 999;
        #60 _reg0.in <= 32'b11111111111111111111111111111111;
        #90 _reg0.in <= 1;
        #120 _reg0.in <= 100000;
        #150 _reg0.in <= 0;
        #180 _reg0.in <= 31 + 65536;
        #200 _reg0.rst <= 1;
        #220 _reg0.rst <= 0;
        #240 _reg0.in <= 1078;
        #260 $finish;       
    end
    
endmodule
