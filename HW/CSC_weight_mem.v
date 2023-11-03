`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 12:23:43 PM
// Design Name: 
// Module Name: CSC_weight_mem
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


module CSC_weight_mem #(FILENAME="CSC_weight.mem")(
     
     input clk,
     input [7:0] addr,
     output reg [4:0] col_index,
     output reg [7:0] syn_weight
    );
    
    reg [12:0] CSC_weight_memory [0: 2**8-1];
    
    initial
    begin
    //This line is for the older version of vivado on vlx server
    //$readmemb({"/home/s2033411/ensemble_spiking/mem/", FILENAME}, CSC_weight_memory);
    //This line is for the newer version of vivado on linux laptop
        $readmemb(FILENAME, CSC_weight_memory);
    end
    
    always @(posedge clk)
    begin
        {col_index, syn_weight} <= CSC_weight_memory[addr];
    end
    
endmodule