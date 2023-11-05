`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2023 21:31:23
// Design Name: 
// Module Name: updated_controller_SM_sim
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


module updated_controller_SM_sim(

    );
    
    
    logic clk, rst_n, pre_processing_done;
    //logic [9:0] off_set_value;
    wire [9:0] off_set_value;
    wire [5:0] offset_mem_addr;
    wire [13:0] CSR_w_addr;
    wire [15:0] init_mem_vol;
    wire w_n_a_valid, load_voltage, export_voltage, vol_mem_control, current_step_finished, arithm;
    
    
    wire voltage_mem_wr_en;
    logic [15:0] init_or_post_mem_vol;
    wire [15:0] voltage_diff_from_neuron;
    wire [15:0] mem_vol_before_process;
    wire [15:0] voltage_diff_to_neuron;
    wire [15:0] processed_mem_vol;
    logic [7:0] weight_delayed;
    
    logic export_voltage_delayed;
    wire [9:0] weight_index;
    wire [7:0] activation_b4_neuron;
    logic w_n_a_valid_delayed;
    
    controller_SM_updated SM_uut(
          clk,
          rst_n,
          pre_processing_done,
          off_set_value,
          offset_mem_addr,
          CSR_w_addr,
          w_n_a_valid,
          load_voltage,
          export_voltage,
          vol_mem_control,
          init_mem_vol,
          current_step_finished,
          arithm  
        );
        
    offset_memory_first_layer offset_mem_uut(
            offset_mem_addr,
            clk,
            off_set_value
            
    );  
    
    double_input_voltage_mem voltage_mem_uut(
    
    clk,
    voltage_mem_wr_en,
    offset_mem_addr,
    init_or_post_mem_vol,
    voltage_diff_from_neuron,
    mem_vol_before_process,
    voltage_diff_to_neuron
    );
    
    input_value_mem act_mem_uut(
            clk,
            addr_in,
            act_wr_en,
            data_in,
            weight_index,
            activation_b4_neuron
    );
    
    acc_encapsule_IF neuron_IF_uut ( 
                             activation_b4_neuron,
                             weight_delayed,
                             mem_vol_before_process,
                             voltage_diff_to_neuron,
                             clk,
                             rst_n,
                             export_voltage,
                             load_voltage,
                             arithm,
                             w_n_a_valid_delayed,
                             processed_mem_vol,
                             voltage_diff_from_neuron, 
                             spk
                             );
                             
    weight_mem CSR_weight_mem_uut(
                clk,
                CSR_w_addr,
                weight_out_mem,
                weight_index
    
    );
                             
    always_ff @(posedge clk)
    begin
        export_voltage_delayed <= export_voltage;
        w_n_a_valid_delayed <= w_n_a_valid;
        weight_delayed <= weight_out_mem;
        
    end
                          
    always_comb
    begin
        if(vol_mem_control)
            init_or_post_mem_vol = init_mem_vol;
        else if(export_voltage_delayed)
            init_or_post_mem_vol = processed_mem_vol;
        else
            init_or_post_mem_vol = 0;
    
    end
   
   assign voltage_mem_wr_en = export_voltage_delayed | vol_mem_control; 
    
    
   initial
   begin
       clk = 0;
       rst_n = 1;
       pre_processing_done = 0;
       //off_set_value = 0;
       #10
       rst_n = 0;
       #50
       rst_n = 1;
       #900
       pre_processing_done = 1;
       #20
       pre_processing_done = 0;
       //off_set_value = 342;
       #500
       $finish;
       
   end     
 
 
 always #5 clk = ~clk;
        
endmodule
