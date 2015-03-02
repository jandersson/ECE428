////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: counter_synthesis.v
// /___/   /\     Timestamp: Mon Feb 02 17:12:48 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim counter.ngc counter_synthesis.v 
// Device	: xc6slx45-3-csg324
// Input file	: counter.ngc
// Output file	: E:\Counter_Tutorial\netgen\synthesis\counter_synthesis.v
// # of Modules	: 1
// Design Name	: counter
// Xilinx        : C:\Xilinx\13.1\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module counter (
  countup, reset, lights
);
  input countup;
  input reset;
  output [2 : 0] lights;
  wire countup_BUFGP_0;
  wire reset_IBUF_1;
  wire \P1.tracker_FSM_FFd1_2 ;
  wire \P1.tracker_FSM_FFd2_3 ;
  wire \P1.tracker_FSM_FFd3_4 ;
  wire \P1.tracker_FSM_FFd3-In ;
  wire \P1.tracker_FSM_FFd2-In ;
  wire \P1.tracker_FSM_FFd1-In ;
  FDC #(
    .INIT ( 1'b0 ))
  \P1.tracker_FSM_FFd1  (
    .C(countup_BUFGP_0),
    .CLR(reset_IBUF_1),
    .D(\P1.tracker_FSM_FFd1-In ),
    .Q(\P1.tracker_FSM_FFd1_2 )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \P1.tracker_FSM_FFd3  (
    .C(countup_BUFGP_0),
    .CLR(reset_IBUF_1),
    .D(\P1.tracker_FSM_FFd3-In ),
    .Q(\P1.tracker_FSM_FFd3_4 )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \P1.tracker_FSM_FFd2  (
    .C(countup_BUFGP_0),
    .CLR(reset_IBUF_1),
    .D(\P1.tracker_FSM_FFd2-In ),
    .Q(\P1.tracker_FSM_FFd2_3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \P1.tracker_FSM_FFd2-In1  (
    .I0(\P1.tracker_FSM_FFd2_3 ),
    .I1(\P1.tracker_FSM_FFd3_4 ),
    .O(\P1.tracker_FSM_FFd2-In )
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \P1.tracker_FSM_FFd1-In1  (
    .I0(\P1.tracker_FSM_FFd1_2 ),
    .I1(\P1.tracker_FSM_FFd3_4 ),
    .I2(\P1.tracker_FSM_FFd2_3 ),
    .O(\P1.tracker_FSM_FFd1-In )
  );
  IBUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_1)
  );
  OBUF   lights_2_OBUF (
    .I(\P1.tracker_FSM_FFd1_2 ),
    .O(lights[2])
  );
  OBUF   lights_1_OBUF (
    .I(\P1.tracker_FSM_FFd2_3 ),
    .O(lights[1])
  );
  OBUF   lights_0_OBUF (
    .I(\P1.tracker_FSM_FFd3_4 ),
    .O(lights[0])
  );
  BUFGP   countup_BUFGP (
    .I(countup),
    .O(countup_BUFGP_0)
  );
  INV   \P1.tracker_FSM_FFd3-In1_INV_0  (
    .I(\P1.tracker_FSM_FFd3_4 ),
    .O(\P1.tracker_FSM_FFd3-In )
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

