`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:00 05/04/2015
// Design Name:   top
// Module Name:   /home/jonas/ECE428/project/top_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;
`define PERIOD 5 // 100 MHz clock
	// Inputs
	reg pclk;
	reg reset;

	// Outputs
	wire [4:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.pclk(pclk), 
		.data_out(data_out), 
		.reset(reset)
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
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

