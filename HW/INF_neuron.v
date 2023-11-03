`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 02:42:33 PM
// Design Name: 
// Module Name: INF_neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  The combinational implementation of the integrate but no fire neuron simply just a
//  DSP unit
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module INF_neuron(
     input signed [15:0] pre_mem_vol,
     input signed [7:0] weight,
     output [15:0] out_mem_vol,
     output of_flag 

    );
    
     reg signed [15:0] extended_weight;
    
    always @(*)
    begin
        if (weight >= 0)
            begin
            extended_weight = {8'h00, weight};
            end
        else
            begin
            extended_weight = {8'hFF, weight};
            end
    end
    
    assign {of_flag, out_mem_vol} = pre_mem_vol + extended_weight;
    
    //assign {of_flat, out_mem_vol} = pre_mem_vol + weight;
endmodule
