`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:35 02/20/2017 
// Design Name: 
// Module Name:    mealy 
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

module mealy(
    input clk,
    input reset,
    input in_ports,
    output reg out_ports
    );

//***********************
// state register and
// next_state variables
//***********************

reg [2:0] present_state;
reg [2:0] next_state;

//*********************************************************************************************
// Next State Combinational Logic and Output Combinational Logic
// (next state values can change anytime but will only be "clocked" below)
// (output values can change whenever an input or state changes)
//*********************************************************************************************

always @(present_state, in_ports)
		case ( {present_state,in_ports} )		
			//state 000 with the 2 combinations of inputs
			4'b000_0: {next_state, out_ports} = {3'b000, 1'b0};
			4'b000_1: {next_state, out_ports} = {3'b001, 1'b0};

			//state 001 with the 2 combinations of inputs
			4'b001_0: {next_state, out_ports} = {3'b010, 1'b0};
			4'b001_1: {next_state, out_ports} = {3'b001, 1'b0};

			//state 010 with the 2 combinations of inputs
			4'b010_0: {next_state, out_ports} = {3'b000, 1'b0};
			4'b010_1: {next_state, out_ports} = {3'b011, 1'b0};

			// state 011 with the 2 combinations of inputs
			4'b011_0: {next_state, out_ports} = {3'b010, 1'b0};
			4'b011_1: {next_state, out_ports} = {3'b100, 1'b0};
		
			// state 100 with the 2 combinations of inputs
			4'b100_0: {next_state, out_ports} = {3'b010, 1'b0};
			4'b100_1: {next_state, out_ports} = {3'b100, 1'b0};
		
			// state 101 with the 2 combinations of inputs
			4'b101_0: {next_state, out_ports} = {3'b000, 1'b0};
			4'b101_1: {next_state, out_ports} = {3'b000, 1'b1};
		
			default: {next_state, out_ports} = {3'b000, 1'b0};		
		
		endcase

//*****************************************************
// State Register Logic (Sequential Logic)
//*****************************************************

always @(posedge clk or posedge reset)
	if (reset == 1'b1)
		present_state = 3'b0; // Got a reset so set state register to all 0's
	else
		present_state = next_state; // Got a posedge so update state register with next state
endmodule
