`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 03:55:06 PM
// Design Name: 
// Module Name: byte_2_tribyte
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


module byte_2_tribyte(
            // global ports
            input             clk,
            input             rst_n,
            //input             req_from_net, // request from ensemble net
            input             read_valid_from_UART, 
            input      [7:0]  byte_rx,       
            output reg        trans_start,
            output     [19:0] raw_dat,
            output reg        trytes_received,
            input             ack_tryte

    );
    
    reg [2:0] current_state, next_state;
    reg [1:0] byte_cnt;
    reg [7:0] tri_byte [0:2];
    reg [7:0] temp_byte;
    //reg [19:0] raw_dat_mem [0:1023];
    reg [9:0] raw_dat_cnt;
    
    wire [19:0] data_in_bram, data_out_bram;
    reg write_enable;
    
    localparam IDLE = 0;
    localparam accumulate = 1;
    localparam push = 2;
    localparam pop_all = 3;
    localparam raise_intr = 4;
    
    raw_dat_bram raw_dat_memory(
                    .clk(clk),
                    .w_ea(write_enable),
                    .addr(raw_dat_cnt),
                    .data_in(data_in_bram),
                    .data_out(data_out_bram)
                    
    
    );
    
    always @(posedge clk, negedge rst_n)
    begin
        if(!rst_n)
        begin
            current_state <= IDLE;
            byte_cnt <= 0;
            raw_dat_cnt <= 0;
            temp_byte <= 0;
            tri_byte[0] <= 0;
            tri_byte[1] <= 0;
            tri_byte[2] <= 0;
            
        end
        else
        begin
            current_state <=  next_state;
            
            case(current_state)
            
            IDLE:
            begin
                if(read_valid_from_UART)
                temp_byte <= byte_rx;
                else
                temp_byte <= temp_byte;
            end
            
            accumulate:
            begin
                tri_byte[byte_cnt] <= temp_byte;
                if(byte_cnt <2)
                byte_cnt <= byte_cnt +1;
                else
                byte_cnt <= 0;
            end
            
            push:
            begin
                //raw_dat_mem[raw_dat_cnt] <= {tri_byte[2][3:0], tri_byte[1], tri_byte[0]};

            end
            
            raise_intr:
            begin
                if(ack_tryte) // this state may last more than one cycle, only update raw_dat_cnt when it has been acknowledged
                begin
                if(raw_dat_cnt < 1023)
                raw_dat_cnt <= raw_dat_cnt +1;
                else
                raw_dat_cnt <= 0; // otherwiser do nothing  
                end
                
            end
            
            pop_all:
            begin
                if(raw_dat_cnt<1023)
                raw_dat_cnt <= raw_dat_cnt +1;
                else
                raw_dat_cnt <= 0;
            end
            
            default:
            begin
            
            end
            
            endcase
        
        
        end
    
    end
    
    always@(*)
    begin
        trans_start = 0;
        write_enable = 0;
        trytes_received = 0;
        case(current_state)
        
        IDLE:
        begin
            if(read_valid_from_UART)
            next_state = accumulate;
            else
            next_state = IDLE;
        end
        
        accumulate:
        begin
            if(byte_cnt == 2)
            next_state = push;
            else
            next_state = IDLE;
        end
        
        push:
        begin
            write_enable = 1;
            next_state = raise_intr;
            /*
            if(raw_dat_cnt == 1023)
            next_state = pop_all;
            else
            next_state = IDLE;
            */
        end
        
        raise_intr:
        begin
            trytes_received = 1;
            if(ack_tryte) // axi_reader has acknowledged the trytes ready to move on
            begin
                if(raw_dat_cnt == 1023)
                next_state = pop_all;
                else
                next_state = IDLE;
            end
            else  // axi_reader did nto acknowledge the interrupt. 
            begin
                next_state = raise_intr;
            end
        end
        
        
        pop_all:
        begin
            if(raw_dat_cnt == 0)
            begin
                trans_start = 1;
                next_state = pop_all;
            end
            else if(raw_dat_cnt ==1023)
            next_state = IDLE;
            else
            next_state = pop_all;
        end
        
        default:
        begin
            next_state = IDLE;
        end
        
        endcase
    
    end
    
    assign data_in_bram = (current_state == push) ? {tri_byte[2][3:0], tri_byte[1], tri_byte[0]} : 20'd0;
    assign raw_dat = (current_state == pop_all) ? data_out_bram: 20'd0;
    
endmodule


module raw_dat_bram(
             input            clk,
             input            w_ea,
             input   [9:0]    addr,
             input   [19:0]   data_in,
             output  [19:0]   data_out
);

reg [19:0] bram_mem [0:1023];

always @(posedge clk)
begin
        if(w_ea)
        begin
            bram_mem[addr] <= data_in;
        end

end

assign data_out = (!w_ea)?  bram_mem[addr] : 'd0;

endmodule
