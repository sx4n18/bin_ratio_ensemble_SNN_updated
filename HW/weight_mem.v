`timescale 1ns / 1ps
module weight_mem #(FILENAME="CSR_weightA.mem") (input clk,
                   input [13:0] addr,
                   output reg [7:0] weight,
                   output reg [9:0] index);

reg [17:0] CSR_weight_mem [0:2**14-1];


initial
begin
 //This line is for the older version of vivado on vlx server
 //$readmemb({"/home/s2033411/FPGA_proj/bin_ratio_ensemble_SNN_updated/mem/", FILENAME}, CSR_weight_mem);
 //This line is for the newer version of vivado on linux laptop
 $readmemb(FILENAME, CSR_weight_mem);
end


always @(posedge clk)
{index, weight} <= CSR_weight_mem[addr];

endmodule
