`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 03:24:33 PM
// Design Name: 
// Module Name: AXI_reader
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


module AXI_reader(      
        // AXI_lite ports
        // global ports
        input               m_axi_aclk,
        input               m_axi_aresetn,
        // write address channel
        output logic [3:0]  m_axi_awaddr,
        output logic        m_axi_awvalid,
        input               m_axi_awready,
        // write data channel
        output logic [31:0] m_axi_wdata,
        output logic [3:0]  m_axi_wstrb,
        output logic        m_axi_wvalid,
        input               m_axi_wready,
        // write response channel
        input        [1:0]  m_axi_bresp,
        input               m_axi_bvalid,
        output logic        m_axi_bready,
        // read address channel
        output logic [3:0]  m_axi_araddr,
        output logic        m_axi_arvalid,
        input               m_axi_arready,
        // read data channel,
        input        [31:0] m_axi_rdata,
        input        [1:0]  m_axi_rresp,
        input               m_axi_rvalid,
        output logic        m_axi_rready,
        // AXI_lite ports
        
        // other ports
        input               read_signal,
        output logic        read_valid,
        output       [7:0]  out_data_from_AXI,
        input               infer_ready,
        input        [4:0]  winner_ID,
        input               trytes_rec,
        output logic        ack_tryte

    );
    
    
    logic [2:0] current_state, next_state;
    logic [31:0] data_reg, write_data_reg;
    logic [3:0] default_read_addr, default_write_addr;
    logic read_data_or_statN;
    

    
    localparam IDLE = 0;
    localparam raise_read_req = 1;
    localparam read_req_HS = 2; // read_req_handshake
    localparam output_read = 3;
    localparam Init = 4;
    localparam raise_write_req = 5;
    localparam write_req_HS = 6;
    localparam answer_itrp = 7;
    localparam [7:0] handshake_sign = 8'h58;
    
    
    
    always_ff 
    @(posedge m_axi_aclk, negedge m_axi_aresetn)
    begin
        if(!m_axi_aresetn)
        begin
            current_state <= Init;
            data_reg <= 0;
            default_read_addr <= 4'h8;
            default_write_addr <= 4'h4;
            write_data_reg <= 0;
            read_data_or_statN <= 0;
    
        end
        else
        begin
            current_state <= next_state;
            
        case(current_state)
        
        Init:
        begin
            write_data_reg <= 32'h000B;
            default_write_addr <= 4'hC;
        end
        
        
        IDLE:
        begin
            default_write_addr <= 4'h4; // reset the write address back to the write out fifo
            
            if(infer_ready) // if there is write out needs when ensemble has an answer it has topppp priority
            begin
                write_data_reg <= {27'd0,winner_ID}; // update the write data reg with the new winner ID 32 = 27 + 5
            end
            else if (trytes_rec) // received 3 bytes asking for next 
            begin
                write_data_reg <= {27'd0,handshake_sign}; // write out Capital X as handshake
            end
            else
            begin
                write_data_reg <= write_data_reg; // otherwise the data should be 0
            end
        end
        
        raise_read_req:
        begin
        
        end
        
        read_req_HS:
        begin
            if(m_axi_rvalid && read_data_or_statN) // if valid data has arrived and we are reading data from fifo
            begin
                data_reg <= m_axi_rdata; // save up the data we just read
                read_data_or_statN <= 0; // set to read the stat reg again
                default_read_addr <= 4'h8; // change the read address back to stat reg
            end
            else if (m_axi_rvalid && !(read_data_or_statN)) // if valid data has arrived and we are reading from stat reg
            begin
                if (m_axi_rdata[0]) // receive fifo has valid data
                begin
                    read_data_or_statN <= 1; // set another read cycle and read from data
                    default_read_addr <= 4'h0; // set read address to 0 that is pointing to the rx fifo
                end
                else
                begin
                    read_data_or_statN <= 0;
                end
            end
        end
        
        output_read:
        begin
            
        end
        
        default:
        begin
        
        end
        
        endcase
        end
    end
    
   
    
    always_comb
    begin
        m_axi_awaddr = default_write_addr;
        m_axi_awvalid = 0;
        m_axi_wdata = 0;
        m_axi_wstrb = 0;
        m_axi_wvalid = 0;
        m_axi_bready = 0;
        m_axi_araddr = default_read_addr;
        m_axi_arvalid = 0;
        m_axi_rready = 0;
        read_valid = 0;
        ack_tryte = 0;
        case(current_state)
        
        Init:
        begin
            next_state = raise_write_req;
        end
        
        raise_write_req:
        begin
            m_axi_awvalid = 1;
            m_axi_wdata = write_data_reg;
            m_axi_wvalid = 1;
            m_axi_bready = 1;
            if(m_axi_awready && m_axi_wready)
            begin
                next_state = write_req_HS;
            end
            else
            begin
                next_state = raise_write_req;
            end
        end
        
        write_req_HS:
        begin
            m_axi_bready = 1;
            if(m_axi_bresp ==0 && m_axi_bvalid)
            begin
                next_state = IDLE;
            end
            else
            begin
                next_state = write_req_HS;
            end
        end
        
        
        IDLE:
        begin
            if(infer_ready) // infer ready has top priority followed by interrupt given by organiser
            begin
                next_state = raise_write_req; // start writing out the data
            end
            else if (trytes_rec) // interrupt raised by organiser
            begin
                next_state = answer_itrp;
            end
            else if(read_signal) // if !infer_ready && read_signal
            begin
                next_state = raise_read_req;
            end
            else
            begin
                next_state = IDLE;
            end
        end
        
        answer_itrp:
        begin
            ack_tryte = 1; // acknowledge the interrupt and move on to write sequence
            next_state = raise_write_req;
        end 
        
        raise_read_req:
        begin
            
            m_axi_arvalid = 1;
            m_axi_rready = 1;
            if (m_axi_arready)
            begin
                next_state = read_req_HS;
            end
            else
            begin
                next_state = raise_read_req;
            end
        end
        
        read_req_HS:
        begin
            m_axi_rready = 1;
            if(m_axi_rvalid && read_data_or_statN) // if data is valid, and we are reading data
            begin
                next_state = output_read; // output the data we just read
            end
            else if (m_axi_rvalid && !(read_data_or_statN)) // if data is valid, and we are reading from stat reg
            begin
                next_state = IDLE; // set another reading cycle until
            end
            else // data is not valid yet
            begin
                next_state = read_req_HS;
            end
        end
        
        
        output_read:
        begin
            read_valid = 1;
            next_state = IDLE;
        end
        
        default:
        begin
            next_state = IDLE;
        end
        
        endcase
    end
    
    assign out_data_from_AXI = data_reg[7:0];
    
endmodule