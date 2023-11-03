`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2023 01:32:59 PM
// Design Name: 
// Module Name: Inter_layer_state_machine
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


module Inter_layer_state_machine(
    input clk,
    input rst_n,
    input trans_start,
    input steps_done,
    input spk_in,
    input spk_done,
    input infer_ready,
    output reg rqt_new_sample,
    output reg get_winner
    );
    
    localparam request = 0;
    localparam spk_gen_process = 1;
    localparam seconnd_lay_com = 2;
    localparam winner_takes_all = 3;
    localparam completion = 4;
    
    reg [2:0] current_state, next_state;
    reg current_step_done_flag, get_winner_flag_cnt;
    
    
    
    always @(posedge clk, negedge rst_n)
    begin
    if (!rst_n)
    begin
        current_state <= request;
        current_step_done_flag <= 0;
        get_winner_flag_cnt <= 0;
    end
    else
    begin
        current_state <= next_state;
    
    //end
    
    //always @(posedge clk)
    //begin
    
    case(current_state)
    
    request:
    begin
    
    end
    
    spk_gen_process:
    begin
    
    end
    
    seconnd_lay_com:
    begin
    if(steps_done)
    begin
        current_step_done_flag <= 1;
    end
    end
    
    
    winner_takes_all:
    begin
        current_step_done_flag<= 0;
        if(!get_winner_flag_cnt)
        begin
            get_winner_flag_cnt <= 1;
        end
    end
    
    completion:
    begin
        get_winner_flag_cnt <= 0;
    
    end
    endcase
    end
    end
    
    
    
    always@(*)
    begin
    rqt_new_sample = 0;
    get_winner = 0;
    //next_state = current_state;
    case (current_state)
    
    request:
    begin
    rqt_new_sample = 1;
    if(trans_start)
    begin
        next_state = spk_gen_process;
    end
    else
    begin
        next_state = request;
    end
    end
    
    spk_gen_process:
    begin
    if(spk_in)
    begin
        next_state = seconnd_lay_com;
    end
    else if(steps_done)
    begin
        next_state = winner_takes_all;
    end
    else
    begin
        next_state = spk_gen_process;
    end
    end
    
    seconnd_lay_com:
    begin
    if (spk_done)
    begin
        if(current_step_done_flag)
        next_state = winner_takes_all;
        else
        next_state = spk_gen_process;
    end
    else
    begin
        next_state = seconnd_lay_com;
    end
    end
    
    winner_takes_all:
    begin
    if(!get_winner_flag_cnt)
    begin
        get_winner = 1;
    end
    else
    begin
        get_winner = 0;
    end
    
    if(infer_ready)
        next_state = completion;
    else
        next_state = winner_takes_all;
    end
    
    completion:
    begin
        next_state = rqt_new_sample;
    end
    
    default:
    begin
        next_state = request;
    end    
    endcase
    end
    
endmodule
