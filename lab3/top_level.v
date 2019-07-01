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
	output [7:0] anode, //anode
	output [6:0] cathode //anode
	);

wire clk_500Hz, clk_oneshot; //wire for clocks

wire [3:0] state; //wire for 4 bit state

assign state = {1'b0, Q[2:0]};
//concatenate 1 bit 0 and Q, and store it in state

assign anode[7:1] = 7'hFF; // deassert anodes 7 to 1

assign anode[0] = 7'h00; // enable anode 0

clock_divider_circuit cdc(clk, reset, clk_500Hz);
//create clock divider circuit

one_shot os(step, clk_500Hz, reset, clk_oneshot);
//create one shot

sequence_detector sd(clk_oneshot, reset, X, M, Z, Q[2:0]);
//create sequence detector

hex_to_7_segment_decoder hto7(clk_oneshot, reset, state, cathode[6:0]);
//create hex to 7 segment decoder

endmodule
