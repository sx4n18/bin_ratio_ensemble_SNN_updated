`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 04:01:52 PM
// Design Name: 
// Module Name: Bin_ratio_ensemble_spiking_net
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


module Bin_ratio_ensemble_spiking_net #(num_of_net=20)(
                input clk,
                input rst_n,
                input trans_start,
                input [19:0] bin_cnt,
                output request_over_ensemble,
                output [4:0] final_winner_over_ensemble,
                output infer_ready_ensemble

    );
    
    
    // number_of_nets
    reg [4:0] final_judgement [0:num_of_net-1];
    wire [4:0] pre_final_judgement [0:num_of_net-1];
    wire [4:0] label_inferred, net_index;
    wire [num_of_net-1:0] request_this_dia;
    wire [num_of_net-1:0] infer_ready_this_dia;
    wire all_nets_finished;
    integer index_4_cnt;
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
    
    ensemble_state_machine #(num_of_net) top_ensemble_SM_unit (
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
