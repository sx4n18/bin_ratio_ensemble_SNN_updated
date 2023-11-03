`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 04:11:04 PM
// Design Name: 
// Module Name: axi_reader_unit_wrapper
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


module axi_reader_unit_wrapper(
                // AXI_lite ports
        // global ports
        input               m_axi_aclk,
        input               m_axi_aresetn,
        // write address channel
        output       [3:0]  m_axi_awaddr,
        output              m_axi_awvalid,
        input               m_axi_awready,
        // write data channel
        output       [31:0] m_axi_wdata,
        output       [3:0]  m_axi_wstrb,
        output              m_axi_wvalid,
        input               m_axi_wready,
        // write response channel
        input        [1:0]  m_axi_bresp,
        input               m_axi_bvalid,
        output              m_axi_bready,
        // read address channel
        output       [3:0]  m_axi_araddr,
        output              m_axi_arvalid,
        input               m_axi_arready,
        // read data channel,
        input        [31:0] m_axi_rdata,
        input        [1:0]  m_axi_rresp,
        input               m_axi_rvalid,
        output              m_axi_rready,
        // AXI_lite ports
        
        // other ports
        input               read_signal,
        output              read_valid,
        output       [7:0]  out_data_from_AXI,
        input               infer_ready,
        input        [4:0]  winner_ID


    );
    
    
    
    AXI_reader internal_reader(
         
              m_axi_aclk,       
              m_axi_aresetn,    
                       
              m_axi_awaddr,     
              m_axi_awvalid,    
              m_axi_awready,    
                               
              m_axi_wdata,      
              m_axi_wstrb,      
              m_axi_wvalid,     
              m_axi_wready,     
                           
              m_axi_bresp,      
              m_axi_bvalid,     
              m_axi_bready,     
                             
              m_axi_araddr,     
              m_axi_arvalid,    
              m_axi_arready,    
                               
              m_axi_rdata,      
              m_axi_rresp,      
              m_axi_rvalid,     
              m_axi_rready,     
                
              read_signal,      
              read_valid,       
              out_data_from_AXI,
              infer_ready,      
              winner_ID                        
             
    );
    
endmodule
