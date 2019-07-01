`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:33 03/20/2017 
// Design Name: 
// Module Name:    decoder_3to8 
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
module decoder_3to8(in,en,out);
	input [2:0]in;
	input en;
	output reg [7:0]out;
	
	always @(*)begin
		casex({en,in})
			4'b0xxx: out[7:0] = 8'b00000000;
			4'b1000: out[7:0] = 8'b00000000;
			4'b1001: out[7:0] = 8'b00000001;
			4'b1010: out[7:0] = 8'b00000010;
			4'b1011: out[7:0] = 8'b00000100;
			4'b1100: out[7:0] = 8'b00001000;
			4'b1101: out[7:0] = 8'b00010000;
			4'b1110: out[7:0] = 8'b00100000;
			4'b1101: out[7:0] = 8'b01000000;
			4'b1111: out[7:0] = 8'b10000000;
			default: out[7:0] = out[7:0];
		endcase
	end
endmodule
