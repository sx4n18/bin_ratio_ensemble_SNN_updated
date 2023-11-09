`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2023 03:41:45 PM
// Design Name: 
// Module Name: Bin_ratio_spiking_net
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


module Bin_ratio_spiking_net #(parameter diagonal=0)(
            input clk,
            input rst_n,
            input trans_start,
            input [19:0] bin_cnt,
            output request_new_sample,
            output [4:0] winner_ID,
            output infer_ready
    );
    
    wire steps_finished, get_winner, spike_in, spike_done, prepro_dat_wr_en, preprocess_done;
    wire [5:0] spike_AER;
    wire [7:0] processed_dat;
    wire [9:0] prepro_dat_addr;
    localparam input_number = 1023 - diagonal;
    
    Inter_layer_state_machine top_SM_unit(
     clk,
     rst_n,
     trans_start,
     steps_finished,
     spike_in,
     spike_done,
     infer_ready,
     request_new_sample,
     get_winner
    );
    
    log_base_2_Xminus #(diagonal) top_preprocessing_unit (
                 clk,
                 rst_n,
                 bin_cnt,
                 trans_start,
                 processed_dat,
                 prepro_dat_addr,
                 prepro_dat_wr_en,
                 preprocess_done

    );
    
    Spike_generation_TOP_updated #(input_number) spike_gen_unit(
      clk,
      rst_n,
      prepro_dat_addr,
      prepro_dat_wr_en,
      preprocess_done,
      processed_dat,
      steps_finished,
      spike_AER,
      spike_in
    );
    
    Spiking_no_fire_TOP #(diagonal) Integrate_no_fire_unit(
       clk,
       rst_n,
       spike_in,
       spike_AER,
       get_winner,
       spike_done,
       winner_ID,
       infer_ready

    );
    
endmodule
