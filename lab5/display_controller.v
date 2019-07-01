`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  toplevel.v
 * Project:    lab4
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/13/2017
 *
 * Purpose:    In this module we will be instantiating 4 different modules:
 *             pixel_clk, pixel_controller, ad_mux, and
 *             hex_to_7_segment_decoder to create a display controller. 
 *             The display controller will control which data to be displayed 
 *             on which anode/cathode and at what timing/frequency.
 *         
 * Notes:		In this display controller verilog module we will be
 *             instantiating pixel_clk, pixel_controller, ad_mux, and
 *             hex_to_7_segment_decoder
 *
 ****************************************************************************/
module display_controller(
	input            clk, // 100MHz clock
	input          reset, // reset
	input  [15:0]    din, // data input
	input   [7:0]   addr, // address
	output  [7:0]  anode, // anode
	output  [6:0] cathode //cathode
    );

	wire           p_clk; // pixel clock	
	wire  [2:0]  seq_sel; // sequence selecter
	wire  [3:0] addr_out; // address out	
	 
	// pixel clock module
	pixel_clk pix_clk(
		clk, 
		reset,
		p_clk
	);	
	
	// pixel controller module
	pixel_controller pix_con(
		p_clk,
		reset,
		anode[7:0],
		seq_sel[2:0]
	);	

	// address mux module
	ad_mux addr_mux(
		seq_sel[2:0],
		4'b0000,
		4'b0000,
		addr[7:4],
		addr[3:0],
		din[15:12],
		din[11:8],
		din[7:4],
		din[3:0],
		addr_out[3:0]
	);
	
	// hex to 7 segment decoder module
	hex_to_7_segment_decoder h_to_7(
		addr_out[3:0],
		cathode[6:0]
	);
	
endmodule
