`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:01 03/08/2017
// Design Name:   pixel_toplevel
// Module Name:   C:/Users/Nao/Desktop/xilinx labs/lab4/lab4/pixel_tb.v
// Project Name:  lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pixel_toplevel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pixel_tb;
//inputs
reg clk, reset;
reg [7:0]a;
//outputs
wire pxl_clk;
wire [2:0]seq_sel;

integer i = 0;

pixel_toplevel uut(
	.clk(clk), .reset(reset),
	.a(a), .pxl_clk(pxl_clk),
	.seq_sel(seq_sel) );

always
	#5 clk = ~clk;
	
	initial begin
		$timeformat(-12,1," ps", 8);	
		clk = 0; reset = 0; a[7:0] = 7'hFF; 
	
		@(negedge clk)
			reset = 1;
		@(negedge clk)
			reset = 0;

		@(negedge clk)
		begin
			reset = 1'b0;
			a = 0;
		end
		
		@(negedge clk)
		begin
			reset = 1'b0;
			a = 1;
		end
		
		@(negedge clk)
		begin
			reset = 1'b0;
			a = 2;
		end
	
	end
	
endmodule
