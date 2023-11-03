`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 12:40:51 PM
// Design Name: 
// Module Name: controller_state_machine_2nd_layer
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


module controller_state_machine_2nd_layer(

          input clk,
          input rst_n,
          input incoming_spike,
          //input [5:0] input_spike_index,
          input [7:0] begin_index_point,
          input [7:0] end_index_point,
          input get_winner,
          input signed [15:0] processed_mem_voltage,
          //output reg [5:0] hidden_neuron_index,
          output reg [7:0] CSC_w_addr,
          output reg [4:0] voltage_mem_addr,
          output reg [15:0] voltage_mem_init,
          output reg [1:0] voltage_mem_ctrl,
          output reg load_mem_vol,
          output reg weight_valid,
          output reg export_voltage,
          output reg spike_processed,
          output reg infer_ready,
          output reg [4:0] winner_id
         
    );
    
    reg [3:0] current_state, next_state;
    //reg [7:0] compute_index_cnt;
    reg [7:0] begin_pnt, end_pnt;
    reg signed [15:0] max_activation;
    reg [4:0] temp_winner_id;
    
    parameter Init = 0;
    parameter IDLE = 1;
    parameter fetch_index = 2;
    parameter fetch_w_0 = 3;
    parameter fetch_w_1 = 4;
    parameter load_vol = 5;
    parameter compute = 6;
    parameter dump_voltage_0 = 7;
    parameter dump_voltage_1 = 8;
    parameter finish_spk = 9;
    parameter evaluate_0 = 10;
    parameter evaluate_1 = 11;
    parameter completion = 12;
    
    
    always @(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
        begin
            current_state <= Init;
            CSC_w_addr <= 0;
            voltage_mem_addr <= 0;
            //voltage_mem_init <= 0;
            max_activation <= 16'h8000;
            temp_winner_id <= 0;
            winner_id <= 0;
            end_pnt <= 0;
        end
        else
        begin
        current_state <= next_state;
        
        case(current_state)
        
        Init:
        begin
        if(voltage_mem_addr < 17)
            voltage_mem_addr <= voltage_mem_addr +1;
        else
            voltage_mem_addr <= 0;
        end
        
        IDLE:
        begin
        
        end
        
        fetch_index:
        begin
            //compute_index_cnt <= begin_index_point;
            CSC_w_addr <= begin_index_point;
            end_pnt <= end_index_point;
        end
        
        
        fetch_w_0:
        begin
            /*
            if(compute_index_cnt < end_pnt)
            begin
                compute_index_cnt <= compute_index_cnt +1;
            end
            else
            begin
                compute_index_cnt <= 0;
            end
            */
        end
        
        fetch_w_1:
        begin
        
        end
        
        compute:
        begin
        
        end
        
        dump_voltage_0:
        begin
        
        end
        
        dump_voltage_1:
        begin
            if(CSC_w_addr < end_pnt-1)
            begin
                //compute_index_cnt <= compute_index_cnt +1;
                CSC_w_addr <= CSC_w_addr +1;
                
            end
            else
            begin
                //compute_index_cnt <= 0;
                CSC_w_addr <= 0;
            end
        end
        
        
        finish_spk:
        begin
        
        end
        
        evaluate_0: //increment the voltage memory address to read out the processsed memory voltage
        begin
        if(voltage_mem_addr < 17)
        begin
            voltage_mem_addr <= voltage_mem_addr +1;
        end
        else
        begin
            voltage_mem_addr <= 0;
        end
        if(processed_mem_voltage > max_activation && voltage_mem_addr > 0) // start comparing at the second clock cycle of this state since the voltage will arrive one clock cycle late
        begin
            max_activation <= processed_mem_voltage;
            temp_winner_id <= voltage_mem_addr-1;
        end
        
        
        end
        
        evaluate_1: // leave another clock cycle to get the winner and also get the last voltage.
        begin
        if(processed_mem_voltage > max_activation)
        begin
            max_activation <= processed_mem_voltage;
            winner_id <= 17;
        end
        else
        begin
            winner_id <= temp_winner_id;
        end
        end
        
        completion:
        begin
            max_activation <= 16'h8000;
            temp_winner_id <= 0;
        end
        
        default:
        begin
        
        end
        
        
        endcase
     end
    end
    
    always @(*)
    begin
    
        voltage_mem_init = 0;
        voltage_mem_ctrl = 2'b00;
        load_mem_vol = 0;
        weight_valid = 0;
        spike_processed = 0;
        export_voltage = 0;
        infer_ready = 0;
        
        case(current_state)
        
        Init:
        begin
            voltage_mem_init = 63;
            voltage_mem_ctrl = 2'b11;
            if (voltage_mem_addr == 17)
            begin
                next_state = IDLE;
            end
            else
            begin
                next_state  = Init;
            end
        end
        
        IDLE:
        begin
            if (get_winner)
            begin
                next_state = evaluate_0;
            end            
            else if(incoming_spike)
            begin
                next_state = fetch_index;
            end
            else
            begin
                next_state = IDLE;
            end
        end
        
        fetch_index:
        begin
            next_state = fetch_w_0;
        
        end
        
        
        fetch_w_0:
        begin
            next_state = fetch_w_1;
        end
        
        fetch_w_1:
        begin
            next_state = load_vol;

        end
        
        load_vol:
        begin
            load_mem_vol = 1;
            next_state = compute;
        end
        
        compute:
        begin
            weight_valid = 1;
            next_state = dump_voltage_0;
        end
        
        dump_voltage_0:
        begin
            export_voltage = 1;
            next_state = dump_voltage_1;
        end
        
        dump_voltage_1:
        begin
            if(CSC_w_addr < end_pnt-1)
            begin
                next_state = fetch_w_0;
            end
            else
            begin
                next_state = finish_spk;
            end
        end
        
        
        finish_spk:
        begin
            spike_processed = 1;
            next_state = IDLE;
        end
        
        evaluate_0:
        begin
            voltage_mem_ctrl = 2'b10;
            next_state = evaluate_1;
            if(voltage_mem_addr == 17)
            begin
                next_state = evaluate_1;
            end
            else
            begin
                next_state = evaluate_0;
            end
        end
        
        evaluate_1:
        begin
            next_state = completion;
            
        end
        completion:
        begin
            infer_ready = 1;
            next_state = Init;
        end
        
        default:
        begin
            next_state = Init;
        end
        
        
        endcase
    end
    
endmodule
