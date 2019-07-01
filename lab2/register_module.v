`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    16:56:53 02/13/2017 
// Version:        1.0 
// File Name:      register_module.v
// Description:    This is the register file which stores data. 
//
//
//////////////////////////////////////////////////////////////////////////////////
module register_module(clk, reset, D, Q);

    input D; //input data
    input clk; //clock
    input reset; //reset
    output reg Q; //output data
	 
	 always@(posedge clk, posedge reset)
	 // if reset, output = 0; else output = input
	 if(reset) Q<=1'b0;
	 else Q<=D;
	 	
endmodule
