`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:25:32 03/04/2015
// Design Name:   PMIC
// Module Name:   /home/jonas/ECE428/PMIC/stimulus.v
// Project Name:  PMIC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PMIC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stimulus;

	// Inputs
	reg low_batt;
	reg low_pow;
	reg onoff;
	reg reset;
	reg clock;

	// Outputs
	wire enable_3v;
	wire enable_2v;
	wire enable_1v;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	PMIC uut (
		.low_batt(low_batt), 
		.low_pow(low_pow), 
		.onoff(onoff), 
		.reset(reset), 
		.enable_3v(enable_3v), 
		.enable_2v(enable_2v), 
		.enable_1v(enable_1v), 
		.ready(ready), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		low_batt = 0;
		low_pow = 0;
		onoff = 0;
		reset = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
    end
		// Add stimulus here
	
	always
			#1 clock = ~clock;
			
	initial
		begin
			//Demonstrate the power on sequence
			#1 onoff = 1;
			//Demonstrate the power down sequence
			#29 onoff = 0;
			#30 onoff = 1;
			//Demonstrate the low battery sequence
			#30 low_batt = 1;
			//Circuit should power back up
			#30 low_batt = 0;
			//Demonstrate low power mode
			#30 low_pow = 1;
			#30 low_pow = 0;
		end
      
endmodule

