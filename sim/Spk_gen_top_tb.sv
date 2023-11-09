`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 03:36:55 PM
// Design Name: 
// Module Name: Spk_gen_top_tb
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


module Spk_gen_top_tb(

    );



logic clk, rst_n, current_step_finished, spike_out, pre_processing_done;
logic [5:0] spike_AER;

// not needed at the moment
logic [9:0] LOAD_input_value_ADDR;
logic LOAD_input_en;
logic [7:0] Pre_processed_dat;



Spike_generation_TOP_updated #(1023)  spk_gen_uut (
      clk,
      rst_n,
      LOAD_input_value_ADDR,
      LOAD_input_en,
      pre_processing_done,
      Pre_processed_dat,
      current_step_finished,
      spike_AER,
      spike_out
    );


initial
begin
    clk = 0;
    rst_n = 1;
    pre_processing_done = 0;
    #5
    rst_n = 0;
    #1
    rst_n = 1;
    #500
    pre_processing_done = 1;
    #10
    pre_processing_done = 0;
    #1000
    $stop;
    
end


always #5 clk = ~clk;


endmodule
