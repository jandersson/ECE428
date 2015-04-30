`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:50:16 04/28/2015
// Design Name:   abs_subtractor
// Module Name:   /home/jonas/ECE428/project/abs_substractor_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: abs_subtractor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module abs_substractor_tb;

	// Inputs
	reg [4:0] A;
	reg [4:0] B;

	// Outputs
	wire [4:0] Q;

	// Instantiate the Unit Under Test (UUT)
	abs_subtractor uut (
		.A(A), 
		.B(B), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A = 5;
		B = 3;
		
		#100
		A = 1;
		B = 10;
	end
      
endmodule

