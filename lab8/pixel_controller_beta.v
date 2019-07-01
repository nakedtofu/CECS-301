`timescale 1ns / 1ps 
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  pixel_controller.v
 * Project:    lab8
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	    		   naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/08/2017
 *
 * Purpose:    This module was created to control which "pixel" otherwise 
 *             known as the anode the board is currently enabling with logic
 *             low.
 *
 * Notes:      This is the pixel controller module. This module will enable
 *             1 of the 8 anodes ([7:0]a) from right to left sequentially on
 *             each positive edge of the clock called clk. The 3bit sequence 
 *             selector, [2:0]seq_sel, will then store which anode state the
 *             module is at in binary format.
 *
 ****************************************************************************/
module pixel_controller(clk, reset, seq_sel);

	input 		clk, reset;
	output reg	[10:0]seq_sel;
	 
	//**********************
	// state register and 
	// next_state variables
	//**********************
	
	reg [2:0] present_state;
	reg [2:0] next_state;

	//************************************************************************
	// Next State Combinational Logic
	// (next state values can change anytime but will only be "clocked" below)
	//************************************************************************
	always @( present_state )
		case( present_state )
	//present state 				next state
			3'b000 : next_state = 3'b001;
			3'b001 : next_state = 3'b010;
			3'b010 : next_state = 3'b011;
			3'b011 : next_state = 3'b100;
			3'b100 : next_state = 3'b101;
			3'b101 : next_state = 3'b110;
			3'b110 : next_state = 3'b111;
			3'b111 : next_state = 3'b000;
			default: next_state = 3'b000;
		endcase
		
	//************************************************************************
	// State Register Logic (Sequential Logic)
	//************************************************************************
		
	always @(posedge clk or posedge reset)
		if (reset == 1'b1)
			present_state = 3'b000;
		else
			present_state = next_state;
	
	//************************************************************************
	// Output Combinational Logic
	// (output values can change whenever an input or state changes)
	//************************************************************************
			
	always @ ( present_state )
		case ( present_state )
		// present state         anodes    sequence select
			3'b000 : seq_sel = 11'b11111110_000;
			3'b001 : seq_sel = 11'b11111101_001;
			3'b010 : seq_sel = 11'b11111011_010;
			3'b011 : seq_sel = 11'b11110111_011;
			3'b100 : seq_sel = 11'b11101111_100;
			3'b101 : seq_sel = 11'b11011111_101;
			3'b110 : seq_sel = 11'b10111111_110;
			3'b111 : seq_sel = 11'b01111111_111;
			default: seq_sel = 11'b11111110_000;
	endcase
	
endmodule
