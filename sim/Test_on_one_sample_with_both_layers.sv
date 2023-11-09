`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2023 03:59:09 PM
// Design Name: 
// Module Name: Test_on_one_sample_with_both_layers
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


module Test_on_one_sample_with_both_layers(

    );
    
    logic clk, rst_n, get_winner, pre_processing_done;
    wire current_step_finished, spike_out, spike_done, infer_ready;
    wire [5:0] spike_AER;
    wire [4:0] winner_id;
    // not needed at the moment
    logic [9:0] LOAD_input_value_ADDR;
    logic LOAD_input_en;
    logic [7:0] Pre_processed_dat;
    
    
    Spike_generation_TOP_updated #(1023) spike_gen_uut (
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
    
    Spiking_no_fire_TOP spiking_layer_uut (
        clk,
        rst_n,
        spike_out,
        spike_AER,
        get_winner,
        spike_done,
        winner_id,
        infer_ready

    );
    
    
    initial
    begin
        clk = 0;
        rst_n = 1;
        pre_processing_done = 0;
        get_winner = 0;
        #2
        rst_n = 0;
        #1
        rst_n = 1;
        
        #600
        pre_processing_done = 1;
        #10
        pre_processing_done = 0;
        #500000
        #500000

        get_winner = 1;
        #10
        get_winner = 0;
        #20
        #500
        $stop;
    end
    
    always #5 clk = ~clk;
    
    
    
    
      
    
    
endmodule
