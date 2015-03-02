`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Southern Illinois University Department of Electrical and Computer Engineering
// Engineer: Jonas Andersson
// 
// Create Date:    10:43:21 02/19/2015 
// Design Name: Power Management Integrated Circuit (PMIC)
// Module Name:    PMIC
// Project Name: Lab 2
// Target Devices: Digilent Atlys Board 
// Tool versions: Xilinx ISE 14.7
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// The digital circuit has four outputs and three of them are for enabling the voltage regulators. The
// fourth output, ready, becomes 1 when the power up sequence is complete and it becomes
// 0 as soon as the power-off sequence starts
//////////////////////////////////////////////////////////////////////////////////
module PMIC(low_batt, low_pow, onoff, reset, enable_3v, enable_2v, enable_1v, ready
    );
input low_batt, low_pow, onoff, reset;
output enable_3v, enable_2v, enable_1v, ready;
localparam STATE_Initial = 3'd0,
			  STATE_Enable3v = 3'd1,
			  STATE_Enable2v = 3'd2,
			  STATE_Enable3v = 3'd3,
			  STATE_
reg[2:0] CurrentState;
reg PowerOn

endmodule
