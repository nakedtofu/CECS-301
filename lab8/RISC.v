`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:32 05/04/2017 
// Design Name: 
// Module Name:    RISC 
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
module RISC( clk, reset, IR, N, Z, C,         // control unit inputs
						  W_Adr, R_Adr, S_Adr,             // these are 
					     adr_sel, s_sel,                  //  the control
					     pc_ld, pc_inc, pc_sel, ir_ld,    //   word output
					     mw_en, rw_en, alu_op,            //    fields
					     status
    ); 
	 
	 wire pc_ld, pc_inc, pc_sel, ir_ld;

	 CU         cu ( clk, reset, IR, N, Z, C,         // control unit inputs
						  W_Adr, R_Adr, S_Adr,             // these are 
					     adr_sel, s_sel,                  //  the control
					     pc_ld, pc_inc, pc_sel, ir_ld,    //   word output
					     mw_en, rw_en, alu_op,            //    fields
					     status );

	 CPU_EU  cpueu ( clk, reset, D_out, rw_en, s_sel, 
						  pc_ld, pc_inc, ir_ld, adr_sel,
						  C, N, Z , addr, Alu_Out );

endmodule
