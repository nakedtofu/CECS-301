`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  display_controller.v
 * Project:    Lab7
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/22/2017
 *
 * Purpose:    This module will act as a register file, with many registers
 *					created within it, able to have it's memory accessed and
 *					written to by the 3 to 8 decoder modules created with them
 *					
 *         
 * Notes:		Inputs- 
 *				 clk: "Clock" Clock input that controls clock of certain modules
 *			  reset: "reset" Will be the reset signal for appropriate modules
 *   			  we: "w-rite e-nable" will cause the appropriate register to 
 *						hav its contents written by the signal "w"
 *			  W_adr: This will be the selected register that the module will 
 *						select in order to write the signal provided by "w"
 *			  R_adr: This signal will be the selected register that will
 *						have its contents displayed through R
 *			  S_adr: This signal will be the selected register that will
 *					   have its contents displayed through S.
 *					w: this is the signal that the register will load into 
 *						itself if and only if the "we" signal is also asserted.
 *				   Outputs-
 *				   R: This is the signal that one of the registers in the 
 *						register file will sen it's contents through;
 *					S: This is another signal that one of the registers can also 
 *						use to display the contents at the same time another 
 *						register could be using R to display its contents
 * 				
 *					Instantiated Modules-
 *	   reg_16 bit: This module will create a 16 bit register that will allow
 *						this register file to read, write, and display memory from.
 *	 decoder_3to8: This module will act as a selector for the user to select 
 *						an appropriate function to the selected register.
 *
 *					When reset is requested, the reset function in each module
 *					will occur.
 *
 ****************************************************************************/
  module register_file(clk, reset, we, W_adr, R_adr, S_adr, w, R, S);
   
	//Inputs
	input clk, reset, we; //clock, reset, write enable
	input [2:0] W_adr, R_adr, S_adr;
	//Write Address, Register displayed through A port, RDT B ports
	input [15:0] w; 		//written bit information to register
	
	//Outputs
	output wire [15:0] R, S;
	//R, S to display contents of respectively chosen register
	
	wire [7:0] W,A,B;
	//Wires to connect decoder_3to8 modules with reg_16bit modules
	//W = wires that carry the "load enable" signal to appropriate register
	//A = wires that carry the "display through R" signal
	//B = wires that carry the "display through S" signal
	
	//Instantiation of 8, 16 bit registers					
	reg_16bit 		reg1(clk,reset,W[0],w,R,S,A[0],B[0]),
						reg2(clk,reset,W[1],w,R,S,A[1],B[1]),
						reg3(clk,reset,W[2],w,R,S,A[2],B[2]),
						reg4(clk,reset,W[3],w,R,S,A[3],B[3]),
						reg5(clk,reset,W[4],w,R,S,A[4],B[4]),
						reg6(clk,reset,W[5],w,R,S,A[5],B[5]),
						reg7(clk,reset,W[6],w,R,S,A[6],B[6]),
						reg8(clk,reset,W[7],w,R,S,A[7],B[7]);
				
	//Instantiation of 3, 3 to 8 decoders
	decoder_3to8	load(W_adr,  we,  W),
						OEA (R_adr, 1'b1, A),
						OEB (S_adr, 1'b1, B);

endmodule
