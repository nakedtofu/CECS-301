`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:56:47 02/13/2017
// Design Name:   shift_register
// Module Name:   C:/Users/Nao/Desktop/xilinx labs/Lab1/CECS301_Lab1_tb.v
// Project Name:  Lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
module CECS301_Lab1_tb();
// Inputs
    reg clk, reset, SI;
    reg [1:0] M;
    reg [3:0] D;
// Outputs
    wire [3:0] Q;
// Instantiate the Unit Under Test
    shift_register
    uut (
    .clk(clk), .reset(reset), .SI(SI),
    .M(M), .D(D),
    .Q(Q)
    );
// Generate Clock with a 10 ns period
    always
    #5 clk = ~clk;
// Initialize Inputs
    initial begin
        $timeformat(-9, 1, " ns", 6);
        clk = 0; reset = 0; M = 0; D = 0; SI = 0;
//These two clocks take care of reset
        @(negedge clk)
            reset = 1;
        @(negedge clk)
            reset = 0;
//Exercise the "load" function with D = 0xD (1101). Note SI is don't care Q+ <- 1101
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_01_1101_x;
//Exercise the "no change" function. Note both D and SI are don't care Q+ <- 1101
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_00_xxxx_x;
//Exercise the "shift left" function with SI = 0. Note D is don't care Q+ <- 1010
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_10_xxxx_0;
//Exercise the "shift left" function with SI = 1. Note D is don't care Q+ <- 0101
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_10_xxxx_1;
//Exercise the "shift left" function with SI = 1. Note D is don't care Q+ <- 1011
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_10_xxxx_1;
//Exercise the "rotate right" function. Note both D and SI are don't care Q+ <- 1101
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_11_xxxx_x;
//Exercise the "rotate right" function. Note both D and SI are don't care Q+ <- 1110
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_11_xxxx_x;
//Exercise the "no change" function. Note both D and SI are don't care Q+ <- 1110
        @(negedge clk)
            {reset,M,D,SI} = 8'b0_00_xxxx_x;
        $finish;
    end
endmodule
