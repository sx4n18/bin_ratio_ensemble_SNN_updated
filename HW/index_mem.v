`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 12:18:46 PM
// Design Name: 
// Module Name: index_mem
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


module index_mem #(FILENAME="weight_index.mem")(
    
      input clk,
      input [5:0] neuron_index,
      output reg [7:0] begin_index,
      output reg [7:0] end_index


    );
    
    reg [7:0] weight_index_memory [0:40];
    
    initial
    begin
    //This line is for the older version of vivado on vlx server
    //$readmemb({"/home/s2033411/ensemble_spiking/mem/", FILENAME}, weight_index_memory);
    //This line is for the newer version of vivado on linux laptop
        $readmemb(FILENAME, weight_index_memory);
    end
    
    always @(posedge clk)
    begin
        begin_index <= weight_index_memory[neuron_index];
        end_index <= weight_index_memory[neuron_index+1];
    end
    
endmodule
