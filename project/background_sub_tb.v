`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:42:13 04/30/2015
// Design Name:   Background_subtraction
// Module Name:   /home/jonas/ECE428/project/background_sub_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Background_subtraction
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module background_sub_tb;
`define PERIOD 5 // 100 MHz clock
	// Inputs
	reg pclk;
	reg reset;
	reg acc_en;
	wire [4:0] current_frame;
	wire [4:0] reference_frame;

	// Outputs
	wire [4:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Background_subtraction uut (
		.pclk(pclk), 
		.reset(reset), 
		.data_out(data_out), 
		.acc_en(acc_en), 
		.current_frame(current_frame), 
		.reference_frame(reference_frame)
	);
	Example uut1 (
		.clk(pclk), 
		.Reset_Main(reset), 
		.data_out1(current_frame), 
		.data_out2(reference_frame)
	);
	initial begin
		pclk <= 0;
		forever #(`PERIOD) pclk = ~pclk;
	end
	
	initial begin
		reset <= 1;
		@(posedge pclk);
		@(negedge pclk) reset = 0;
	end
	
	initial begin
		acc_en <= 1;
	end
      
endmodule

