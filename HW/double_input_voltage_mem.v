`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 03:19:35 PM
// Design Name: 
// Module Name: double_input_voltage_mem
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


module double_input_voltage_mem(
                   input clk,
                   input wr_en,
                   input [5:0] addr,
                   input [15:0] post_mem_vol,
                   input [15:0] input_mem_vol_diff,
                   output reg [15:0] pre_mem_vol,
                   output reg [15:0] output_mem_vol_diff

    );
    
    reg [31:0] voltage_mem [0:39];
    
    always@(posedge clk)
    begin
        if(wr_en)
        begin
            voltage_mem[addr] <= {input_mem_vol_diff, post_mem_vol};
        end
        else
        begin
            {output_mem_vol_diff, pre_mem_vol} <= voltage_mem[addr];
        end
    end
    
endmodule
