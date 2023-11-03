`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 02:47:55 PM
// Design Name: 
// Module Name: acc_INF_neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This is the sequantial implementation of integrate no fire neuron and is the encapsulation
//   of INF_neuron so that it could be propperly controlled by state machine
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module acc_INF_neuron(
       input clk,
       input rst_n,
       input [7:0] weight,
       input [15:0] input_mem_vol,
       input output_en,
       input load_en,
       input input_valid,
       output reg [15:0] output_mem_vol       
    );
    
    reg [15:0] accumulator;
    wire [15:0] internal_sum;
    
    INF_neuron internal_neuron (accumulator, weight, internal_sum);
    
    always @(posedge clk, negedge rst_n)
    begin
        if (!rst_n)
        begin
            accumulator <= 0;
            output_mem_vol <= 0;
        end
        else 
        begin
            if(output_en)
            begin
                output_mem_vol <= accumulator;
                accumulator <= 0;
            end
            else if(load_en)
            begin
                accumulator <= input_mem_vol;
            end
            else if(input_valid)
            begin
                accumulator <= internal_sum;
            end
            else
            begin
                accumulator <= accumulator;
            end
        end
    end
    
endmodule
