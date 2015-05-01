`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:50 04/30/2015 
// Design Name: 
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
module Background_subtraction(pclk, reset, data_out, acc_en, current_frame, reference_frame);
// Port Instantiation Declaration
input pclk, reset, acc_en;
input [4:0] current_frame, reference_frame;
output [4:0] data_out;

wire [4:0] sub_out;
//reg [4:0] data_out;

abs_subtractor subtractor(current_frame, reference_frame, sub_out);
accumulator accumulator(sub_out, pclk, reset, acc_en, data_out);

endmodule
