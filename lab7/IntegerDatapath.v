`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  IntegerDatapath.v
 * Project:    lab7
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  04/09/2017
 *
 * Purpose:    This Integer Datapath module will instantiate 3 modules, the
 *				   register_file.v, SMux.v, and alu16.v modules to create a 
 *					variety of different operations.
 *					
 *         
 * Notes:		Inputs- 
 *				 clk: "Clock" Clock input that controls clock of certain modules
 *			  reset: "reset" Will be the reset signal for appropriate modules
 *   			W_En: "W-rite En-able" will cause the appropriate register to 
 *						have its contents written by the signal "W_En"
 *			  W_Adr: This will be the selected register that the module will 
 *						select in order to write the signal provided by "W_En"
 *			  R_Adr: This signal will be the selected register that will
 *						have its contents displayed through Reg_Out
 *			  S_Adr: This signal will be the selected register that will
 *					   have its contents displayed through Alu_Out.
 *			  S_Sel: This input will control which port the SMux will use as 
 *			  		   its input(either Reg_S or DS)
 *				   Outputs-
 *					C: This is the carry flag
 *					N: This is the negative flag
 *					Z: This is the zero flag
 * 				
 *					Instantiated Modules-
 *		  register_file: register which stores data
 *		      	  SMux: multiplexer for Mux_S 
 *		          alu16: executes arithmetic/logical operations with Reg_Out 
 *		                 and Mux_S
 *
 *					When reset is requested, the reset function in each module
 *					will occur.
 *
 ****************************************************************************/
module IntegerDatapath( clk, reset, W_En, W_Adr, R_Adr, S_Adr, DS, 
		                 S_Sel, ALU_OP, Alu_Out, Reg_Out, N, Z, C );
							  
	//Inputs												 
	input         clk, reset, W_En, S_Sel; 
	input   [2:0] W_Adr, R_Adr, S_Adr;
	input   [3:0] ALU_OP;
	input  [15:0] DS;

	//Ouputs
	output        N, Z, C;
	output [15:0] Alu_Out, Reg_Out;

	//Wires
	wire   [15:0] Reg_S, Mux_S; 
	 
		//Instantiated Modules
		register_file reg_file ( clk, reset, W_En, W_Adr, R_Adr, 
										 S_Adr, Alu_Out, Reg_Out, Reg_S );
		SMux 			     s_mux ( Reg_S, DS, S_Sel, Mux_S );
		alu16 		       alu ( Reg_Out, Mux_S, ALU_OP, Alu_Out, N, Z, C );

endmodule
