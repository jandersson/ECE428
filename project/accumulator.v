`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:47 04/30/2015 
// Design Name: 
// Module Name:    accumulator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Accumulator must be reset to initialize the output register.
//
//////////////////////////////////////////////////////////////////////////////////
module accumulator #(parameter ACC_SIZE = 5)
	(
    input acc_in,
	 input pclk,
	 input reset,
	 input clock_enable,
    output acc_out
    );
   reg [ACC_SIZE-1:0] acc_out;

   always @ (posedge pclk)
      if (reset)
         acc_out <= 0;
      else if (clock_enable)
         acc_out <= acc_out + acc_in;
endmodule
