`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2023 02:42:33 PM
// Design Name: 
// Module Name: acc_encapsule_IF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  The sequantial implementation of the integrate and fire neuron, this is the encapsulation
//  of the combinational IF_neuron, so that it will be controlled correctly
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module acc_encapsule_IF( input [7:0] activation,
                         input [7:0] weight,
                         input [15:0] input_mem_vol,
                         input [15:0] mem_vol_diff_2_be_add,
                         input clk,
                         input rst_n,
                         input output_en,
                         input load_en,
                         input arithm,
                         input input_valid,
                         output logic [15:0] out_mem_vol,
                         output logic signed [15:0] post_mem_vol_diff, 
                         output logic spike_out);


  logic signed [15:0] accumulator;
  logic signed [15:0] voltage_diff;
  parameter Threshold = 127;
  wire [15:0] internal_sum;

IF_neuron mulplex_IF_neuron(activation, weight, accumulator, voltage_diff, arithm, internal_sum);



always_ff @(posedge clk, negedge rst_n)
begin
    if (!rst_n)
     begin
     accumulator <= 0;
     out_mem_vol <= 0;
     spike_out <= 0;
     post_mem_vol_diff <= 0;
     voltage_diff <= 0;
     end
    else
      begin
          if (output_en) // output logic 
          begin
            accumulator <= 0;
            
            //post_mem_vol_diff logic 
            if(arithm) // accumulation
            begin
                post_mem_vol_diff <= voltage_diff; // difference
            end
            else  // multiplication and accumulation
            begin
                post_mem_vol_diff <= accumulator - 63;      
            end
            
            // output_mem_vol logic: spike or not?
            if(accumulator >= Threshold)
            begin
                out_mem_vol <= accumulator - Threshold;
                spike_out <= 1;
            end
            else
            begin
                out_mem_vol <= accumulator;

                spike_out <= 0;
            end
          end
          
          else if(load_en) // loading the voltage into the neuron
               begin
                 accumulator <= input_mem_vol;
                 voltage_diff <= mem_vol_diff_2_be_add;
               end
          else if (input_valid) //input is valid
          begin           
              accumulator <= internal_sum;
          end
          else
          begin
          spike_out <= 0;
          accumulator <= accumulator;
          end
   
      end
end

endmodule