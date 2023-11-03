`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2023 01:02:34 PM
// Design Name: 
// Module Name: log_base_2_Xminus
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

//`define  DIAG_0;

module log_base_2_Xminus #( parameter diagonal=3)(
                input clk,
                input rst_n,
                input [19:0] bin_cnt,
                input trans_start,
                output signed [7:0] processed_dat,
                output [9:0] processed_dat_addr,
                output processed_dat_ready,
                output prepro_finish

    );
    
    localparam num_of_output = 1023 - diagonal;
    localparam num_of_reg = 2 + diagonal;
    wire signed [7:0] bin_ratio_denominator, bin_ratio_numerator;
    wire [7:0] logged_dat;

    
    log_transform log_tran_unit(bin_cnt, logged_dat); 
    
    //`ifndef DIAG_0
    // there is the need to give more than 1 register
    configurable_shift_reg #(num_of_reg) config_shif_reg_unit (clk, logged_dat, bin_ratio_numerator, bin_ratio_denominator);
    // for data stability, the following implementation has been deprecitated.
    //`else 
    // diagonal 0 needs only one flop
    //always @(posedge clk)
    //begin
    //    bin_ratio_denominator <= logged_dat;
    //end
    //`endif
    prepro_state_machine #(num_of_reg) prepro_SM_unit (clk, rst_n, trans_start, processed_dat_addr, processed_dat_ready, prepro_finish);
    
    assign processed_dat = bin_ratio_numerator - bin_ratio_denominator;
    
endmodule
