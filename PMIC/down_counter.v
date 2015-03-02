`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:19:01 02/24/2015 
// Design Name: 
// Module Name:    down_counter 
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
module down_counter(
	out,
	enable,
	clk,
	data,
	reset   
	 );
output [7:0] out;
input [7:0] data;
input clk, reset, enable;

reg [7:0] out;

always @ (posedge clk)
if (reset) begin
	out <= 8'b0;
end else if (enable) begin
	out <= out + 1;
end

endmodule
