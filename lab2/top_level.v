`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    14:30:20 02/20/2017 
// Version:        1.0 
// File Name:      top_level.v
// Description:    This is the top level module for this lab.
//
//
//////////////////////////////////////////////////////////////////////////////////
module top_level(
	input clk, //clock
	input reset, //reset
	input step, //step
	input X, //data input
	input M, //moore/mealy switch
	output Z, //output
	output [2:0] Q, //state
	output [7:0] anode //anode
	);

wire clk_500Hz, clk_oneshot;  //wire for clocks

assign anode = 8'hFF; // deassert anodes

clock_divider_circuit cdc(clk, reset, clk_500Hz);  //create clock divider circuit

one_shot os(step, clk_500Hz, reset, clk_oneshot); //create one shot

sequence_detector sd(clk_oneshot, reset, X, M, Z, Q[2:0]); //create sequence detector

endmodule
