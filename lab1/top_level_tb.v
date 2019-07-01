`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:04:56 02/14/2017
// Design Name:   Top_Level
// Module Name:   C:/Users/Nao/Desktop/xilinx labs/Lab1/top_level_tb.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top_Level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_level_tb;

	// Inputs
	reg clk_100MHz;
	reg reset;
	reg step;
	reg [1:0] M;
	reg SI;
	reg [3:0] D;

	// Outputs
	wire [3:0] Q;
	wire [7:0] anode;

	// Instantiate the Unit Under Test (UUT)
	Top_Level uut (
		.clk_100MHz(clk_100MHz), 
		.reset(reset), 
		.step(step), 
		.M(M), 
		.SI(SI), 
		.D(D), 
		.Q(Q), 
		.anode(anode)
	);

// Generate Clock with a 10 ns period
    always
    #5 clk_100MHz = ~clk_100MHz;
// Initialize Inputs
    initial begin
        $timeformat(-9, 1, " ns", 6);
        clk_100MHz = 0; reset = 0; step =0; M = 0; D = 0; SI = 0;
//These two clocks take care of reset
        @(negedge clk_100MHz)
            reset = 1;
        @(negedge clk_100MHz)
            reset = 0;
//Exercise the "load" function with D = 0xD (1101). Note SI is don't care Q+ <- 1101
        @(negedge clk_100MHz)
            {reset,step,M,SI,D} = 9'b0_0_01_x_1101;
//Exercise the "no change" function. Note both D and SI are don't care Q+ <- 1101
        @(negedge clk_100MHz)
            {reset,step,M,SI,D} = 9'b0_0_01_x_xxxx;
//Exercise the "shift left" function with SI = 0. Note D is don't care Q+ <- 1010
        @(negedge clk_100MHz)
            {reset,step,M,SI,D} = 9'b0_0_10_0_xxxx;
//Exercise the "shift left" function with SI = 1. Note D is don't care Q+ <- 0101
        @(negedge clk_100MHz)
            {reset,step,M,SI,D} = 9'b0_0_11_x_xxxx;
        $finish;
    end
      
endmodule

