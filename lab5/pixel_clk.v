`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:    pixel_clk.v
 * Project:      lab4
 * Designer:     Blas Arras and Naoaki Takatsu
 * Email:        blas.arras@yahoo.com
 *	       		  naoakitatkatsu@student.csulb.edu
 * Rev. No.:     Version 1
 * Rev. Date:    03/08/2017
 *
 * Purpose:	     Divides the internal clock of the programmed board to slow 
 * 			     down clock pulse.	
 * 	        
 * Notes:        This verilog program will decrease the Hz value of the 
 * 			     internal clock of the programmed FPGA board. By dividing the  
 * 			     internal clock's frequency to the desired outgoing 
 * 			     frequency, and further dividing that equation by two we can 
 * 			     achieve a counter that counts the incoming clock ticks 
 *				     according to the provided equation and provides high and 
 *				     low logic for another program.
 *
 * 			     If a reset signal is requested the integer i and the clock
 * 			     signal that is going out will be set to zero, allowing a
 * 			     "reset"
 *
 * 
 * Dependencies: This is a clock divider module which transforms the incoming
 *               100MHz clock called clk, into a 480Hz clock called pxl_clk.
 *
 ****************************************************************************/
module pixel_clk(clk, reset, clk_out) ;

	input	     clk, reset; // 100MHz clock input and reset
	output reg    clk_out; // 480Hz clock output
	integer             i; // clock tick counter
	
	//***************************************************************
	// The following verilog code will "divide" an incoming clock
	// by the 32-bit decimal value specified in the "if condition"
	// 
	// The value of the counter that counts the incoming clock ticks
	// is equal to [ (Incoming Freq / Outgoing Freq) / 2 ]
	//***************************************************************
	always @ (posedge clk or posedge reset) begin
		if (reset == 1'b1) begin
			i = 0;
			clk_out = 0;
		end
		// got a clock, so increment the counter and
		// test to see if half a period has elapsed
		else begin
			i = i + 1;
			if ( i >= 104167 ) begin //In this case we have a 
										    //480hz clk
											 //(100Mhz/480hz)/2 =
											 // 104167
				clk_out = ~clk_out;
				i = 0;
			end // if
		end // else
		
	end // always

endmodule
