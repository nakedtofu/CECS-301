`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    16:56:53 02/13/2017 
// Version:        1.0 
// File Name:      shift_register.v
// Description:    This is the shift register file which is made up of a
//                 combination of 4 muliplexers and 4 registers.
//
//////////////////////////////////////////////////////////////////////////////////
module shift_register(clk, reset, SI, M, D, Q);
    
	 input clk;
    input reset;
	 input SI;
	 input [1:0] M;
    input [3:0] D;
    output wire [3:0] Q;
	 
	 wire [3:0] Y;
						  
	 // create mux with appropriate inputs/output
	 mux4to1 mux0(M, {Q[1], SI,   D[0], Q[0]}, Y[0]),
			   mux1(M, {Q[2], Q[0], D[1], Q[1]}, Y[1]),
				mux2(M, {Q[3], Q[1], D[2], Q[2]}, Y[2]),
				mux3(M, {Q[0], Q[2], D[3], Q[3]}, Y[3]);
				
	 // create registers with appropriate inputs/output
 	 register_module reg0(Y[0], clk, reset, Q[0]),
	                 reg1(Y[1], clk, reset, Q[1]),
	                 reg2(Y[2], clk, reset, Q[2]),
			           reg3(Y[3], clk, reset, Q[3]);

endmodule
