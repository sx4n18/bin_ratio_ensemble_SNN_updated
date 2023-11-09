`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2023 02:55:35 PM
// Design Name: 
// Module Name: Spike_generation_TOP_updated
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  This is the updated spike generation top with updated statemachine.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Spike_generation_TOP_updated #(INPUT_SIZE=1023)(

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
    
    
    //internal wires and registers
    wire [9:0] off_set_value;
    wire [5:0] offset_mem_addr;
    wire [13:0] CSR_w_addr;
    wire [15:0] init_mem_vol;
    wire w_n_a_valid, load_voltage, export_voltage, vol_mem_control, arithm;
    
    
    wire voltage_mem_wr_en;
    reg [15:0] init_or_post_mem_vol;
    wire [15:0] voltage_diff_from_neuron;
    wire [15:0] mem_vol_before_process;
    wire [15:0] voltage_diff_to_neuron;
    wire [15:0] processed_mem_vol;
    wire [7:0] weight_out_mem;
    reg [7:0] weight_delayed;
    
    reg export_voltage_delayed;
    wire [9:0] weight_index;
    wire [7:0] activation_b4_neuron;
    reg w_n_a_valid_delayed;
    reg [5:0] AER_reminder;
    

    //parameters to be passed into the instants
    localparam  [7:0] diagonal = 1023 - INPUT_SIZE;
    localparam  [7:0] ascii_index = "A" +diagonal;
    localparam offset_mem_file_name = {"offset_mem", ascii_index, ".mem"};
    localparam CSR_mem_file_name = {"CSR_weight", ascii_index, ".mem"};
    
    //module instantiation
    
    //state machine for the control and output
    controller_SM_updated controller_updated_unit(
       clk,                         //clk
       rst_n,                       //reset
       pre_processing_done,         //signal indicating the process is finished
       off_set_value,               //[9:0] offset values from the offset memory
       offset_mem_addr,             //[5:0] offset memory address to fetch the value
       CSR_w_addr,                  //[13:0] CSR weight memory address
       w_n_a_valid,                 //valid signal enabling the computation of the neuron
       load_voltage,                //load voltage to enable the neuron to load up voltage to acc
       export_voltage,              //export voltage signal to make neuron export the voltage
       vol_mem_control,             //voltage memory control to be used if SM needs to initialise the voltage memory
       init_mem_vol,                //[15:0] initialisation voltage for voltage mem     
       current_step_finished,       //signal indicating 4 time steps have finished
       arithm                       //compute option to toggle MAC and ACC for neuron
    );
    
    //offset memory
    offset_memory_first_layer #(40, offset_mem_file_name)offset_mem_unit(
            offset_mem_addr,        //[5:0] offset memory address indicating which neuron we are computing
            clk,                    //clk
            off_set_value           //[9:0] offset value: how many iterations for one neuron           
    );  
    
    
    //voltage memory: an updated double input voltage memory to save both the voltage and voltage difference
    double_input_voltage_mem voltage_mem_unit(
            clk,                        //clk
            voltage_mem_wr_en,          //voltage write enable, it could be controlled by state machine during initialisation and post-computation
            offset_mem_addr,            //[5:0] offset memory address indicating which neuron we are dealing with 
            init_or_post_mem_vol,       //[15:0] could be initialisation voltage or post-computation voltage
            voltage_diff_from_neuron,   //[15:0] voltage difference at one single time step, this is input
            mem_vol_before_process,     //[15:0] voltage before current time step
            voltage_diff_to_neuron      //[15:0] voltage difference at one single time step, this is the output to neuron
    );
    
    //weight memory CSR 
    weight_mem #(CSR_mem_file_name) CSR_weight_mem_unit(
            clk,                //clk
            CSR_w_addr,         //[13:0] CSR weight memory address
            weight_out_mem,     //[7:0] weight coming out of the memory
            weight_index        //[9:0] the corresponding input neuron index to load activation for this weight
    
    );
    
    
    //input_value_memory
    input_value_mem #(INPUT_SIZE) activation_mem_unit(
            clk,                    //clk
            LOAD_input_value_ADDR,  //[9:0] address input to save the processed value
            LOAD_input_en,          //write enable to load the processed value
            Pre_processed_dat,      //[7:0] processed data from preprocessing
            weight_index,           //[9:0] reading addr from weight memory 
            activation_b4_neuron    //[7:0] activation read from the memory
    );
    
    //updated neuron module capable of doing both MAC and ACC
    acc_encapsule_IF neuron_IF_unit ( 
            activation_b4_neuron,       //[7:0] activation coming out of input value memory
            weight_delayed,             //[7:0] weight coming from the weight memory, delayed because of the access needed for input value memory
            mem_vol_before_process,     //[15:0] voltage before computation
            voltage_diff_to_neuron,     //[15:0] voltage difference from the voltage mem
            clk,                        //clk
            rst_n,                      //reset
            export_voltage,             //export voltage signal to output the accumulation result
            load_voltage,               //load in the voltage needed for computation
            arithm,                     //option to toggle MAC and ACC
            w_n_a_valid_delayed,        //input valid signal delayed because activation is one cycle late than weight
            processed_mem_vol,          //[15:0] mem voltage after computation
            voltage_diff_from_neuron,   //[15:0] voltage difference after computation: =voltage_diff_to_neuron if arithm=1; else = accumulation - 63
            spike_out                   //spike
   );
   
   
   //extra internal logic
   always@(*)
   begin
        if(vol_mem_control)
            init_or_post_mem_vol = init_mem_vol;
        else if(export_voltage_delayed)
            init_or_post_mem_vol = processed_mem_vol;
        else
            init_or_post_mem_vol = 0;
   end
   
   //extra requential logic
   //delay logic
   always@(posedge clk)
   begin
        export_voltage_delayed <= export_voltage;
        w_n_a_valid_delayed <= w_n_a_valid;
        weight_delayed <= weight_out_mem;
   end
   
   //AER logic
   always@(posedge clk, negedge rst_n)
   begin
        if(!rst_n)
            AER_reminder <= 0;
        else 
        begin
            if(spike_out)
            begin
                AER_reminder <= offset_mem_addr;
            end
            else
            begin
                AER_reminder <= AER_reminder;
            end
        end
   end
   
   //combinational logic for wire
   assign voltage_mem_wr_en = export_voltage_delayed | vol_mem_control; 
   assign spike_AER = spike_out? offset_mem_addr : AER_reminder;  
   
endmodule
