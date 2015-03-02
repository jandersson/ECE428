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
`define TRUE 	1'b1
`define FALSE 	1'b0

//State definitions
`define S0 		4'd0 	//Reset, Initial State
`define S1		4'd1	//Wait for Input state
`define S2		4'd2	//Power on sequence start 
`define S3		4'd3	//3.3V Regulator ON
`define S4		4'd4	//2.5 Regulator ON
`define S5		4'd5	//1.2V Regular ON
`define S6		4'd6	//Power off sequence start
`define S7		4'd7	//1.2V Regulator OFF
`define S8		4'd8	//2.5V Regulator OFF
`define S9		4'd9	//3.3V Regulator OFF

//Delays
`define T1	5
`define T2	6
`define T3	5
`define T4	3
`define T5	3

module PMIC
	(low_batt, low_pow, onoff, reset, enable_3v, enable_2v, enable_1v, ready, clock);

//I/O Ports
input low_batt, low_pow, onoff, reset, clock;
output enable_3v, enable_2v, enable_1v, ready;
//Declared output signals are registers
reg enable_3v, enable_2v, enable_1v, ready;

reg[3:0] state;
reg[3:0] next_state;

endmodule
