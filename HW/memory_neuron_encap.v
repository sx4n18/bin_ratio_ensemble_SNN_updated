`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2023 19:22:19
// Design Name: 
// Module Name: memory_neuron_encap
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


module memory_neuron_encap(
              
              input clk,
              input rst_n,
              input PP_DONE,
              input [9:0] LOAD_input_value_ADDR,
              input LOAD_input_en,
              input [7:0] Pre_processed_dat,
              output DATA_out_ready

              

    );
 
 
wire [5:0] OFFSET_ADDR;
wire [9:0] OFFSET_VALUE;
wire [13:0] CSR_W_ADDR;
wire [9:0] ROW_INDEX;
wire [7:0] ACT_B4_NEURON;
reg [7:0] Delayed_weight;
reg voltage_mem_write_en;
wire [7:0] weight_out_of_mem;
wire [15:0] mem_vol_after_computation;
wire [15:0] mem_vol_b4_computation;
wire WNA_valid, load_voltage, export_voltage;

  

input_value_mem  #(1023) input_memory (clk,
                       LOAD_input_value_ADDR,
                       LOAD_input_en,
                       Pre_processed_dat,
                       ROW_INDEX,
                       ACT_B4_NEURON);


offset_memory_first_layer  #(40) offset_memory_leading
                 (OFFSET_ADDR,
                  clk,
                  OFFSET_VALUE
                  );
               
weight_mem  CSR_weight_memory     (clk,
                                   CSR_W_ADDR,
                                    weight_out_of_mem,
                                     ROW_INDEX);   
                                                 

Controller_state_machine  layer_controller (
      clk,
      rst_n,
      PP_DONE,
      OFFSET_VALUE,
      OFFSET_ADDR,
      CSR_W_ADDR,
      WNA_valid,
      load_voltage,
      export_voltage,
      DATA_out_ready
      
    );    
    

voltage_mem #(40) voltage_memory (clk,
                        voltage_mem_write_en,
                        OFFSET_ADDR,
                        mem_vol_after_computation,
                        mem_vol_b4_computation                        
                        );
     
acc_encapsule_IF   mux_neuron_IF ( ACT_B4_NEURON,
                             Delayed_weight,
                             mem_vol_b4_computation,
                             clk,
                             rst_n,
                             export_voltage,
                             load_voltage,
                             WNA_valid,
                             mem_vol_after_computation);
  
 
 always @(posedge clk)
 begin
 Delayed_weight <= weight_out_of_mem;
 voltage_mem_write_en <= export_voltage;  
 end
 
  
endmodule
