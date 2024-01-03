`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2024 02:51:06 PM
// Design Name: 
// Module Name: Trimmed_bin_ratio_ensemble_spiking_net
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//   This is the trimmed bin_ratio_ensemble_spiking_net from original 20 nets down to selected 5 nets
//  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Trimmed_bin_ratio_ensemble_spiking_net(
                input clk,
                input rst_n,
                input trans_start,
                input [19:0] bin_cnt,
                output request_over_ensemble,
                output [4:0] final_winner_over_ensemble,
                output infer_ready_ensemble
    );
    
    
     
    // number_of_nets is only 5, the combo should be (1,5,16,17,19)
    reg [4:0] final_judgement [0:4];
    wire [4:0] pre_final_judgement [0:4];
    wire [4:0] label_inferred, net_index; // 5 nets inferred label and the index for the net
    wire [4:0] request_this_dia; // 5 nets request
    wire [4:0] infer_ready_this_dia; // 5 nets infer ready signal
    wire all_nets_finished; // all nets finished their inference
    integer index_4_cnt;
    
    /*
    genvar i;
    
    generate
    for (i = 0; i<num_of_net; i= i+1)
    begin
        Bin_ratio_spiking_net #(i) small_diagonal(clk, rst_n, trans_start, bin_cnt, request_this_dia[i], pre_final_judgement[i],infer_ready_this_dia[i]);
        always @(posedge clk)
        if(infer_ready_this_dia[i])
        final_judgement[i] <= pre_final_judgement[i];
    end 
    endgenerate
    */
    // replacing the part above into the actual 5 different nets
    // net 0
    Bin_ratio_spiking_net #(1) small_diagonal_0_1(clk, rst_n, trans_start, bin_cnt, request_this_dia[0], pre_final_judgement[0],infer_ready_this_dia[0]);
    
    Bin_ratio_spiking_net #(5) small_diagonal_1_5(clk, rst_n, trans_start, bin_cnt, request_this_dia[1], pre_final_judgement[1],infer_ready_this_dia[1]);
    
    Bin_ratio_spiking_net #(16) small_diagonal_2_16(clk, rst_n, trans_start, bin_cnt, request_this_dia[2], pre_final_judgement[2],infer_ready_this_dia[2]);
    
    Bin_ratio_spiking_net #(17) small_diagonal_3_17(clk, rst_n, trans_start, bin_cnt, request_this_dia[3], pre_final_judgement[3],infer_ready_this_dia[3]);
    
    Bin_ratio_spiking_net #(19) small_diagonal_4_19(clk, rst_n, trans_start, bin_cnt, request_this_dia[4], pre_final_judgement[4],infer_ready_this_dia[4]);
    
    genvar i;
    
    generate
    for (i = 0; i<5; i= i+1)
    begin
            always @(posedge clk)
              if(infer_ready_this_dia[i])
                 final_judgement[i] <= pre_final_judgement[i];
    end 
    endgenerate
    
    
    // only 5 nets given for the ensemble state machine
    ensemble_state_machine #(5) top_ensemble_SM_unit (
             clk,
             rst_n,
             trans_start,
             all_nets_finished,
             label_inferred, //data
             net_index, //addr 
             final_winner_over_ensemble,
             request_over_ensemble,
             infer_ready_ensemble

    );
    assign all_nets_finished = &request_this_dia;
    assign label_inferred = final_judgement[net_index];
    
    
    
endmodule
