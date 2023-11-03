`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2023 02:26:17 PM
// Design Name: 
// Module Name: updated_neuron_sim
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


module updated_neuron_sim(

    );
    
    
    logic signed [7:0]  activation, weight;
    logic signed [15:0] input_mem_vol, mem_vol_diff_2_be_add;
    logic clk,rst_n, output_en, load_en, arithm, input_valid;
    wire [15:0] out_mem_vol, post_mem_vol_diff;
    wire spike_out;
      
    
acc_encapsule_IF neuron_uut(  activation, // 8 bit activation
                              weight,   // 8 bit weight
                              input_mem_vol, // 16 bit input membrane voltage
                              mem_vol_diff_2_be_add, // 16 bit membrane voltage difference
                              clk, // clk
                              rst_n, // reset
                              output_en, // output enable
                              load_en, // load enable
                              arithm, // decide the arithmatic the neuron will do
                              input_valid, // input at this point is valid
                              out_mem_vol, // 16 bits output membrane voltage
                              post_mem_vol_diff,  // 16 bit membrane voltage difference
                              spike_out // spike out
                          ); 

initial
begin
    clk = 0;
    rst_n = 1;
    activation = 0;
    weight = 0;
    input_mem_vol = 0;
    mem_vol_diff_2_be_add = 0;
    output_en = 0;
    input_valid = 0;
    load_en = 0;
    arithm = 0;
    #10
    rst_n = 0;
    #10
    rst_n = 1;
    #20
    // load the voltage
    load_en = 1;
    input_mem_vol = 63;
    #20
    load_en = 0;
    
    
    #20;
    // make the neuron do the computation
    arithm = 0;
    input_valid = 1;
    activation = 5;
    weight = 8;
    #20
    input_valid = 0;
    
    #20
    input_valid = 1;
    activation = 9;
    weight = -4;
    #20
    input_valid = 0;
    
    #20
    input_valid = 1;
    activation = -7;
    weight = 10;
    #20
    input_valid = 0;
    
    #20
    input_valid = 1;
    activation = -5;
    weight = -3;
    #20
    input_valid = 0;
    
    // output the voltage change
    #20
    output_en = 1;
    #20
    output_en = 0;
    
    
    // switch to accumulate mode
    #20
    load_en = 1;
    input_mem_vol = 63;
    #20
    load_en = 0;
    
    #20
    arithm = 1;
    input_valid = 1;
    activation = 40;
    weight = 1;
    mem_vol_diff_2_be_add = 43;
    #20
    input_valid = 0;
    
    #20 
    input_valid = 1;
    activation = -4;
    weight = -3;
    mem_vol_diff_2_be_add = 120;
    #20
    input_valid = 0;
    
    #20
    output_en = 1;
    #20
    output_en = 0;
    #100
    $finish;
    
    
end


always #10 clk = ~clk;

endmodule
