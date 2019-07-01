`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  decoder_3to8.v
 * Project:    Lab8
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/22/2017
 *
 * Purpose:    This module acts as a selector, in the sense that the 
 *					respective 3 bit signal received will cause an assertion
 *					of the desired output bit within a 8 bit sequence.
 *         
 * Notes:		Inputs- 
 *   			  in: "In-put" will be the information to decode, in order to
 *						select the appropriate 1 bit signal out of 8.
 *				  en: "enable" this enable signal will allow the user to make
 *						a selection of one of the eight signals through their 
 *						selection through the 3 bit in signal only if this 
 *						signal is asserted at the same time.
 *
 *				   Outputs-
 *				 out: This will be the decoded 3 bit signal's response. It 
 * 					will carry the information of which bit the user 
 *						would like to be asserted.
 *							  
 *					If a case that is out of the range listed in the case 
 *					statement a default case will "take care" of any unspecified 
 *					condition. The default will act as a reset to all 0s.
 *
 ****************************************************************************/
module decoder_3to8(in,en,out);
	input [2:0]in;       //data input
	input en;            //enable
	output reg [7:0]out; //output
	
	always @(en or in)
	begin
	
	out = 0;
		if(en) //write data if enable is on
		begin
		
			case(in) //case statement to specify which value output obtains
			         //depending on the input value
			
				3'b000:  out[7:0] = 8'b00000001;
				3'b001:  out[7:0] = 8'b00000010;
				3'b010:  out[7:0] = 8'b00000100;
				3'b011:  out[7:0] = 8'b00001000;
				3'b100:  out[7:0] = 8'b00010000;
				3'b101:  out[7:0] = 8'b00100000;
				3'b110:  out[7:0] = 8'b01000000;
				3'b111:  out[7:0] = 8'b10000000;
			   default: out[7:0] = 8'b00000000;
			
			endcase
		
		end //if
	
	end //always

endmodule
