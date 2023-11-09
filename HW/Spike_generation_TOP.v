`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2023 02:54:57 PM
// Design Name: 
// Module Name: Spike_generation_TOP
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


module Spike_generation_TOP #(INPUT_SIZE=1023) (
     input clk,
     input rst_n,
     input [9:0] LOAD_input_value_ADDR,
     input LOAD_input_en,
     input pre_processing_done,
     input [7:0] Pre_processed_dat,
     output current_step_finished,
     output [5:0] spike_AER,
     output spike_out
    );
    
    
// internal registers and wires    
wire load_voltage, export_voltage, w_n_a_valid, vol_mem_control, vol_mem_control_sm;  
reg  export_voltage_delayed, w_n_a_valid_dlayed;
wire [5:0] offset_mem_addr;
reg  [5:0] output_spike_reminder;
wire [7:0] weight_out_of_mem, ACT_B4_NEURON;
reg  [7:0] weight_delayed;
wire [9:0] off_set_value, ROW_INDEX;
wire [13:0] CSR_w_addr;
wire [15:0] init_mem_vol, pre_mem_vol, processed_mem_vol;
reg  [15:0] init_or_processed_mem_vol;

//parameters to be passed into the instants
localparam  [7:0] diagonal = 1023 - INPUT_SIZE;
localparam  [7:0] ascii_index = "A" +diagonal;
localparam offset_mem_file_name = {"offset_mem", ascii_index, ".mem"};
localparam CSR_mem_file_name = {"CSR_weight", ascii_index, ".mem"};
// module instantiations
  
// state machine for the spike generation  
    Controller_state_machine spk_gen_SM (
       clk,
       rst_n,
       pre_processing_done,
       off_set_value,
       offset_mem_addr,
       CSR_w_addr,
       w_n_a_valid,
       load_voltage,
       export_voltage,
       vol_mem_control_sm,
       init_mem_vol,
       current_step_finished      
    );

// offset memory
offset_memory_first_layer #(40, offset_mem_file_name) offset_memory_unit(
                                        offset_mem_addr,
                                        clk,
                                        off_set_value


);

    
//  voltage memory
voltage_mem #(40) voltage_memory_unit (clk,
                   vol_mem_control,
                   offset_mem_addr,
                   init_or_processed_mem_vol,
                   pre_mem_vol

             );

// input value memory
input_value_mem  #(INPUT_SIZE) input_memory_unit (clk,
                       LOAD_input_value_ADDR,
                       LOAD_input_en,
                       Pre_processed_dat,
                       ROW_INDEX,
                       ACT_B4_NEURON);

// CSR weight memory
weight_mem #(CSR_mem_file_name) CSR_weight_memory_unit   (clk,
                                   CSR_w_addr,
                                    weight_out_of_mem,
                                     ROW_INDEX);  
                                     
// IF neuron unit
acc_encapsule_IF  mux_neuron_unit ( ACT_B4_NEURON,
                                   weight_delayed,
                         pre_mem_vol,
                         clk,
                         rst_n,
                         export_voltage,
                         load_voltage,
                         w_n_a_valid_dlayed,
                         processed_mem_vol,
                         spike_out);



// extra internal logic

// delay logic for data synchronisation
always @(posedge clk)
begin
    export_voltage_delayed <= export_voltage;
    w_n_a_valid_dlayed <= w_n_a_valid;
    weight_delayed <= weight_out_of_mem;
end

// multiplexing logic for data selection and voltage memory write enabling

always @(*)
begin
  if(vol_mem_control_sm)
  begin
    init_or_processed_mem_vol = init_mem_vol;
  end
  else if (export_voltage_delayed)
  begin
    init_or_processed_mem_vol = processed_mem_vol;
  end
  else
  begin
    init_or_processed_mem_vol = 0;
  end
end

assign vol_mem_control = export_voltage_delayed | vol_mem_control_sm;


// output spike logic

always @(posedge clk)
begin
    if(spike_out)
    begin
        output_spike_reminder <= offset_mem_addr;
    end
end

assign spike_AER = spike_out ? offset_mem_addr : output_spike_reminder;

endmodule
