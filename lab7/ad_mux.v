`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  ad_mux.v
 * Project:    lab7
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/10/2017
 *
 * Purpose:	   This is the address multiplexer module it's purpose is to
 *             select the appropriate d0-d7 input to output through Y[3:0]
 *				   based upon the 3 bit select signal.
 *         
 * Notes:      This address multiplexer module takes in 8 data
 *             inputs d0 to d7, each consisting of 4 bits, and outputs one
 *             of the 8 inputs as Y depending on the value of the 3 bit
 *             select called sel.
 *
 ****************************************************************************/
module ad_mux(
	input [2:0]sel,   // select
	input [3:0]d7,    // data #7
	input [3:0]d6,    // data #6
	input [3:0]d5,    // data #5
	input [3:0]d4,    // data #4
	input [3:0]d3,    // data #3
	input [3:0]d2,    // data #2
	input	[3:0]d1,    // data #1
	input [3:0]d0,    // data #0
	output reg [3:0]Y // output data
    );
	
	always @(*)
	begin
		case(sel)
			3'b000:  Y[3:0] <= d0[3:0]; // if sel is 000, output d0
			3'b001:  Y[3:0] <= d1[3:0]; // if sel is 001, output d1
			3'b010:  Y[3:0] <= d2[3:0]; // if sel is 010, output d2
			3'b011:  Y[3:0] <= d3[3:0]; // if sel is 011, output d3
			3'b100:  Y[3:0] <= d4[3:0]; // if sel is 100, output d4
			3'b101:  Y[3:0] <= d5[3:0]; // if sel is 101, output d5
			3'b110:  Y[3:0] <= d6[3:0]; // if sel is 110, output d6
			3'b111:  Y[3:0] <= d7[3:0]; // if sel is 111, output d7
			default: Y[3:0] <=  Y[3:0]; // if default, no change
		endcase
	
	end // always
	
endmodule

