`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 12:20:08 PM
// Design Name: 
// Module Name: ensemble_state_machine
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


module ensemble_state_machine #(num_of_net = 20)(
            input clk,
            input rst_n,
            input trans_start,
            input all_nets_finished,
            input [4:0] label_inferred, //data
            output reg [4:0] net_index, //addr 
            output reg [4:0] winner_ID,
            output reg ensemble_request,
            output reg ensemble_infer_ready

    );
    
    reg [1:0] current_state, next_state;
    reg [4:0] score_board [0:17];
    reg [4:0] SB_index;
    integer index;
    reg [4:0] max_cnt;
    reg [4:0] temp_winner;
    localparam IDLE = 0;
    localparam ensemble_process = 1;
    localparam final_evaluation = 2;
    localparam completion = 3;
    
    
    always @(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
        begin
            current_state <= IDLE;
            net_index <= 0;
            SB_index <= 0;
            max_cnt <= 0;
            temp_winner <=0;
            winner_ID <= 0;
            for(index=0; index<18; index = index+1)
            begin
                score_board[index] <= 0;
            end
        end
        else
        begin
            current_state <= next_state;
        
    case(current_state)
    
    IDLE:
    begin
    end
    
    ensemble_process:
    begin
    end
    
    final_evaluation:
    begin
        if(net_index <num_of_net)
        begin
            score_board[label_inferred] <= score_board[label_inferred] +1;
            net_index <= net_index +1;
        end
        else if (net_index == num_of_net)
        begin
            if(SB_index < 18)
            begin
                if(score_board[SB_index] > max_cnt)
                begin
                    max_cnt <= score_board[SB_index];
                    temp_winner <= SB_index;
                end
                SB_index <= SB_index +1;
            end
            else
            begin
                winner_ID <= temp_winner;
                temp_winner <= 0;
                SB_index <= 0;
                net_index <= 0;
                max_cnt <= 0;
                for(index = 0; index<18; index=index+1)
                begin
                    score_board[index] <= 0;
                end
            end

        end
    end
    
    completion:
    begin
    
    end
    
    endcase
    end
   end
   always@(*)
   begin
   
   ensemble_request = 0;
   ensemble_infer_ready = 0;
   case(current_state)
   
   IDLE:
   begin
   ensemble_request = 1;
   if(trans_start)
   begin
    next_state = ensemble_process;
   end
   else
   begin
    next_state = IDLE;
   end
   end
   
   
   ensemble_process:
   begin
   if(all_nets_finished)
   begin
    next_state = final_evaluation;
   end
   else
   begin
    next_state = ensemble_process;
   end
   end
   
   
   final_evaluation:
   begin
    if(net_index == num_of_net && SB_index == 18)
    begin
        next_state = completion;
    end
    else
    begin
        next_state = final_evaluation;
    end
   end
   
   completion:
   begin
    ensemble_infer_ready = 1;
    next_state = IDLE;
   end
   
   default:
   begin
    next_state = IDLE;
   end
   
   endcase
   end
   
   
    
endmodule
