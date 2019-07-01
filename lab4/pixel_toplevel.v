`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:05 03/08/2017 
// Design Name: 
// Module Name:    pixel_toplevel 
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
module pixel_toplevel(
   input clk,
	input reset,
	output wire [7:0] a,
	output wire [2:0] seq_sel
	);

	wire pxl_clk;

	pixel_clk p_clk ( clk, reset, pxl_clk );
   pixel_controller p_con ( pxl_clk, reset, a, seq_sel[2:0] );

endmodule
