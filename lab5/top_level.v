`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:10 03/20/2017 
// Design Name: 
// Module Name:    top_level 
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
module top_level(
	input clk,  // 100MHz clock
	input reset, // reset
	input [15:0] din, // data input
	input [7:0] anode, // anode
	input   [7:0]   addr, // address
	input [6:0] cathode //cathode
	);

decoder_3to8 d3_8(in,en,out);

display_controller dc(clk,
	 reset, 
	 din[15:0], 
	 addr[7:0],
	 anode[7:0],
	 cathode[6:0]
    );
	 
reg16 r16(clk, reset, ld, Din, DA, DB, oeA, oeB);

endmodule
