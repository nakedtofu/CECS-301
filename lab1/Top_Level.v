`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    16:56:53 02/13/2017 
// Version:        1.0 
// File Name:      Top_Level.v
// Description:    This is the top level diagram file which is used to gather
//                 files and interconnect all the inputs/outputs with each other.
//
//
//////////////////////////////////////////////////////////////////////////////////
module Top_Level(
    input clk_100MHz,
    input reset,
    input step,
    input [1:0] M,
    input SI,
    input [3:0] D,
    output [3:0] Q,
	 output [7:0] anode
    );

wire clk_500Hz;
wire clk;

assign anode = 8'hFF; // deassert anodes
clock_divider_circuit cd(clk_100MHz, reset, clk_500Hz); // clock divider
one_shot os(step, clk_500Hz, reset, clk); // one shot
shift_register shift_reg(clk_500Hz, reset, SI, M, D, Q); // shift register

endmodule
