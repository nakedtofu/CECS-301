`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:03 03/08/2017 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(clk, reset, clk_out) ;

	input	 clk, reset;
	output clk_out;
	reg 	 clk_out;
	integer i;
	
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
			if (i >= 100000 ) begin //In this case we have a 
											//500hz clk
											//(100Mhz/500hz)/2 =
											// 100000
				clk_out = ~clk_out;
				i = 0;
			end // if
		end // else
		
	end // always

endmodule
