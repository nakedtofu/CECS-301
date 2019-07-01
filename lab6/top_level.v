`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  top_level.v
 * Project:    lab6
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  04/09/2017
 *
 * Purpose:    This top level module will instantiate 5 modules: one_shot.v,
 *				   register_file.v, SMux.v, alu16.v, and display_controller.v.
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
 *			  S_Sel: This input will control which port the SMux will use as 
 *			  		   its input(either Reg_S or DS)
 *				   Global Outputs-
 *					C: This is the carry flag
 *					N: This is the negative flag
 *					Z: This is the zero flag
 *			cathode: This will display the output values on the cathodes 
 *			  anode: This will display the output values on the anodes
 * 				
 *					Instantiated Modules-
 *		    	 one_shot: creates one_shot pulse
 *		  register_file: register which stores data
 *		      	  SMux: multiplexer for Mux_S 
 *		          alu16: executes arithmetic/logical operations with Reg_Out 
 *		                 and Mux_S
 *	display_controller: controls which value and at what frequency the 
 *		                 anode/cathode will display
 *
 *					When reset is requested, the reset function in each module
 *					will occur.
 *
 ****************************************************************************/
module top_level(
	 clk, reset, W_En, W_Adr, R_Adr, S_Adr, ALU_OP, S_Sel,
	 C, N, Z, cathode, anode
    );
	 
	 input         clk, reset, W_En, S_Sel;
	 // clock, reset, write enable, S selector
	 input   [2:0] W_Adr, R_Adr, S_Adr;
	 // write address, R address, S address
	 input   [3:0] ALU_OP;
	 // ALU Operation
	 output        N, Z, C;
	 // negative flag, zero flag, carry flag
	 output	[7:0] cathode, anode;
	 // cathode, anode
	 
	 wire				d_we; //write enable wire
	 wire   [15:0] Reg_Out, Alu_Out, DS, Reg_S, Mux_S;
	 // register R output, ALU output, 16'hAA55 data,
	 // register S output, multiplexer S output
	 
	 // assign the last cathod to logic high to turn it off on the board.
	 assign cathode[7] = 1'b1;	 
	 // assign DS to 16'hAA55
	 assign DS = 16'hAA55;
	 
	 // instantiate modules
	 one_shot				debounce ( clk, reset, W_En, d_we );
	 register_file 		reg_file ( clk, reset, d_we, W_Adr, R_Adr, S_Adr,
											  Alu_Out, Reg_Out, Reg_S );
	 SMux 					s_mux ( Reg_S, DS, S_Sel, Mux_S );
	 alu16 					alu ( Reg_Out, Mux_S, ALU_OP, Alu_Out, N, Z, C );
	 display_controller	disp_c ( clk, reset, Reg_Out, 
											Alu_Out, anode, cathode[6:0] );

endmodule
