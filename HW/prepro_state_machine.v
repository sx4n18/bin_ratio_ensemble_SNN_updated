`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2023 14:02:18
// Design Name: 
// Module Name: prepro_state_machine
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

//`define DIAG_0

module prepro_state_machine #(parameter num_of_reg=5) (
    input clk,
    input rst_n,
    input trans_start,
    output [9:0] processed_dat_addr,
    output reg processed_dat_valid,
    output reg prepro_finished
    );
    
    
    localparam IDLE = 0;
    localparam wait_4_reg = 1;
    localparam transmit = 2;
    localparam completion = 3;
    localparam wait_cycles = num_of_reg-2;
    localparam total_input_num = 1024 - num_of_reg +1;
    
    reg [1:0] state;
    reg [9:0] input_num_cnt;
    reg [4:0] reg_wait_cnt;
    
    always@(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
        begin
            state <= IDLE;
            input_num_cnt <= 0;
            reg_wait_cnt <= 0;
        end
        else
        begin
            case(state)
            
            IDLE:
            begin
                if(trans_start)
                state <= wait_4_reg;
                else
                state <= IDLE;
            end
            
            wait_4_reg:
            begin
                `ifdef DIAG_0
                state <= transmit;
                `else
                if (reg_wait_cnt == wait_cycles)
                begin
                    state <= transmit;
                    reg_wait_cnt <= 0;
                end
                else
                begin
                    reg_wait_cnt <= reg_wait_cnt +1;
                    state <= wait_4_reg;
                end
                `endif
            end
            
            transmit:
            begin
                if(input_num_cnt == total_input_num-1)
                begin
                    state <= completion;
                    input_num_cnt <=0;
                end
                else
                begin
                    state <= transmit;
                    input_num_cnt <= input_num_cnt +1;
                end
            end
            
            completion:
            begin
                state <= IDLE;
            end
            
            default:
            begin
                state <= IDLE;
            end
        
           endcase
        
        end 
       
    
    end
    
    
    
    always @(*)
    begin
    processed_dat_valid = 0;
    prepro_finished = 0;
    
    case (state)
    
    IDLE:
    begin
    end
    
    wait_4_reg:
    begin
    
    end    
    
    
    transmit:
    begin
    processed_dat_valid = 1;
    end
    
    
    completion:
    begin
    prepro_finished = 1;
    end
    
    default:
    begin
    
    end
    
    
    endcase
    
    end
/*    
    always@(posedge clk)
    begin
    
        case(current_state)
        
        IDLE:
        begin
        reg_wait_cnt <= 0;
        end
        
        wait_4_reg:
        begin
            `ifndef DIAG_0
            if(reg_wait_cnt < num_of_reg-2)
            begin
                reg_wait_cnt <= reg_wait_cnt +1;
            end
            else
            begin
                reg_wait_cnt <= 0;
            end
            `endif
        end
        
        transmit:
        begin
            if(input_num_cnt < total_input_num -1)
            begin
                input_num_cnt <= input_num_cnt +1;
            end
            else
            begin
                input_num_cnt <= 0;
            end

        end
        
        completion:
        begin
        
        end
        
        default:
        begin
        
        end
    endcase
    
    
    end
    
    
    
    always@(*)
    begin
    processed_dat_valid = 0;
    prepro_finished = 0;
    case(current_state)
    
    IDLE:
    begin
        if(trans_start)
        begin
            next_state = wait_4_reg;
        end
    else
        begin
            next_state = IDLE;
        end
    end
    
    
    wait_4_reg:
    begin
    
    `ifdef DIAG_0
      next_state = transmit;
    `endif
    
    `ifndef DIAG_0
    begin
        if(reg_wait_cnt == num_of_reg-2)
        begin
            next_state = transmit;
        end
        else
        begin
            next_state = wait_4_reg;
        end
    end
    `endif
    end
    
    
    transmit:
    begin
        processed_dat_valid = 1;
        if(input_num_cnt == total_input_num-1)
        begin
            next_state = completion;
        end
        else
        begin
            next_state = transmit;
        end
    
    end
    
    completion:
    begin
        prepro_finished = 1;
        next_state = IDLE;
    end
    
    
    default:
    begin
        next_state = IDLE;
    end
    

    endcase
    end
 */   
    
    assign processed_dat_addr = input_num_cnt;
    
    
    
    
endmodule
