`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    15:52:38 03/10/2017 
// Version:        1.0 
// File Name:      ad_mux.v
// Description:    This is the address multiplexer module. It takes in 8 address
//                 inputs d0 to d7, each consisting of 4 bits, and outputs one
//                 of the 8 inputs as Y depending on the value of the 3 bit
//                 select called sel.
// Dependencies:   Each address inputs must consist of 4 bits in order for this
//                 module to work.
//
//////////////////////////////////////////////////////////////////////////////////
module ad_mux(
	input [2:0]sel,
	input [3:0]d0,
	input [3:0]d1,
	input [3:0]d2,
	input [3:0]d3,
	input	[3:0]d4,
	input [3:0]d5,
	input [3:0]d6,
	input	[3:0]d7,
	output wire [3:0]Y
    );
		
	case(sel)
		3'b000: assign Y = d0;
		3'b001: assign Y = d1;
		3'b010: assign Y = d2;
		3'b011: assign Y = d3;
		3'b100: assign Y = d4;
		3'b101: assign Y = d5;
		3'b110: assign Y = d6;
		3'b111: assign Y = d7;
		default: assign Y = Y;
	endcase

endmodule
