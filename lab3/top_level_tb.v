`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:54 02/20/2017
// Design Name:   top_level
// Module Name:   C:/Users/Nao/Desktop/xilinx labs/lab2/top_level_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_level_tb();
//inputs
reg clk, reset, X, M;
//outputs
wire Z;
wire [2:0] Q;

reg [44:1] sequence_pattern;
integer i;

top_level uut(
	.clk(clk), .reset(reset),
	.X(X), .M(M),
	.Z(Z), .Q(Q) );

always
	#5 clk = ~clk;

initial begin
	$timeformat(-12,1," ps", 8);
	clk = 0; reset = 0; X = 0; M = 0;
	sequence_pattern = 44'b01100010101101011011111001011011011011101010;
	@(negedge clk)
		reset = 1;
	@(negedge clk)
		reset = 0;
		M = 0;
	
	for(i=44; i>0; i=i-1)
		@(negedge clk)
			X = sequence_pattern[i];
		@(posedge clk)
			#1 $display("Time=%t X=%b Q=%b Z=%b", $time, X, Q, Z);
	//end
	
$stop;
end
	
endmodule
	