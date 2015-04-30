`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Southern Illinois University Carbondale
// Engineer: Jonas Andersson
// 
// Create Date:    23:31:05 04/28/2015 
// Design Name: 	Absolute Value Subtractor
// Module Name:    abs_subtractor 
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
module abs_subtractor #(parameter SUB_WIDTH = 5)
	(
    input [SUB_WIDTH-1:0] A,
    input [SUB_WIDTH-1:0] B,
    output[SUB_WIDTH-1:0] Q
    );
	 
	
	assign Q = A - B;
		//else Q <= B - A;
	
/*   if (A > B) begin
		assign Q = A - B;
	end
	else begin
		assign Q = B - A;
	end*/
		
		
					

endmodule
