`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:35:57 04/30/2015
// Design Name:   accumulator
// Module Name:   /home/jonas/ECE428/project/acc_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: accumulator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module acc_tb;

	// Inputs
	reg [4:0] acc_in;
	reg pclk;
	reg reset;
	reg clock_enable;

	// Outputs
	wire [4:0] acc_out;

	// Instantiate the Unit Under Test (UUT)
	accumulator uut (
		.acc_in(acc_in), 
		.pclk(pclk), 
		.reset(reset), 
		.clock_enable(clock_enable), 
		.acc_out(acc_out)
	);

	initial begin
		// Initialize Inputs
		acc_in = 0;
		pclk = 0;
		reset = 1;
		clock_enable = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
      acc_in = 10;
		clock_enable = 1;
		
		#100
		acc_in = 5;
		// Add stimulus here

	end
   always
		#10 pclk = !pclk;
endmodule

