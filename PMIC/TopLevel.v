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
`define TRUE 	  1'b1
`define FALSE 	1'b0

//State definitions
`define ST_RESET 		5'd0 	//Reset, Initial State
`define ST_IDLE		  5'd1	//Wait for Input state
`define ST_POWERON	5'd2	//Power on sequence start 
`define ST_EN3V		  5'd3	//3.3V Regulator ON
`define ST_EN2V		  5'd4	//2.5 Regulator ON
`define ST_EN1V		  5'd5	//1.2V Regular ON
`define ST_POWEROFF	5'd6	//Power off sequence start
`define ST_NOT1V		5'd7	//1.2V Regulator OFF
`define ST_NOT2V		5'd8	//2.5V Regulator OFF
`define ST_NOT3V		5'd9	//3.3V Regulator OFF
`define LD_T1       5'd10 //Load T1 into counter
`define LD_T2       5'd11
`define LD_T3       5'd12
`define LD_T4	      5'd13
`define LD_T5	      5'd14
`define WT_T1	      5'd15
`define WT_T2	      5'd16
`define WT_T3	      5'd17
`define WT_T4	      5'd18
`define WT_T5	      5'd19
//Delays
// Implemented as (delay - 3) cycle to account for loading the counter (it takes one cycle to transition to load state, one cycle to load, one cycle to start)
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
reg load_counter;
reg [7:0] count;
wire [7:0] current_count;
// Instantiate lower-level modules
behav_counter DC(count, clock, 1, load_counter, 0, current_count);

//Power Management Circuit starts in S0 State
initial
begin
	state = `ST_RESET;
	next_state = `ST_RESET;
	ready = 0;
	enable_3v = 0;
	enable_2v = 0;
	enable_1v = 0;
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
		`ST_RESET:	begin
					ready = 0;
					enable_3v = 0;
					enable_2v = 0;
					enable_1v = 0;
					count = 0;
					load_counter = 1;					
				end
		`ST_POWERON:  begin
					load_counter = 1;
					count = `T1;
					ready = 0;
					enable_3v = 0;
					enable_2v = 0;
					enable_1v = 0;
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
		`ST_EN3V:	begin
					enable_3v = 1;
					load_counter = 1;
				end
		`ST_EN2V:	enable_2v = 1;
		`ST_EN1V:	begin
					enable_1v = 1;
					ready = 1;
				end
		//S6: Power off sequence start
		// Ready becomes 0 as soon as the power off sequence starts
		`ST_POWEROFF:begin
      ready = 0;
      load_counter = 1;
      count = `T3;
		end
		`ST_NOT1V:begin
      enable_1v = 0;
      load_counter = 0;
		end
		`ST_NOT2V:	enable_2v = 0;
		`ST_NOT3V:	enable_3v = 0;
	endcase
end

//State transition logic
always @(state or low_pow or low_batt or onoff or reset or current_count)
begin
	if(reset)
		next_state = `ST_RESET;
	else
		case (state)
			`ST_RESET: next_state = `ST_IDLE;
			//S1: Wait State
			`ST_IDLE: 	if((onoff == 1) && (ready == 0) && (low_batt == 0))
						next_state = `ST_POWERON;
					// If the onoff button is deasserted and the circuit is on (represented by the ready signal), start power off sequence
					else if((onoff == 0) && (ready == 1))
						next_state = `ST_POWEROFF;
					//If the low power signal is asserted then turn off the 3.3 and 2.5V outputs according to timing
					else if((low_pow == 1) && (enable_3v == 1) && (enable_2v == 1))
						next_state = `ST_NOT2V;
					//If the low power signal is deasserted and the 3.3V and 2.5V regulators are off, turn them back on.
					else if((low_pow == 0) && (low_batt == 0) && (enable_3v == 0) && (enable_2v == 0) && (ready == 1))
						next_state = `ST_POWERON;
					//If the low battery signal is asserted and the circuit is on, start power off sequence
					else if((low_batt == 1) && (ready == 1))
						next_state = `ST_POWEROFF;
          else
            next_state = `ST_IDLE;
			//S2: Power On Sequence Start		
			`ST_POWERON: next_state = `ST_EN3V;
			`ST_EN3V: next_state = `LD_T1;
			`LD_T1:	next_state = `WT_T1;
			`LD_T2:	next_state = `WT_T2;
			`LD_T3:	next_state = `WT_T3;
			`LD_T4:	next_state = `WT_T4;
			`LD_T5:	next_state = `WT_T5;
			`WT_T1: 	if (current_count == 0)
							next_state = `ST_EN2V;
						else
							next_state = `WT_T1;
			`WT_T2:	if(current_count == 0)
							next_state = `ST_EN1V;
						else
							next_state = `WT_T2;
			//The power off button needs to be deasserted for time T3 or the low battery signal asserted, else return to BAU
			`WT_T3:	if ((onoff == 0) || (low_batt == 1))
							if(current_count == 0) 
								next_state = `ST_NOT1V;
							else
								next_state = `WT_T3;
						else
							next_state = `ST_IDLE;
			`WT_T4:	if(current_count == 0)
							next_state = `ST_NOT2V;
						else
							next_state = `WT_T4;
			`WT_T5:	if(current_count == 0)
							next_state = `ST_NOT3V;
						else
							next_state = `WT_T5;
		   `ST_EN2V: next_state = `LD_T2;
			`ST_EN1V: next_state = `ST_IDLE;
			//S6: Power off Sequence Start
			`ST_POWEROFF: next_state = `LD_T3;
			//S7: Turn off 1.2V Regulator
			`ST_NOT1V: next_state = `LD_T4;
			//S8: Turn off 2.5V Regulator
			`ST_NOT2V: next_state = `LD_T5;
			//S9: Turn off 3.3V Regulator
			`ST_NOT3V: next_state = `ST_IDLE;
			default: next_state = `ST_RESET;
		endcase
end
endmodule
