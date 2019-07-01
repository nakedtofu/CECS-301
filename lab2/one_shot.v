`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    16:56:53 02/13/2017 
// Version:        1.0 
// File Name:      one_shot.v
// Description:    This is the one shot file which is used to generate a single
//                 clock tick. The one shot will find a pattern by sequentially
//                 loading the clock ticks and it will debounce the clock ticks
//                 by checking if the pattern is finished. D_in is connected to a 
//                 electromechanical switch.
// Dependencies:   clk must be 500Hz in order for the debounce to work.
//
//
//////////////////////////////////////////////////////////////////////////////////
module one_shot(
    input D_in,
    input clk,
    input reset,
    output wire D_out //output wire D_out
    );


reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0;

always @ (posedge clk or posedge reset)
   if (reset == 1'b1)
      {q9, q8, q7, q6, q5, q4, q3, q2, q1, q0} <= 10'b0;
   else begin
	   // shift in the new sample that's on the D_in input
		q9 <= q8; q8 <= q7; q7 <= q6; q6 <= q5; q5 <= q4;
		q4 <= q3; q3 <= q2; q2 <= q1; q1 <= q0; q0 <= D_in;
	end
	
//create the debounced, one-shot output pulse
assign D_out = !q9 & q8 & q7 & q6 & q5 &
              q4 & q3 & q2 & q1 & q0;
					 
endmodule
