`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:54:02 04/30/2015
// Design Name:   Example
// Module Name:   /home/jonas/ECE428/project/example_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Example
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module example_tb;
`define PERIOD 5 // 100 MHz clock
	// Inputs
	reg clk;
	reg Reset_Main;

	// Outputs
	wire [4:0] data_out1;
	wire [4:0] data_out2;

	// Instantiate the Unit Under Test (UUT)
	Example uut (
		.clk(clk), 
		.Reset_Main(Reset_Main), 
		.data_out1(data_out1), 
		.data_out2(data_out2)
	);


	initial begin
		clk <= 0;
		forever #(`PERIOD) clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		Reset_Main <= 1;
		@(posedge clk);
		@(negedge clk) Reset_Main = 0;
	end
      
endmodule

