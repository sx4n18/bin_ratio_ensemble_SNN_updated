`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 04:32:49 PM
// Design Name: 
// Module Name: Spiking_no_fire_TOP
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


module Spiking_no_fire_TOP #(diagonal=0)(
       input clk,
       input rst_n,
       input spike_in,
       input [5:0] spike_AER,
       input get_winner,
       output spike_done,
       output [4:0] winner_id,
       output infer_ready

    );
    
 // internal registers and wires
 wire load_mem_vol, weight_valid, export_en, voltage_memory_write_enable;
 reg export_en_delayed;
 wire [7:0] CSC_w_addr, begin_index_point, end_index_point, syn_weight;
 wire [15:0] pre_mem_vol, post_mem_vol, voltage_mem_init;
 reg [15:0] init_or_processed_volt;
 wire [1:0] voltage_mem_ctrl;
 wire [4:0] voltage_mem_addr, col_index;
 reg [4:0] last_lay_neuron_index;
 wire [5:0] hidden_neuron_index;
    
 //parameters to be passed into the sub modules
 localparam [7:0] ascii_index = "A" + diagonal;
 localparam index_mem_file_name = {"weight_index", ascii_index, ".mem"};
 localparam CSC_weight_mem_file_name = {"CSC_weight", ascii_index, ".mem"};   
    
// module instantiation

controller_state_machine_2nd_layer controller_SM_2nd_unit (
           clk,
           rst_n,
           spike_in,
           //spike_AER,
           begin_index_point,
           end_index_point,
           get_winner,
           pre_mem_vol,
           //hidden_neuron_index,
           CSC_w_addr,
           voltage_mem_addr,
           voltage_mem_init,
           voltage_mem_ctrl,
           load_mem_vol,
           weight_valid,
           export_en,
           spike_done,
           infer_ready,
           winner_id
         );
    
    
    acc_INF_neuron INF_neuron_uut (
       clk,
       rst_n,
       syn_weight,
       pre_mem_vol,
       export_en,
       load_mem_vol,
       weight_valid,
       post_mem_vol);
       
    voltage_mem #(18) voltage_mem_uut (
                    clk,
                   voltage_memory_write_enable,
                   {1'b0, last_lay_neuron_index},
                   init_or_processed_volt,
                   pre_mem_vol
    
    );
    
    CSC_weight_mem #(CSC_weight_mem_file_name) CSC_w_memory_uut (
     
     clk,
     CSC_w_addr,
     col_index,
     syn_weight
    );
    
    index_mem #(index_mem_file_name) index_memory_uut(
         clk,
         spike_AER,
         begin_index_point,
         end_index_point
    );
    
    
    
    //internal logic
    always @(*)
    begin
        if (voltage_mem_ctrl == 2'b11) // state machine write for initialisation
        begin
            last_lay_neuron_index = voltage_mem_addr;
            init_or_processed_volt = voltage_mem_init;
        end
        else if(voltage_mem_ctrl == 2'b10) // state machine read for evaluation
        begin
            last_lay_neuron_index = voltage_mem_addr;
            init_or_processed_volt = post_mem_vol;
        end
        else
        begin // IF neuron dump voltage back into the memory
            last_lay_neuron_index = col_index;
            init_or_processed_volt = post_mem_vol;
        end
    end
    
    always@(posedge clk)
    begin
        export_en_delayed <= export_en;
    end
    
    
    
    assign voltage_memory_write_enable = (voltage_mem_ctrl[1]&voltage_mem_ctrl[0]) | export_en_delayed; // memory write will be only enabled when vol_mem_ctrl == 2'b11 or export_en_delayed == 1
    
    
    
endmodule
