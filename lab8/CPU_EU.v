`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:23 04/19/2017 
// Design Name: 
// Module Name:    CPU_EU 
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

/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  top_level.v
 * Project:    lab8
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  04/09/2017
 *
 * Purpose:    This top level module will instantiate 3 modules: one_shot.v,
 *				   display_controller.v, and IntegerDatapath.v.
 *					
 *         
 * Notes:		Global Inputs- 
 *				 clk: "Clock" Clock input that controls clock of certain modules
 *			  reset: "reset" Will be the reset signal for appropriate modules
 *   			W_En: "W-rite En-able" will cause the appropriate register to 
 *						have its contents written by the signal "d_we"
 *			  W_Adr: This will be the selected register that the module will 
 *						select in order to write the signal provided by "d_we"
 *			  R_Adr: This signal will be the selected register that will
 *						have its contents displayed through Reg_Out
 *			  S_Adr: This signal will be the selected register that will
 *					   have its contents displayed through Alu_Out.
 *			 ALU_OP: This input will control which operation the ALU module
 *			         will perform  
 *			  S_Sel: This input will control which port the SMux will use as 
 *			  		   its input(either Reg_S or DS)
 *			  		    
 *				   Global Outputs-
 *					C: This is the carry flag
 *					N: This is the negative flag
 *					Z: This is the zero flag
 *			cathode: This will display the output values on the cathodes 
 *			  anode: This will display the output values on the anodes
 * 				
 *					Instantiated Modules-
 *		    	 one_shot: creates one_shot pulse
 *	display_controller: controls which value and at what frequency the 
 *		                 anode/cathode will display
 *    IntegerDatapath: performs arithmetic/logic operations on passed in 
 *					        values
 *
 *					When reset is requested, the reset function in each module
 *					will occur.
 *
 ****************************************************************************/
module CPU_EU( clk, reset, D, W_En, S_Sel, pc_ld, pc_inc, 
					ir_ld, adr_sel, C, N, Z, addr, Alu_Out );
	 
	 input         clk, reset, W_En, S_Sel, pc_ld, pc_inc, ir_ld, adr_sel;
					// clock, reset, write enable, S selector,
					// PC load, PC incrementer, IR load, Address Selector
	 input  [15:0] Mem_Out;
					// data from memory
	 
	 output        N, Z, C;
					// negative flag, zero flag, carry flag
	 output [15:0] addr;
					// memory address output
	 
	 wire   [15:0] Reg_Out, Alu_Out, IRQ, PCQ;
					// register R output, ALU output, data selector,
					// IR output, PC output
	 
	 // instantiate modules
	 reg_16           IR ( clk, reset, ir_ld, 1'b0,
								  Mem_Out[15:0], IRQ[15:0] ),
					      PC ( clk, reset, pc_ld, pc_inc,
								  Alu_Out[15:0], PCQ[15:0] );
								
	 IntegerDatapath IDP ( clk, reset, W_En, IRQ[8:6], IRQ[5:3],
								  IRQ[2:0], Mem_Out[15:0], S_Sel, IRQ[15:12],
								  Alu_Out[15:0], Reg_Out[15:0], N, Z, C );
		
	 // address output selector
	 assign addr = ( adr_sel == 1'b1 ) ? Reg_Out[15:0] : PCQ[15:0];

endmodule
