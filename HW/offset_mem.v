`timescale 1ns / 1ps
module offset_memory_first_layer #(NEURON_NUM=40, FILENAME="offset_memA.mem")
                 (input [5:0] addr,
                  input clk,
                  output reg [9:0] output_data
                  );

//parameter bitwidth = $clog2(PRE_NEURON_NUM);

reg [9:0] offset_mem [0:NEURON_NUM-1];

initial
begin
 //This line is for the older version of vivado on vlx server
 //$readmemb({"/home/s2033411/FPGA_proj/bin_ratio_ensemble_SNN_updated/mem/", FILENAME}, offset_mem);
 //This line is for the newer version of vivado on linux laptop
 $readmemb(FILENAME, offset_mem);
end


always @(posedge clk)
output_data <= offset_mem[addr];


endmodule
