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
// Description: A Power Management Integrated Circuit
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
`define S0 		5'd0 	//Reset, Initial State
`define S1		5'd1	//Wait for Input state
`define S2		5'd2	//Power on sequence start 
`define S3		5'd3	//3.3V Regulator ON
`define S4		5'd4	//2.5 Regulator ON
`define S5		5'd5	//1.2V Regular ON
`define S6		5'd6	//Power off sequence start
`define S7		5'd7	//1.2V Regulator OFF
`define S8		5'd8	//2.5V Regulator OFF
`define S9		5'd9	//3.3V Regulator OFF
`define LD_T1  5'd10 //Load T1 into counter
`define LD_T2  5'd11
`define LD_T3  5'd12
`define LD_T4	5'd13
`define LD_T5	5'd14
`define WT_T1	5'd15
`define WT_T2	5'd16
`define WT_T3	5'd17
`define WT_T4	5'd18
`define WT_T5	5'd19
//Delays
// Implemented as delay - 3 cycle to account for loading the counter (it takes one cycle to transition to load state, one cycle to load, one cycle to start)
`define T1	2
`define T2	3
`define T3	2
`define T4	0
`define T5	0

module PMIC
	(low_batt, low_pow, onoff, reset, enable_3v, enable_2v, enable_1v, ready, clock);

//I/O Ports
input low_batt, low_pow, onoff, reset, clock;
output enable_3v, enable_2v, enable_1v, ready;
//Declared output signals are registers
reg enable_3v, enable_2v, enable_1v, ready;
//Internal State Variables
reg[4:0] state;
reg[4:0] next_state;
reg lpmode, load_counter;
reg [7:0] count;
wire [7:0] current_count;
// Instantiate lower-level modules
behav_counter DC(count, clock, 1, load_counter, 0, current_count);

//Power Management Circuit starts in S0 State
initial
begin
	state = `S0;
	next_state = `S0;
	ready = 0;
	enable_3v = 0;
	enable_2v = 0;
	enable_1v = 0;
	lpmode = 0;
	count = 0;
	load_counter = 1;
end

//State changes are positive edge triggered
always @(posedge clock)
	state = next_state;

//State output assertions
always @(state)
begin
	case(state)
		`S0:	begin
					ready = 0;
					enable_3v = 0;
					enable_2v = 0;
					enable_1v = 0;
					lpmode = 0;
					count = 0;
					load_counter = 1;					
				end
		`S2:  begin
					load_counter = 1;
					count = `T1;
				end
		`WT_T1: 	begin
						load_counter = 0;
						count = `T2;
					end
		`WT_T2:	begin
						load_counter = 0;
						count = `T3;
					end
		`WT_T3:	load_counter = 0;
		`WT_T4:	load_counter = 0;
		`WT_T5:	load_counter = 0;
		`LD_T1:	begin
						load_counter = 1;
						count = `T1;
					end
		`LD_T2:	begin
						load_counter = 1;
						count = `T2;
					end
		`LD_T3:	begin
						load_counter = 1;
						count = `T3;
					end
		`LD_T4:	begin
						load_counter = 1;
						count = `T4;
					end
		`LD_T5:	begin
						load_counter = 1;
						count = `T5;
					end
		`S3:	begin
					enable_3v = 1;
					load_counter = 1;
				end
		`S4:	enable_2v = 1;
		`S5:	begin
					enable_1v = 1;
					ready = 1;
				end
		//S6: Power off sequence start
		// Ready becomes 0 as soon as the power off sequence starts
		`S6: 	begin
					ready = 0;
					load_counter = 1;
					count = `T3;
				end
		`S7:	begin
					enable_1v = 0;
					load_counter = 0;
				end
		`S8:	enable_2v = 0;
		`S9:	enable_3v = 0;
	endcase
end

//State transition logic
always @(state or low_pow or low_batt or onoff or reset or current_count)
begin
	if(reset)
		next_state = `S0;
	else
		case (state)
			`S0: next_state = `S1;
			//S1: Wait State
			`S1: 	if((onoff == 1) && (ready == 0) && (low_batt == 0))
						next_state = `S2;
					// If the onoff button is deasserted and the circuit is on (represented by the ready signal), start power off sequence
					else if((onoff == 0) && (ready == 1))
						next_state = `S6;
					//If the low power signal is asserted then turn off the 3.3 and 2.5V outputs according to timing
					else if((low_pow == 1) && (enable_3v == 1) && (enable_2v == 1))
						next_state = `S8;
					//If the low power signal is deasserted and the 3.3V and 2.5V regulators are off, turn them back on.
					else if((low_pow == 0) && (low_batt == 0) && (enable_3v == 0) && (enable_2v == 0) && (ready == 1))
						next_state = `S2;
					//If the low battery signal is asserted and the circuit is on, start power off sequence
					else if((low_batt == 1) && (ready == 1))
						next_state = `S6;
			//S2: Power On Sequence Start		
			`S2: next_state = `S3;
			`S3: next_state = `LD_T1;
			`LD_T1:	next_state = `WT_T1;
			`LD_T2:	next_state = `WT_T2;
			`LD_T3:	next_state = `WT_T3;
			`LD_T4:	next_state = `WT_T4;
			`LD_T5:	next_state = `WT_T5;
			`WT_T1: 	if (current_count == 0)
							next_state = `S4;
						else
							next_state = `WT_T1;
			`WT_T2:	if(current_count == 0)
							next_state = `S5;
						else
							next_state = `WT_T2;
			//The power off button needs to be deasserted for time T3 or the low battery signal asserted, else return to BAU
			`WT_T3:	if ((onoff == 0) || (low_batt == 1))
							if(current_count == 0) 
								next_state = `S7;
							else
								next_state = `WT_T3;
						else
							next_state = `S1;
			`WT_T4:	if(current_count == 0)
							next_state = `S8;
						else
							next_state = `WT_T4;
			`WT_T5:	if(current_count == 0)
							next_state = `S9;
						else
							next_state = `WT_T5;
		   `S4: next_state = `LD_T2;
			`S5: next_state = `S1;
			//S6: Power off Sequence Start
			`S6: next_state = `LD_T3;
			//S7: Turn off 1.2V Regulator
			`S7: next_state = `LD_T4;
			//S8: Turn off 2.5V Regulator
			`S8: next_state = `LD_T5;
			//S9: Turn off 3.3V Regulator
			`S9: next_state = `S1;
			default: next_state = `S0;
		endcase
end
endmodule
