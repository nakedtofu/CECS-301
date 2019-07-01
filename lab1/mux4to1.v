`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    16:56:53 02/13/2017 
// Version:        1.0 
// File Name:      mux4to1.v
// Description:    This is the multiplexer file which handles which inputs to
//                 output depending on the select called M.
//
//
//////////////////////////////////////////////////////////////////////////////////

module mux4to1(input [1:0] M, input [3:0] D, output reg Y);
	 
	 
	 always @(*)
	 case(M) // case statement to handle output decision
	 2'b01: Y <= D[1];
	 2'b10: Y <= D[2];
	 2'b11: Y <= D[3];
	 default: Y <= D[0];
	 endcase

endmodule
