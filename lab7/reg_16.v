`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:19 04/19/2017 
// Design Name: 
// Module Name:    reg_16 
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
module reg_16( clk, reset, ld, inc, D, Q );

	input             clk, reset, ld, inc;
	input      [15:0] D;
	output reg [15:0] Q;
	
	always @( posedge clk, posedge reset )
	begin

		if( reset == 1'b1 )
			Q <= 16'h0000;

		else
			case( { ld, inc } )

				2'b01:   Q <= Q + 16'b1;
				2'b10:   Q <= D;
				default: Q <= Q;

			endcase

	end

endmodule
