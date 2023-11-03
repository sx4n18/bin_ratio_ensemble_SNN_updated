`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2023 01:39:41 PM
// Design Name: 
// Module Name: configurable_shift_reg
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


module configurable_shift_reg #(parameter num_of_reg=2)(
                    input clk,
                    input [7:0] shift_value_in,
                    output [7:0] shift_value_a,
                    output [7:0] shift_value_b

    );
    
    
    
    integer i;
    
    reg [7:0] internal_mem [0: num_of_reg-1];
    
    always @(posedge clk)
    begin
        internal_mem[0] <= shift_value_in;
        for(i=0; i< num_of_reg-1; i= i+1)
        begin
            internal_mem[i+1] <= internal_mem[i];
        end
    end


    assign shift_value_b = internal_mem[num_of_reg-1];
    assign shift_value_a = internal_mem[0];
    
endmodule
