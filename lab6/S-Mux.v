`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  SMux.v
 * Project:    lab6
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  04/09/2017
 *
 * Purpose:    This SMux multiplexer module will control which input the
 *					output will obtain.
 *         
 * Notes:      This module will use two 16 bit inputs SA and SB. S_Sel will
 *					then control which input the output S will obtain. 
 *
 ****************************************************************************/
module SMux( SA, SB, S_Sel, S );
	input [15:0] SA, SB; // 16 bit input A, input B 
	input S_Sel;         // input selector
	output reg [15:0] S; // 16 bit output
	
	always @ (*)
	begin
	
		case( S_Sel )
		1'b0 : S = SA;    // pass SA
		1'b1 : S = SB;    // pass SB
	default : S = 16'b0; // pass 16 bits of 0s
		endcase
	
	end // end always

endmodule
