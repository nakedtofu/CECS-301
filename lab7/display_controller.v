`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  display_controller.v
 * Project:    lab7
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/13/2017
 *
 * Purpose:    In this module we will be instantiating 4 different modules:
 *             pixel_clk, pixel_controller, ad_mux, and
 *             hex_to_7_segment_decoder to create a display controller. 
 *             The display controller will control which data to be displayed 
 *             on which anode/cathode and at what timing/frequency.
 *         
 * Notes:		In this display controller Verilog module we will be
 *             instantiating pixel_clk, pixel_controller, ad_mux, and
 *             hex_to_7_segment_decoder
 *
 *					When reset is requested, the reset function in each module will
 *					occur.
 *
 ****************************************************************************/
module display_controller(clk,reset, A, B, anode,cathode);
	input                clk, reset; // reset
	input  		 [15:0]  B, A; // address
	output wire	 [7:0]   anode; // anode
	output wire  [6:0]   cathode; //cathode
	
	wire         px_clk; // pixel clock	
	wire  [2:0]  seq_sel; // sequence selector
	wire  [3:0]  addr_out; // address out	
	 
	// pixel clock module
	pixel_clk 		  pix_clk(clk, reset, px_clk);	
	
	// pixel controller module
	pixel_controller pix_con(px_clk, reset,{anode[7:0],seq_sel[2:0]});	

	// address mux module
	ad_mux addr_mux(
		seq_sel[2:0],
		A[15:12],
		A[11:8],
		A[7:4],
		A[3:0],
		B[15:12],
		B[11:8],
		B[7:4],
		B[3:0],
		addr_out[3:0]
	);
	
	// hex to 7 segment decoder module
	hex_to_7_segment_decoder h_to_7(
		addr_out[3:0],
		cathode[6:0]
	);
	
endmodule