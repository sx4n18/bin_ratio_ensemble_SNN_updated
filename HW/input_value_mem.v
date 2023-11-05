`timescale 1ns / 1ps
module input_value_mem #(parameter INPUT_NEURON_NUM=1023)(input clk,
                       input [9:0] addr_in,
                       input wr_en,
                       input [7:0] data_in,
                       input [9:0] addr_out,
                       output reg [7:0] data_out);


reg [7:0] input_data_value [0:INPUT_NEURON_NUM-1];


//This initialisation only happens because I needed values inside to do the test
initial
begin
   //This line is for the older version of vivado on vlx server
   $readmemb("/home/s2033411/FPGA_proj/bin_ratio_ensemble_SNN_updated/mem/input_value_int.mem", input_data_value);
   //This line is for the newer version of vivado on linux laptop
   //$readmemb("input_value_int.mem", input_data_value);
end
//This initialisation only happens because I needed values inside to do the test


always @(posedge clk)
if (wr_en)
begin
    input_data_value[addr_in] <= data_in;
end
else
begin
    data_out <=  input_data_value[addr_out];
end



endmodule
