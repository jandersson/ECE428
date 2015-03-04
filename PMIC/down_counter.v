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
module behav_counter( d, clk, clear, load, up_down, qd);

// Port Declaration

input   [7:0] d;
input   clk;
input   clear;
input   load;
input   up_down;
output  [7:0] qd;

reg     [7:0] cnt;


assign qd = cnt;


always @ (posedge clk)
begin
    if (!clear)
        cnt = 8'h00;
    else if (load)
        cnt = d;
    else if (up_down)
        cnt = cnt + 1;
    else if (cnt != 0)
        cnt = cnt - 1;
end 
endmodule