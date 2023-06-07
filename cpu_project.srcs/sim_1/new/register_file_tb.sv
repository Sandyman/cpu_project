`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 06:55:07 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;

    bit clk;

    always #4 clk = ~clk;

    reg_file_if     reg_file0(clk);
    register_file   dut(reg_file0.RTL);
    
    logic rst;
    logic wr;
    reg_addr_t rd;
    reg_addr_t rs;
    reg_addr_t rt;
    logic32 in;
    logic32 out_1;
    logic32 out_2;

    assign rst = reg_file0.rst;
    assign wr = reg_file0.wr;
    assign rd = reg_file0.rd;
    assign rs = reg_file0.rs;
    assign rt = reg_file0.rt;
    assign in = reg_file0.in;
    assign out_1 = reg_file0.out_1;
    assign out_2 = reg_file0.out_2;    
    
    initial
    begin
        reg_file0.rst <= 'b1;
        reg_file0.wr <= 'b0;
        reg_file0.rd <= 'd0;
        reg_file0.rs <= 'd0;
        reg_file0.rt <= 'd0;
        reg_file0.in <= 'd0;
        #20 reg_file0.rst <= 'b0;
        for (integer i = 0; i < 'd32; i = i + 1)
        begin
            #15 reg_file0.wr <= 'b1;
                reg_file0.in <= 1 << i;
                reg_file0.rd <= i;
            #15 reg_file0.wr <= 'b0;
        end
        for (integer i = 0; i < 'd32; i = i + 1)
        begin
            #20 reg_file0.rs <= i;
                reg_file0.in <= i;
            #0  reg_file0.rt <= (i + 16) % 32;
        end
        #20 $finish;
    end

endmodule
