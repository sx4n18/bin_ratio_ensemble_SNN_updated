`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 02:42:33 PM
// Design Name: 
// Module Name: IF_neuron
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  The combinational implementation of the integrate and fire neuron, simply just a
//  DSP unit
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module IF_neuron (
                  input signed [7:0] activation, // activation a
                  input signed [7:0] weight,     // weight b
                  input signed [15:0] pre_acc_mem_vol, // previous accumulated membrane voltage
                  input signed [15:0] mem_vol_diff, // memoray voltage difference
                  input arithm, // decides to do mac or acc
                  output reg signed [15:0] post_acc_mem_vol, // output voltage
                  output reg of_flag);

    wire signed [15:0] mid_mul;
    signed_mul simple_sign_mul(activation, weight, mid_mul);
    
//assign      {of_flag,post_acc_mem_vol} = mid_mul + pre_acc_mem_vol;

always @(*)
begin
    if(!arithm) // doing mac when arithm == 0
    begin
        {of_flag, post_acc_mem_vol} = mid_mul + pre_acc_mem_vol;
    end
    else
    begin
        post_acc_mem_vol = pre_acc_mem_vol + mem_vol_diff;
        of_flag = 0;
    end
end


endmodule


module signed_mul(input signed [7:0] a,
                  input signed [7:0] b,
                  output signed [15:0] c );

        assign c = a*b;
endmodule