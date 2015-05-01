`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Southern Illinois University Carbondale	
// Engineer: Jonas Andersson
// 
// Create Date:    17:27:50 04/30/2015 
// Design Name:    Background Subtraction Circuit
// Module Name:    Background_subtraction 
// Project Name: ECE428 Project
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Needs two more outputs for address counter
//
//////////////////////////////////////////////////////////////////////////////////
module Background_subtraction(pclk, reset, vtcvde,data_out, acc_en, current_frame,
										reference_frame, addr_1_b, enable_ram1);
// Port Instantiation Declaration
input pclk, reset, acc_en, vtcvde;
input [4:0] current_frame, reference_frame;
output [4:0] data_out;
output [17:0] addr_1_b;
output enable_ram1;
wire [4:0] sub_out;
wire dcm_clk;

	//Subtractor that outputs absolute value
	abs_subtractor subtractor(.A(current_frame),
									  .B(reference_frame),
									  .Q(sub_out));
									  
	// Accumulates subtractor output								
	accumulator accumulator(.acc_in(sub_out),
									.pclk(dcm_clk),
									.reset(reset),
									.clock_enable(acc_en),
									.acc_out(data_out));
	
	// Digital Clock Manager
	dcm dcm(.CLK_IN1(pclk),
			  .CLK_OUT1(dcm_clk),
			  .RESET(1'b0));
			  
	// Address Generator
	addrgen_1_b address_generator(.clk(dcm_clk),
										   .addr_1b(addr_1_b),
											.en_ram1(enable_ram1),
											.Reset_Main(reset),
											.VtcVde(vtcvde));
			  
endmodule
