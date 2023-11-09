`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2023 04:37:49 PM
// Design Name: 
// Module Name: Bin_ratio_net_top_tb
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


module Bin_ratio_net_top_tb(

    );
    
    
    logic clk, rst_n, trans_start;
    logic [19:0] bin_cnt;
    wire request_new_sample, infer_ready;
    wire [4:0] winner_ID; 
    
    Bin_ratio_spiking_net #(15) bin_ratio_spiking_uut(
             clk,
             rst_n,
             trans_start,
             bin_cnt,
             request_new_sample,
             winner_ID,
             infer_ready
   
    );
    
    initial
    begin
    clk = 0;
    rst_n = 1;
    trans_start = 0;
    #1
    rst_n = 0;
    #2
    rst_n = 1;
    #50 // Fisrt sample should be giving 11
    trans_start = 1;
    bin_cnt = 0;
    #10
    trans_start = 0;
    bin_cnt = 0;

#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 938;
#10
bin_cnt = 1991;
#10
bin_cnt = 2476;
#10
bin_cnt = 3604;
#10
bin_cnt = 5304;
#10
bin_cnt = 7663;
#10
bin_cnt = 11388;
#10
bin_cnt = 17052;
#10
bin_cnt = 19432;
#10
bin_cnt = 14977;
#10
bin_cnt = 7414;
#10
bin_cnt = 2397;
#10
bin_cnt = 693;
#10
bin_cnt = 302;
#10
bin_cnt = 238;
#10
bin_cnt = 253;
#10
bin_cnt = 236;
#10
bin_cnt = 234;
#10
bin_cnt = 259;
#10
bin_cnt = 221;
#10
bin_cnt = 252;
#10
bin_cnt = 246;
#10
bin_cnt = 252;
#10
bin_cnt = 246;
#10
bin_cnt = 265;
#10
bin_cnt = 242;
#10
bin_cnt = 244;
#10
bin_cnt = 228;
#10
bin_cnt = 259;
#10
bin_cnt = 254;
#10
bin_cnt = 223;
#10
bin_cnt = 214;
#10
bin_cnt = 206;
#10
bin_cnt = 222;
#10
bin_cnt = 193;
#10
bin_cnt = 189;
#10
bin_cnt = 198;
#10
bin_cnt = 183;
#10
bin_cnt = 190;
#10
bin_cnt = 183;
#10
bin_cnt = 173;
#10
bin_cnt = 180;
#10
bin_cnt = 174;
#10
bin_cnt = 183;
#10
bin_cnt = 160;
#10
bin_cnt = 162;
#10
bin_cnt = 154;
#10
bin_cnt = 145;
#10
bin_cnt = 168;
#10
bin_cnt = 159;
#10
bin_cnt = 151;
#10
bin_cnt = 116;
#10
bin_cnt = 119;
#10
bin_cnt = 121;
#10
bin_cnt = 133;
#10
bin_cnt = 131;
#10
bin_cnt = 123;
#10
bin_cnt = 136;
#10
bin_cnt = 120;
#10
bin_cnt = 114;
#10
bin_cnt = 105;
#10
bin_cnt = 102;
#10
bin_cnt = 105;
#10
bin_cnt = 107;
#10
bin_cnt = 99;
#10
bin_cnt = 110;
#10
bin_cnt = 105;
#10
bin_cnt = 99;
#10
bin_cnt = 89;
#10
bin_cnt = 89;
#10
bin_cnt = 94;
#10
bin_cnt = 75;
#10
bin_cnt = 77;
#10
bin_cnt = 87;
#10
bin_cnt = 70;
#10
bin_cnt = 81;
#10
bin_cnt = 64;
#10
bin_cnt = 66;
#10
bin_cnt = 65;
#10
bin_cnt = 65;
#10
bin_cnt = 63;
#10
bin_cnt = 66;
#10
bin_cnt = 52;
#10
bin_cnt = 41;
#10
bin_cnt = 63;
#10
bin_cnt = 52;
#10
bin_cnt = 59;
#10
bin_cnt = 57;
#10
bin_cnt = 62;
#10
bin_cnt = 51;
#10
bin_cnt = 47;
#10
bin_cnt = 43;
#10
bin_cnt = 43;
#10
bin_cnt = 42;
#10
bin_cnt = 48;
#10
bin_cnt = 39;
#10
bin_cnt = 38;
#10
bin_cnt = 33;
#10
bin_cnt = 45;
#10
bin_cnt = 49;
#10
bin_cnt = 42;
#10
bin_cnt = 40;
#10
bin_cnt = 37;
#10
bin_cnt = 38;
#10
bin_cnt = 26;
#10
bin_cnt = 31;
#10
bin_cnt = 28;
#10
bin_cnt = 29;
#10
bin_cnt = 29;
#10
bin_cnt = 24;
#10
bin_cnt = 27;
#10
bin_cnt = 33;
#10
bin_cnt = 36;
#10
bin_cnt = 32;
#10
bin_cnt = 32;
#10
bin_cnt = 38;
#10
bin_cnt = 51;
#10
bin_cnt = 38;
#10
bin_cnt = 38;
#10
bin_cnt = 33;
#10
bin_cnt = 29;
#10
bin_cnt = 24;
#10
bin_cnt = 12;
#10
bin_cnt = 25;
#10
bin_cnt = 29;
#10
bin_cnt = 20;
#10
bin_cnt = 27;
#10
bin_cnt = 29;
#10
bin_cnt = 25;
#10
bin_cnt = 22;
#10
bin_cnt = 23;
#10
bin_cnt = 22;
#10
bin_cnt = 23;
#10
bin_cnt = 20;
#10
bin_cnt = 24;
#10
bin_cnt = 20;
#10
bin_cnt = 17;
#10
bin_cnt = 31;
#10
bin_cnt = 17;
#10
bin_cnt = 22;
#10
bin_cnt = 21;
#10
bin_cnt = 22;
#10
bin_cnt = 17;
#10
bin_cnt = 25;
#10
bin_cnt = 17;
#10
bin_cnt = 19;
#10
bin_cnt = 23;
#10
bin_cnt = 27;
#10
bin_cnt = 24;
#10
bin_cnt = 16;
#10
bin_cnt = 18;
#10
bin_cnt = 25;
#10
bin_cnt = 20;
#10
bin_cnt = 17;
#10
bin_cnt = 14;
#10
bin_cnt = 14;
#10
bin_cnt = 16;
#10
bin_cnt = 20;
#10
bin_cnt = 20;
#10
bin_cnt = 20;
#10
bin_cnt = 10;
#10
bin_cnt = 7;
#10
bin_cnt = 24;
#10
bin_cnt = 18;
#10
bin_cnt = 21;
#10
bin_cnt = 18;
#10
bin_cnt = 21;
#10
bin_cnt = 22;
#10
bin_cnt = 26;
#10
bin_cnt = 21;
#10
bin_cnt = 17;
#10
bin_cnt = 19;
#10
bin_cnt = 16;
#10
bin_cnt = 17;
#10
bin_cnt = 12;
#10
bin_cnt = 17;
#10
bin_cnt = 13;
#10
bin_cnt = 13;
#10
bin_cnt = 18;
#10
bin_cnt = 28;
#10
bin_cnt = 15;
#10
bin_cnt = 16;
#10
bin_cnt = 10;
#10
bin_cnt = 7;
#10
bin_cnt = 13;
#10
bin_cnt = 16;
#10
bin_cnt = 14;
#10
bin_cnt = 13;
#10
bin_cnt = 14;
#10
bin_cnt = 12;
#10
bin_cnt = 12;
#10
bin_cnt = 20;
#10
bin_cnt = 17;
#10
bin_cnt = 17;
#10
bin_cnt = 18;
#10
bin_cnt = 24;
#10
bin_cnt = 20;
#10
bin_cnt = 15;
#10
bin_cnt = 11;
#10
bin_cnt = 11;
#10
bin_cnt = 12;
#10
bin_cnt = 4;
#10
bin_cnt = 11;
#10
bin_cnt = 14;
#10
bin_cnt = 25;
#10
bin_cnt = 15;
#10
bin_cnt = 19;
#10
bin_cnt = 15;
#10
bin_cnt = 14;
#10
bin_cnt = 14;
#10
bin_cnt = 15;
#10
bin_cnt = 12;
#10
bin_cnt = 15;
#10
bin_cnt = 13;
#10
bin_cnt = 13;
#10
bin_cnt = 14;
#10
bin_cnt = 6;
#10
bin_cnt = 11;
#10
bin_cnt = 10;
#10
bin_cnt = 17;
#10
bin_cnt = 15;
#10
bin_cnt = 20;
#10
bin_cnt = 20;
#10
bin_cnt = 12;
#10
bin_cnt = 12;
#10
bin_cnt = 20;
#10
bin_cnt = 20;
#10
bin_cnt = 13;
#10
bin_cnt = 18;
#10
bin_cnt = 19;
#10
bin_cnt = 13;
#10
bin_cnt = 11;
#10
bin_cnt = 17;
#10
bin_cnt = 8;
#10
bin_cnt = 4;
#10
bin_cnt = 8;
#10
bin_cnt = 5;
#10
bin_cnt = 13;
#10
bin_cnt = 11;
#10
bin_cnt = 5;
#10
bin_cnt = 7;
#10
bin_cnt = 3;
#10
bin_cnt = 10;
#10
bin_cnt = 10;
#10
bin_cnt = 6;
#10
bin_cnt = 16;
#10
bin_cnt = 10;
#10
bin_cnt = 8;
#10
bin_cnt = 3;
#10
bin_cnt = 9;
#10
bin_cnt = 2;
#10
bin_cnt = 11;
#10
bin_cnt = 7;
#10
bin_cnt = 9;
#10
bin_cnt = 5;
#10
bin_cnt = 11;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 4;
#10
bin_cnt = 5;
#10
bin_cnt = 8;
#10
bin_cnt = 9;
#10
bin_cnt = 9;
#10
bin_cnt = 8;
#10
bin_cnt = 7;
#10
bin_cnt = 12;
#10
bin_cnt = 8;
#10
bin_cnt = 7;
#10
bin_cnt = 3;
#10
bin_cnt = 11;
#10
bin_cnt = 10;
#10
bin_cnt = 3;
#10
bin_cnt = 10;
#10
bin_cnt = 12;
#10
bin_cnt = 14;
#10
bin_cnt = 9;
#10
bin_cnt = 11;
#10
bin_cnt = 13;
#10
bin_cnt = 11;
#10
bin_cnt = 15;
#10
bin_cnt = 4;
#10
bin_cnt = 10;
#10
bin_cnt = 15;
#10
bin_cnt = 16;
#10
bin_cnt = 15;
#10
bin_cnt = 9;
#10
bin_cnt = 12;
#10
bin_cnt = 12;
#10
bin_cnt = 11;
#10
bin_cnt = 12;
#10
bin_cnt = 13;
#10
bin_cnt = 8;
#10
bin_cnt = 10;
#10
bin_cnt = 14;
#10
bin_cnt = 10;
#10
bin_cnt = 12;
#10
bin_cnt = 15;
#10
bin_cnt = 11;
#10
bin_cnt = 11;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 9;
#10
bin_cnt = 7;
#10
bin_cnt = 11;
#10
bin_cnt = 9;
#10
bin_cnt = 11;
#10
bin_cnt = 9;
#10
bin_cnt = 9;
#10
bin_cnt = 10;
#10
bin_cnt = 14;
#10
bin_cnt = 5;
#10
bin_cnt = 11;
#10
bin_cnt = 11;
#10
bin_cnt = 14;
#10
bin_cnt = 9;
#10
bin_cnt = 11;
#10
bin_cnt = 8;
#10
bin_cnt = 15;
#10
bin_cnt = 9;
#10
bin_cnt = 12;
#10
bin_cnt = 6;
#10
bin_cnt = 9;
#10
bin_cnt = 5;
#10
bin_cnt = 8;
#10
bin_cnt = 4;
#10
bin_cnt = 6;
#10
bin_cnt = 8;
#10
bin_cnt = 7;
#10
bin_cnt = 3;
#10
bin_cnt = 8;
#10
bin_cnt = 8;
#10
bin_cnt = 3;
#10
bin_cnt = 5;
#10
bin_cnt = 4;
#10
bin_cnt = 8;
#10
bin_cnt = 14;
#10
bin_cnt = 13;
#10
bin_cnt = 7;
#10
bin_cnt = 4;
#10
bin_cnt = 5;
#10
bin_cnt = 9;
#10
bin_cnt = 4;
#10
bin_cnt = 5;
#10
bin_cnt = 4;
#10
bin_cnt = 9;
#10
bin_cnt = 4;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 2;
#10
bin_cnt = 5;
#10
bin_cnt = 2;
#10
bin_cnt = 5;
#10
bin_cnt = 5;
#10
bin_cnt = 2;
#10
bin_cnt = 6;
#10
bin_cnt = 7;
#10
bin_cnt = 7;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 10;
#10
bin_cnt = 10;
#10
bin_cnt = 6;
#10
bin_cnt = 3;
#10
bin_cnt = 10;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 5;
#10
bin_cnt = 9;
#10
bin_cnt = 7;
#10
bin_cnt = 4;
#10
bin_cnt = 5;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 4;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 8;
#10
bin_cnt = 3;
#10
bin_cnt = 3;
#10
bin_cnt = 4;
#10
bin_cnt = 3;
#10
bin_cnt = 6;
#10
bin_cnt = 4;
#10
bin_cnt = 5;
#10
bin_cnt = 4;
#10
bin_cnt = 11;
#10
bin_cnt = 5;
#10
bin_cnt = 7;
#10
bin_cnt = 2;
#10
bin_cnt = 5;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 6;
#10
bin_cnt = 4;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 1;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 4;
#10
bin_cnt = 5;
#10
bin_cnt = 7;
#10
bin_cnt = 6;
#10
bin_cnt = 7;
#10
bin_cnt = 6;
#10
bin_cnt = 2;
#10
bin_cnt = 5;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 4;
#10
bin_cnt = 3;
#10
bin_cnt = 7;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 5;
#10
bin_cnt = 3;
#10
bin_cnt = 5;
#10
bin_cnt = 5;
#10
bin_cnt = 5;
#10
bin_cnt = 5;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 3;
#10
bin_cnt = 5;
#10
bin_cnt = 3;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 7;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 5;
#10
bin_cnt = 6;
#10
bin_cnt = 2;
#10
bin_cnt = 3;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 3;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 6;
#10
bin_cnt = 3;
#10
bin_cnt = 6;
#10
bin_cnt = 8;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 3;
#10
bin_cnt = 4;
#10
bin_cnt = 12;
#10
bin_cnt = 9;
#10
bin_cnt = 7;
#10
bin_cnt = 8;
#10
bin_cnt = 7;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 16;
#10
bin_cnt = 10;
#10
bin_cnt = 13;
#10
bin_cnt = 7;
#10
bin_cnt = 10;
#10
bin_cnt = 6;
#10
bin_cnt = 12;
#10
bin_cnt = 9;
#10
bin_cnt = 16;
#10
bin_cnt = 13;
#10
bin_cnt = 9;
#10
bin_cnt = 11;
#10
bin_cnt = 5;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 1;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 4;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#1000000
// second sample, should be giving 12
#10
trans_start = 1;
bin_cnt = 0;
#10
trans_start = 0;
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 557;
#10
bin_cnt = 1757;
#10
bin_cnt = 993;
#10
bin_cnt = 500;
#10
bin_cnt = 390;
#10
bin_cnt = 328;
#10
bin_cnt = 664;
#10
bin_cnt = 639;
#10
bin_cnt = 523;
#10
bin_cnt = 515;
#10
bin_cnt = 518;
#10
bin_cnt = 559;
#10
bin_cnt = 626;
#10
bin_cnt = 617;
#10
bin_cnt = 630;
#10
bin_cnt = 691;
#10
bin_cnt = 688;
#10
bin_cnt = 733;
#10
bin_cnt = 794;
#10
bin_cnt = 797;
#10
bin_cnt = 648;
#10
bin_cnt = 749;
#10
bin_cnt = 737;
#10
bin_cnt = 728;
#10
bin_cnt = 820;
#10
bin_cnt = 826;
#10
bin_cnt = 896;
#10
bin_cnt = 977;
#10
bin_cnt = 995;
#10
bin_cnt = 976;
#10
bin_cnt = 887;
#10
bin_cnt = 738;
#10
bin_cnt = 697;
#10
bin_cnt = 662;
#10
bin_cnt = 610;
#10
bin_cnt = 617;
#10
bin_cnt = 604;
#10
bin_cnt = 566;
#10
bin_cnt = 552;
#10
bin_cnt = 539;
#10
bin_cnt = 518;
#10
bin_cnt = 547;
#10
bin_cnt = 526;
#10
bin_cnt = 519;
#10
bin_cnt = 494;
#10
bin_cnt = 490;
#10
bin_cnt = 473;
#10
bin_cnt = 472;
#10
bin_cnt = 480;
#10
bin_cnt = 425;
#10
bin_cnt = 495;
#10
bin_cnt = 395;
#10
bin_cnt = 445;
#10
bin_cnt = 432;
#10
bin_cnt = 372;
#10
bin_cnt = 435;
#10
bin_cnt = 406;
#10
bin_cnt = 387;
#10
bin_cnt = 402;
#10
bin_cnt = 391;
#10
bin_cnt = 416;
#10
bin_cnt = 371;
#10
bin_cnt = 357;
#10
bin_cnt = 366;
#10
bin_cnt = 335;
#10
bin_cnt = 351;
#10
bin_cnt = 337;
#10
bin_cnt = 345;
#10
bin_cnt = 370;
#10
bin_cnt = 333;
#10
bin_cnt = 336;
#10
bin_cnt = 341;
#10
bin_cnt = 324;
#10
bin_cnt = 289;
#10
bin_cnt = 293;
#10
bin_cnt = 248;
#10
bin_cnt = 212;
#10
bin_cnt = 225;
#10
bin_cnt = 216;
#10
bin_cnt = 189;
#10
bin_cnt = 231;
#10
bin_cnt = 197;
#10
bin_cnt = 183;
#10
bin_cnt = 204;
#10
bin_cnt = 203;
#10
bin_cnt = 203;
#10
bin_cnt = 174;
#10
bin_cnt = 159;
#10
bin_cnt = 192;
#10
bin_cnt = 175;
#10
bin_cnt = 167;
#10
bin_cnt = 151;
#10
bin_cnt = 176;
#10
bin_cnt = 154;
#10
bin_cnt = 151;
#10
bin_cnt = 158;
#10
bin_cnt = 133;
#10
bin_cnt = 150;
#10
bin_cnt = 150;
#10
bin_cnt = 160;
#10
bin_cnt = 183;
#10
bin_cnt = 182;
#10
bin_cnt = 225;
#10
bin_cnt = 242;
#10
bin_cnt = 225;
#10
bin_cnt = 243;
#10
bin_cnt = 216;
#10
bin_cnt = 186;
#10
bin_cnt = 163;
#10
bin_cnt = 161;
#10
bin_cnt = 133;
#10
bin_cnt = 103;
#10
bin_cnt = 117;
#10
bin_cnt = 95;
#10
bin_cnt = 118;
#10
bin_cnt = 108;
#10
bin_cnt = 111;
#10
bin_cnt = 102;
#10
bin_cnt = 108;
#10
bin_cnt = 98;
#10
bin_cnt = 103;
#10
bin_cnt = 101;
#10
bin_cnt = 107;
#10
bin_cnt = 105;
#10
bin_cnt = 88;
#10
bin_cnt = 101;
#10
bin_cnt = 97;
#10
bin_cnt = 97;
#10
bin_cnt = 107;
#10
bin_cnt = 99;
#10
bin_cnt = 94;
#10
bin_cnt = 96;
#10
bin_cnt = 79;
#10
bin_cnt = 92;
#10
bin_cnt = 92;
#10
bin_cnt = 91;
#10
bin_cnt = 103;
#10
bin_cnt = 97;
#10
bin_cnt = 85;
#10
bin_cnt = 97;
#10
bin_cnt = 95;
#10
bin_cnt = 89;
#10
bin_cnt = 95;
#10
bin_cnt = 75;
#10
bin_cnt = 81;
#10
bin_cnt = 81;
#10
bin_cnt = 94;
#10
bin_cnt = 81;
#10
bin_cnt = 74;
#10
bin_cnt = 68;
#10
bin_cnt = 82;
#10
bin_cnt = 76;
#10
bin_cnt = 71;
#10
bin_cnt = 71;
#10
bin_cnt = 78;
#10
bin_cnt = 80;
#10
bin_cnt = 83;
#10
bin_cnt = 62;
#10
bin_cnt = 78;
#10
bin_cnt = 72;
#10
bin_cnt = 76;
#10
bin_cnt = 73;
#10
bin_cnt = 84;
#10
bin_cnt = 74;
#10
bin_cnt = 65;
#10
bin_cnt = 56;
#10
bin_cnt = 79;
#10
bin_cnt = 71;
#10
bin_cnt = 70;
#10
bin_cnt = 60;
#10
bin_cnt = 72;
#10
bin_cnt = 55;
#10
bin_cnt = 69;
#10
bin_cnt = 69;
#10
bin_cnt = 65;
#10
bin_cnt = 70;
#10
bin_cnt = 63;
#10
bin_cnt = 69;
#10
bin_cnt = 67;
#10
bin_cnt = 55;
#10
bin_cnt = 75;
#10
bin_cnt = 73;
#10
bin_cnt = 70;
#10
bin_cnt = 68;
#10
bin_cnt = 85;
#10
bin_cnt = 70;
#10
bin_cnt = 62;
#10
bin_cnt = 73;
#10
bin_cnt = 74;
#10
bin_cnt = 62;
#10
bin_cnt = 80;
#10
bin_cnt = 64;
#10
bin_cnt = 79;
#10
bin_cnt = 67;
#10
bin_cnt = 61;
#10
bin_cnt = 55;
#10
bin_cnt = 67;
#10
bin_cnt = 69;
#10
bin_cnt = 56;
#10
bin_cnt = 59;
#10
bin_cnt = 57;
#10
bin_cnt = 51;
#10
bin_cnt = 54;
#10
bin_cnt = 52;
#10
bin_cnt = 60;
#10
bin_cnt = 53;
#10
bin_cnt = 71;
#10
bin_cnt = 66;
#10
bin_cnt = 59;
#10
bin_cnt = 70;
#10
bin_cnt = 70;
#10
bin_cnt = 66;
#10
bin_cnt = 69;
#10
bin_cnt = 65;
#10
bin_cnt = 68;
#10
bin_cnt = 64;
#10
bin_cnt = 60;
#10
bin_cnt = 53;
#10
bin_cnt = 60;
#10
bin_cnt = 71;
#10
bin_cnt = 46;
#10
bin_cnt = 50;
#10
bin_cnt = 45;
#10
bin_cnt = 58;
#10
bin_cnt = 61;
#10
bin_cnt = 62;
#10
bin_cnt = 70;
#10
bin_cnt = 53;
#10
bin_cnt = 43;
#10
bin_cnt = 51;
#10
bin_cnt = 52;
#10
bin_cnt = 59;
#10
bin_cnt = 49;
#10
bin_cnt = 49;
#10
bin_cnt = 39;
#10
bin_cnt = 41;
#10
bin_cnt = 41;
#10
bin_cnt = 64;
#10
bin_cnt = 54;
#10
bin_cnt = 47;
#10
bin_cnt = 52;
#10
bin_cnt = 55;
#10
bin_cnt = 54;
#10
bin_cnt = 61;
#10
bin_cnt = 60;
#10
bin_cnt = 60;
#10
bin_cnt = 61;
#10
bin_cnt = 63;
#10
bin_cnt = 78;
#10
bin_cnt = 64;
#10
bin_cnt = 53;
#10
bin_cnt = 70;
#10
bin_cnt = 68;
#10
bin_cnt = 57;
#10
bin_cnt = 63;
#10
bin_cnt = 69;
#10
bin_cnt = 60;
#10
bin_cnt = 69;
#10
bin_cnt = 43;
#10
bin_cnt = 67;
#10
bin_cnt = 58;
#10
bin_cnt = 58;
#10
bin_cnt = 57;
#10
bin_cnt = 61;
#10
bin_cnt = 60;
#10
bin_cnt = 63;
#10
bin_cnt = 48;
#10
bin_cnt = 50;
#10
bin_cnt = 59;
#10
bin_cnt = 61;
#10
bin_cnt = 56;
#10
bin_cnt = 67;
#10
bin_cnt = 57;
#10
bin_cnt = 63;
#10
bin_cnt = 74;
#10
bin_cnt = 75;
#10
bin_cnt = 65;
#10
bin_cnt = 62;
#10
bin_cnt = 62;
#10
bin_cnt = 71;
#10
bin_cnt = 52;
#10
bin_cnt = 61;
#10
bin_cnt = 57;
#10
bin_cnt = 67;
#10
bin_cnt = 64;
#10
bin_cnt = 63;
#10
bin_cnt = 52;
#10
bin_cnt = 51;
#10
bin_cnt = 70;
#10
bin_cnt = 53;
#10
bin_cnt = 64;
#10
bin_cnt = 56;
#10
bin_cnt = 48;
#10
bin_cnt = 69;
#10
bin_cnt = 60;
#10
bin_cnt = 62;
#10
bin_cnt = 55;
#10
bin_cnt = 65;
#10
bin_cnt = 58;
#10
bin_cnt = 59;
#10
bin_cnt = 62;
#10
bin_cnt = 56;
#10
bin_cnt = 48;
#10
bin_cnt = 55;
#10
bin_cnt = 80;
#10
bin_cnt = 51;
#10
bin_cnt = 44;
#10
bin_cnt = 58;
#10
bin_cnt = 56;
#10
bin_cnt = 64;
#10
bin_cnt = 51;
#10
bin_cnt = 52;
#10
bin_cnt = 51;
#10
bin_cnt = 51;
#10
bin_cnt = 51;
#10
bin_cnt = 37;
#10
bin_cnt = 32;
#10
bin_cnt = 45;
#10
bin_cnt = 35;
#10
bin_cnt = 43;
#10
bin_cnt = 35;
#10
bin_cnt = 36;
#10
bin_cnt = 38;
#10
bin_cnt = 45;
#10
bin_cnt = 40;
#10
bin_cnt = 38;
#10
bin_cnt = 30;
#10
bin_cnt = 26;
#10
bin_cnt = 37;
#10
bin_cnt = 42;
#10
bin_cnt = 31;
#10
bin_cnt = 31;
#10
bin_cnt = 39;
#10
bin_cnt = 42;
#10
bin_cnt = 44;
#10
bin_cnt = 31;
#10
bin_cnt = 32;
#10
bin_cnt = 29;
#10
bin_cnt = 49;
#10
bin_cnt = 37;
#10
bin_cnt = 39;
#10
bin_cnt = 35;
#10
bin_cnt = 48;
#10
bin_cnt = 37;
#10
bin_cnt = 35;
#10
bin_cnt = 30;
#10
bin_cnt = 41;
#10
bin_cnt = 44;
#10
bin_cnt = 46;
#10
bin_cnt = 43;
#10
bin_cnt = 54;
#10
bin_cnt = 45;
#10
bin_cnt = 38;
#10
bin_cnt = 46;
#10
bin_cnt = 37;
#10
bin_cnt = 45;
#10
bin_cnt = 47;
#10
bin_cnt = 50;
#10
bin_cnt = 40;
#10
bin_cnt = 37;
#10
bin_cnt = 46;
#10
bin_cnt = 28;
#10
bin_cnt = 33;
#10
bin_cnt = 40;
#10
bin_cnt = 41;
#10
bin_cnt = 34;
#10
bin_cnt = 35;
#10
bin_cnt = 35;
#10
bin_cnt = 47;
#10
bin_cnt = 43;
#10
bin_cnt = 45;
#10
bin_cnt = 51;
#10
bin_cnt = 70;
#10
bin_cnt = 76;
#10
bin_cnt = 85;
#10
bin_cnt = 99;
#10
bin_cnt = 82;
#10
bin_cnt = 84;
#10
bin_cnt = 83;
#10
bin_cnt = 90;
#10
bin_cnt = 89;
#10
bin_cnt = 89;
#10
bin_cnt = 69;
#10
bin_cnt = 57;
#10
bin_cnt = 44;
#10
bin_cnt = 43;
#10
bin_cnt = 37;
#10
bin_cnt = 19;
#10
bin_cnt = 18;
#10
bin_cnt = 14;
#10
bin_cnt = 18;
#10
bin_cnt = 24;
#10
bin_cnt = 14;
#10
bin_cnt = 12;
#10
bin_cnt = 12;
#10
bin_cnt = 10;
#10
bin_cnt = 7;
#10
bin_cnt = 8;
#10
bin_cnt = 13;
#10
bin_cnt = 12;
#10
bin_cnt = 9;
#10
bin_cnt = 12;
#10
bin_cnt = 7;
#10
bin_cnt = 12;
#10
bin_cnt = 7;
#10
bin_cnt = 19;
#10
bin_cnt = 13;
#10
bin_cnt = 10;
#10
bin_cnt = 7;
#10
bin_cnt = 9;
#10
bin_cnt = 13;
#10
bin_cnt = 18;
#10
bin_cnt = 14;
#10
bin_cnt = 11;
#10
bin_cnt = 9;
#10
bin_cnt = 8;
#10
bin_cnt = 11;
#10
bin_cnt = 17;
#10
bin_cnt = 12;
#10
bin_cnt = 16;
#10
bin_cnt = 26;
#10
bin_cnt = 31;
#10
bin_cnt = 28;
#10
bin_cnt = 27;
#10
bin_cnt = 39;
#10
bin_cnt = 52;
#10
bin_cnt = 60;
#10
bin_cnt = 51;
#10
bin_cnt = 56;
#10
bin_cnt = 66;
#10
bin_cnt = 70;
#10
bin_cnt = 65;
#10
bin_cnt = 48;
#10
bin_cnt = 42;
#10
bin_cnt = 35;
#10
bin_cnt = 58;
#10
bin_cnt = 37;
#10
bin_cnt = 23;
#10
bin_cnt = 31;
#10
bin_cnt = 23;
#10
bin_cnt = 16;
#10
bin_cnt = 19;
#10
bin_cnt = 14;
#10
bin_cnt = 10;
#10
bin_cnt = 5;
#10
bin_cnt = 12;
#10
bin_cnt = 11;
#10
bin_cnt = 4;
#10
bin_cnt = 8;
#10
bin_cnt = 11;
#10
bin_cnt = 2;
#10
bin_cnt = 11;
#10
bin_cnt = 17;
#10
bin_cnt = 13;
#10
bin_cnt = 13;
#10
bin_cnt = 14;
#10
bin_cnt = 17;
#10
bin_cnt = 15;
#10
bin_cnt = 17;
#10
bin_cnt = 23;
#10
bin_cnt = 12;
#10
bin_cnt = 23;
#10
bin_cnt = 20;
#10
bin_cnt = 17;
#10
bin_cnt = 9;
#10
bin_cnt = 19;
#10
bin_cnt = 20;
#10
bin_cnt = 16;
#10
bin_cnt = 19;
#10
bin_cnt = 12;
#10
bin_cnt = 23;
#10
bin_cnt = 26;
#10
bin_cnt = 28;
#10
bin_cnt = 17;
#10
bin_cnt = 24;
#10
bin_cnt = 23;
#10
bin_cnt = 30;
#10
bin_cnt = 19;
#10
bin_cnt = 24;
#10
bin_cnt = 13;
#10
bin_cnt = 18;
#10
bin_cnt = 13;
#10
bin_cnt = 16;
#10
bin_cnt = 18;
#10
bin_cnt = 11;
#10
bin_cnt = 12;
#10
bin_cnt = 17;
#10
bin_cnt = 13;
#10
bin_cnt = 7;
#10
bin_cnt = 5;
#10
bin_cnt = 3;
#10
bin_cnt = 8;
#10
bin_cnt = 10;
#10
bin_cnt = 9;
#10
bin_cnt = 8;
#10
bin_cnt = 11;
#10
bin_cnt = 7;
#10
bin_cnt = 6;
#10
bin_cnt = 5;
#10
bin_cnt = 2;
#10
bin_cnt = 6;
#10
bin_cnt = 7;
#10
bin_cnt = 7;
#10
bin_cnt = 8;
#10
bin_cnt = 6;
#10
bin_cnt = 3;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 4;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 4;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 4;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 5;
#10
bin_cnt = 1;
#10
bin_cnt = 4;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 2;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 0;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 2;
#10
bin_cnt = 3;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#10
bin_cnt = 2;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 1;
#10
bin_cnt = 3;
#10
bin_cnt = 2;
#1000000
$stop;
    end
    
    
    always #5 clk = ~clk;




endmodule
