`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:26 02/20/2017 
// Design Name: 
// Module Name:    moore 
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
module moore(
    input clk,
    input reset,
    input in_ports,
    output reg out_ports
    );

//***********************************************
// state register of 2-bits for 4 states
//***********************************************
reg [2:0] state_register;
//********************************************************************************************
// Behavioral Logic for BOTH next state and outputs
// Note: both the state and output variables ONLY change on a clock event
//********************************************************************************************
always @(posedge clk or posedge reset)
	if (reset == 1'b1)
		{state_register,out_ports} = {3'b000, 1'b0};
		
	else
		case ( {state_register,in_ports} )

		//state 000 with the 2 combinations of inputs
		4'b000_0: {state_register, out_ports} = {3'b000, 1'b0};
		4'b000_1: {state_register, out_ports} = {3'b001, 1'b0};

		//state 001 with the 2 combinations of inputs
		4'b001_0: {state_register, out_ports} = {3'b010, 1'b0};
		4'b001_1: {state_register, out_ports} = {3'b001, 1'b0};

		//state 010 with the 2 combinations of inputs
		4'b010_0: {state_register, out_ports} = {3'b000, 1'b0};
		4'b010_1: {state_register, out_ports} = {3'b011, 1'b0};

		// state 011 with the 2 combinations of inputs
		4'b011_0: {state_register, out_ports} = {3'b010, 1'b0};
		4'b011_1: {state_register, out_ports} = {3'b100, 1'b0};
		
		// state 100 with the 2 combinations of inputs
		4'b100_0: {state_register, out_ports} = {3'b010, 1'b0};
		4'b100_1: {state_register, out_ports} = {3'b100, 1'b0};
		
		// state 101 with the 2 combinations of inputs
		4'b101_0: {state_register, out_ports} = {3'b000, 1'b0};
		4'b101_1: {state_register, out_ports} = {3'b110, 1'b0};
		
		// state 101 with the 2 combinations of inputs
		4'b110_0: {state_register, out_ports} = {3'b000, 1'b0};
		4'b110_1: {state_register, out_ports} = {3'b001, 1'b1};
		
		default: {state_register, out_ports} = {3'b000, 1'b0};

	endcase
	
endmodule
