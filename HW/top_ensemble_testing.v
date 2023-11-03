`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 11:45:00 AM
// Design Name: 
// Module Name: top_ensemble_testing
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


module top_ensemble_testing(
    input clk_in_1_p,
    input clk_in_1_n,
    input rs232_rx,
    output rs232_tx,
    input reset,
    output [4:0] winner_ID
    );
  
  
  wire rst_n, axi_rstn, locked, axi_clk;
  //AXI ports wire
  wire axi_awvalid, axi_awready, axi_wvalid, axi_wready, axi_bvalid, axi_bready, axi_arvalid, axi_arready, axi_rvalid, axi_rready;
  wire [1:0] axi_bresp, axi_rresp;
  wire [3:0] axi_wstrb;
  wire [31:0] axi_wdata, axi_rdata;
  wire [3:0] axi_awaddr, axi_araddr;
  
  // internal component connection
  wire req_read_signal, trans_start, infer_ready;
  wire [19:0] bin_cnt;
  wire [7:0] read_data_AXI;

  //wire [4:0] winner_ID;
  // internal interrupt and ack
  wire tryte_rec, ack_tryte;
  
  assign rst_n = ~reset;
  assign axi_rstn = rst_n & locked;
  
    clk_wiz_0 clock_gen_unit
   (
    // Clock out ports
    .clk_out1(axi_clk),     // output clk_out1
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1_p(clk_in_1_p),    // input clk_in1_p
    .clk_in1_n(clk_in_1_n)    // input clk_in1_n
);

// ILA modules
/////////////////////////////////////////////////////////////////////////////////
/*
    UART_ILA_native UART_ILA_general_ports(
.clk(axi_clk),


.probe0(rs232_rx),
.probe1(ack_tryte),
.probe2(read_valid),
.probe3(read_data_AXI)
);



ila_axi_interface axi_interface_ILA (
	.clk(axi_clk), // input wire clk


	.probe0(axi_wready), // input wire [0:0] probe0  WREADY
	.probe1( axi_awaddr), // input wire [3:0]  probe1  AWADDR
	.probe2( axi_bresp), // input wire [1:0]  probe2 BRESP
	.probe3( axi_bvalid), // input wire [0:0]  probe3 BVALID
	.probe4( axi_bready), // input wire [0:0]  probe4 BREADY
	.probe5( axi_araddr), // input wire [3:0]  probe5 ARADDR
	.probe6( axi_rready), // input wire [0:0]  probe6 RREADY
	.probe7( axi_wvalid), // input wire [0:0]  probe7 WVALID
	.probe8( axi_arvalid), // input wire [0:0]  probe8 ARVALID
	.probe9( axi_arready), // input wire [0:0]  probe9 ARREADY
	.probe10( axi_rdata), // input wire [31:0]  probe10 RDATA
	.probe11( axi_awvalid), // input wire [0:0]  probe11 AWVALID
	.probe12( axi_awready), // input wire [0:0]  probe12 AWREADY
	.probe13( axi_rresp), // input wire [1:0]  probe13 RRESP
	.probe14( axi_wdata), // input wire [31:0]  probe14 WDATA
	.probe15( axi_wstrb), // input wire [3:0]  probe15 WSTRB
	.probe16( axi_rvalid), // input wire [0:0]  probe16 RVALID
	.probe17( axi_arprot), // input wire [2:0]  probe17  ARPROT
	.probe18( axi_awprot) // input wire [2:0]  probe18 AWPROT
);
*/
//ILA modules
//////////////////////////////////////////////////////////////////////////////


axi_uartlite_0 uart_lite_axi_unit (
  .s_axi_aclk(axi_clk),        // input wire s_axi_aclk
  .s_axi_aresetn(axi_rstn),  // input wire s_axi_aresetn
  .interrupt(interrupt),          // output wire interrupt
  .s_axi_awaddr(axi_awaddr),    // input wire [3 : 0] s_axi_awaddr
  .s_axi_awvalid(axi_awvalid),  // input wire s_axi_awvalid
  .s_axi_awready(axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(axi_wvalid),    // input wire s_axi_wvalid
  .s_axi_wready(axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(axi_bready),    // input wire s_axi_bready
  .s_axi_araddr(axi_araddr),    // input wire [3 : 0] s_axi_araddr
  .s_axi_arvalid(axi_arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(axi_rready),    // input wire s_axi_rready
  .rx(rs232_rx),                        // input wire rx
  .tx(rs232_tx)                        // output wire tx
);
    
 AXI_reader axi_reader_unit(      
        // AXI_lite ports
        // global ports
          .m_axi_aclk(axi_clk),
          .m_axi_aresetn(axi_rstn),
        // write address channel
          .m_axi_awaddr(axi_awaddr),
          .m_axi_awvalid(axi_awvalid),
          .m_axi_awready(axi_awready),
        // write data channel
          .m_axi_wdata(axi_wdata),
          .m_axi_wstrb(axi_wstrb),
          .m_axi_wvalid(axi_wvalid),
          .m_axi_wready(axi_wready),
        // write response channel
          .m_axi_bresp(axi_bresp),
          .m_axi_bvalid(axi_bvalid),
          .m_axi_bready(axi_bready),
        // read address channel
          .m_axi_araddr(axi_araddr),
          .m_axi_arvalid(axi_arvalid),
          .m_axi_arready(axi_arready),
        // read data channel,
          .m_axi_rdata(axi_rdata),
          .m_axi_rresp(axi_rresp),
          .m_axi_rvalid(axi_rvalid),
          .m_axi_rready(axi_rready),
        // AXI_lite ports
        
        // other ports
          .read_signal(req_read_signal),
          .read_valid(read_valid),
          .out_data_from_AXI(read_data_AXI), // [7:0] data from AXI uart
          .infer_ready(infer_ready),
          .winner_ID(winner_ID), // [4:0] winner_ID
          .trytes_rec(tryte_rec), // handshake 
          .ack_tryte(ack_tryte)
          
    );
    
    byte_2_tribyte data_organiser(
            // global ports
             .clk(axi_clk),
             .rst_n(axi_rstn),
            // read from axi reader
             .read_valid_from_UART(read_valid), 
             .byte_rx(read_data_AXI),  // [7:0] 8 bit uart data
            // out to ensemble model     
             .trans_start(trans_start), 
             .raw_dat(bin_cnt),  // [19:0] raw data
             .trytes_received(tryte_rec),
             .ack_tryte(ack_tryte)

    );
    
    
    Bin_ratio_ensemble_spiking_net #(20) bin_ratio_ensemble_net_unit(
                .clk(axi_clk),
                .rst_n(axi_rstn),
                .trans_start(trans_start),
                .bin_cnt(bin_cnt),  // [19:0] raw_data_cnt
                .request_over_ensemble(req_read_signal),
                .final_winner_over_ensemble(winner_ID), // [4:0] winner_ID
                .infer_ready_ensemble(infer_ready)

    );
    
    
  
    
endmodule
