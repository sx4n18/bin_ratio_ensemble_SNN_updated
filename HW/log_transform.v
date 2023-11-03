`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2023 01:40:04 PM
// Design Name: 
// Module Name: log_transform
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


module log_transform(
            input [19:0] raw_dat,
            output reg [7:0] logged_dat

    );
    
    parameter sqrt_2_in_20bit = 20'b1011_0101_0000_0100_1111;
    
    function automatic integer logb2 (input [19:0] value);
    
    integer i;
    //integer shif_v;
    begin
        //$display("Value : %b", value);
        logb2 = 0;
        //shif_v = value;
        //for(i=1; (value>>i)>0; i = i+1) // getting the bitwidth needed to represent the value
        //begin
        //end
 //       begin
  //      end
        casex(value)
        
        20'b0000_0000_0000_0000_0001: i = 1;
        20'b0000_0000_0000_0000_001?: i = 2;
        20'b0000_0000_0000_0000_01??: i = 3;
        20'b0000_0000_0000_0000_1???: i = 4;
        20'b0000_0000_0000_0001_????: i = 5;
        20'b0000_0000_0000_001?_????: i = 6;
        20'b0000_0000_0000_01??_????: i = 7;
        20'b0000_0000_0000_1???_????: i = 8;
        20'b0000_0000_0001_????_????: i = 9;
        20'b0000_0000_001?_????_????: i = 10;
        20'b0000_0000_01??_????_????: i = 11;
        20'b0000_0000_1???_????_????: i = 12;
        20'b0000_0001_????_????_????: i = 13;
        20'b0000_001?_????_????_????: i = 14;
        20'b0000_01??_????_????_????: i = 15;
        20'b0000_1???_????_????_????: i = 16;
        20'b0001_????_????_????_????: i = 17;
        20'b001?_????_????_????_????: i = 18;
        20'b01??_????_????_????_????: i = 19;
        20'b1???_????_????_????_????: i = 20;
        default:
        i = 20;
        
        endcase
        //$display("Max bits needed: %d", i);
        //$display("Comparison value: %b", value<<(20-i));
        if ((value<<(20-i))> sqrt_2_in_20bit) // if the number is bigger than sqrt2 in the fractional part
        begin
            logb2 = i;
            //$display("Should be ceiling");
            //$display(" ");
            
        end
        else 
        begin
            logb2 = i-1;
            //$display("Should be flooring");
            //$display(" ");
        end
        
        /*
                logb2 = 0;
        for(i=0; 2**i< value; i = i+1)
        if ((value<< 20-i-1)> sqrt_2_in_20bit)
        begin
        logb2 = i +1;
        end
        else
        logb2 = i;
        */
    end
    
    endfunction 
/*    
    function integer clogb2;
input [31:0] value;
integer i;
begin
clogb2 = 0;
for(i = 0; 2**i < value; i = i + 1)
clogb2 = i + 1;
end
endfunction
*/

always@(raw_dat)
    logged_dat = logb2(raw_dat+1);
    
    
    
endmodule
