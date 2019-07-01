`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    02:11:27 03/08/2017 
// Version:        1.0 
// File Name:      pixel_clk.v
// Description:    This is a clock divider module which transforms the incoming
//                 100MHz clock called clk, into a 480Hz clock called pxl_clk.
// Dependencies:   The incoming clock, clk, must have a frequency of 100MHz in
//                 order to obtain the clock needed with a frequency of 125Hz.
//
//////////////////////////////////////////////////////////////////////////////////
module pixel_clk(
    input clk,      //100MHz clock
    input reset,    //reset
    output reg pxl_clk  //480Hz clock output
    );

	integer i = 0;

//***************************************************************
// The following verilog code will "divide" an incoming clock
// by the 32-bit deimal value specified in the "if condition"
//
// The value of the counter that counts the incoming clock ticks
// is equal to [ (Incoming Freq / Outgoing Freq) / 2 ]
//***************************************************************

	always @ ( posedge clk or posedge reset ) 
	begin
		
			if ( reset == 1'b1 ) 			
			begin
			
				i = 0;
			
				pxl_clk = 0;
			
			end
			// got a clock, so increment the counter and
			// test to see if half a period has elapsed
		
			else 
			begin

					i = i + 1;

					if ( i >= 104167 ) // 100MHz/480Hz/2 = 104167 ticks
					begin

						pxl_clk = ~pxl_clk;
						
						i = 0;

					end // if

			end // else

	end // always

endmodule
