`timescale 1ns / 1ps
module voltage_mem #(NEURON_NUM=40) (input clk,
                   input wr_en,
                   input [5:0] addr,
                   input [15:0] post_mem_vol,
                   output reg [15:0] pre_mem_vol
                   );
                   
                   
reg [15:0] voltage_memory [0:NEURON_NUM-1];          

always @(posedge clk)
begin
   if (wr_en)
   begin
     voltage_memory[addr] <= post_mem_vol;
   end
   else
   begin
     pre_mem_vol <= voltage_memory[addr];
   end
end


endmodule
