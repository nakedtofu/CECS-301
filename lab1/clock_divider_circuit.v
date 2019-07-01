`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    16:56:53 02/13/2017 
// Version:        1.0 
// File Name:      clock_divider_circuit.v
// Description:    This is the clock divider file which converts the frequency
//                 of the clock into another frequency of the one desired. Since
//                 100MHz is too fast to view, we want to drop the frequency to 
//                 500Hz in this case.
//
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider_circuit(
    input clk_in,
    input reset,
    output reg clk_out
    );

integer i;

//***************************************************************
// The following verilog code will "divide" an incoming clock
// by the 32-bit deimal value specified in the "if condition"
//
// The value of the counter that counts the incoming clock ticks
// is equal to [ (Incoming Freq / Outgoing Freq) / 2 ]
//***************************************************************

always @ (posedge clk_in or posedge reset) 
begin
   if (reset == 1'b1) 
	begin
	   i = 0;
      clk_out = 0;
   end
	// got a clock, so increment the counter and
	// test to see if half a period has elapsed
	else 
	begin
	   i = i + 1;
		if (i >= 100000) // 100MHz/500Hz/2 = 100K ticks
		begin
		   clk_out = ~ clk_out;
			i = 0;
		end // if
	end // else
end // always

endmodule
