`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2023 04:31:52 PM
// Design Name: 
// Module Name: TOP_module_UART_reader
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


module TOP_module_UART_reader(
            input        clk_in1_p,
            input        clk_in1_n,
            input        rst,
            input        rx,
            output       tx,
            input        read_signal,
            output       read_valid,
            output [7:0] read_data_AXI,
            input       infer_ready,
            input [4:0] winner_ID,
            
            //general global port
            output       bd_clk,
            output       axi_rstn

    );
    
  wire rst_n, locked, axi_clk, axi_rstn;
  //AXI ports wire
  wire axi_awvalid, axi_awready, axi_wvalid, axi_wready, axi_bvalid, axi_bready, axi_arvalid, axi_arready, axi_rvalid, axi_rready;
  wire [1:0] axi_bresp, axi_rresp;
  wire [3:0] axi_wstrb;
  wire [31:0] axi_wdata, axi_rdata;
  wire [3:0] axi_awaddr, axi_araddr;
  // internal
  wire read_valid;
  assign rst_n = ~rst;
  assign axi_rstn = rst_n & locked;
  assign bd_clk = axi_clk; 
  
  clk_wiz_0 clock_gen_unit
   (
    // Clock out ports
    .clk_out1(axi_clk),     // output clk_out1
    // Status and control signals
    .reset(rst), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n)    // input clk_in1_n
);

    UART_ILA_native UART_ILA_native_unit (
	.clk(axi_clk), // input wire clk


	.probe0(rx), // input wire [0:0]  rx  
	.probe1(read_signal), // input wire [0:0]  read_signal 
	.probe2(read_valid), // input wire [0:0]  read_valid 
	.probe3(read_data_AXI) // input wire [7:0]  read_data_AXI
);

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
  .rx(rx),                        // input wire rx
  .tx(tx)                        // output wire tx
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
          .read_signal(read_signal),
          .read_valid(read_valid),
          .out_data_from_AXI(read_data_AXI),
          .infer_ready(infer_ready),
          .winner_ID(winner_ID)
          
    );
endmodule
