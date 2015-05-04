`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:35 05/01/2015 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(pclk, data_out, reset);

	input pclk, reset;
	output [4:0] data_out;
	
	wire vtcvde, en_ram1;
	wire [4:0] reference_frame_out;
	wire [4:0] current_frame_out;
	wire [17:0] address_gen_1b;
	
	// Background Subtraction Circuit (Milestone1)
	Background_subtraction bg_sub(.pclk(dcm_clk),
											.reset(reset),
											.vtcvde(vtcvde),
											.data_out(data_out),
											.acc_en(1'b1),
											.current_frame(current_frame_out),
											.reference_frame(reference_frame_out),
											.addr_1_b(address_gen_1b),
											.enable_ram1(en_ram1));

	// Digital Clock Manager
	dcm dcm(.CLK_IN1(pclk),
			  .CLK_OUT1(dcm_clk),
			  .RESET(1'b0));  
			  
	Top_module frame_buffers(
	   .Reset(reset),						  
		.PClk(dcm_clk),        
		.ram_out_1(reference_frame_out),  
		.ram_out_2(current_frame_out),
		.addr_1_b(address_gen_1b),
		.addr_2_b(), 
		.en_1(en_ram1), 
		.en_2(),
      .VtcVde(vtcvde)
		);

endmodule
