`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  reg_16bit.v
 * Project:    Lab8
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  04/09/2017
 *
 * Purpose:    To hold, write, and display 16 bit memory inside of its
 *					register through two different ports 
 *         
 * Notes:		Inputs- 
 *				 clk: "Clock" Clock input that controls clock of certain modules
 *			  reset: "reset" Will be the reset signal for appropriate modules
 *   			  ld: This signal asserts the load function of the register it
 *						is attached to, sending the binary data from "Din" 
 *						signal into the register.
 *				 Din: This signal is the signal that each register will load 
 *						when the load signal is asserted. 
 * 		    oeA:	This is the signal required for the register to show its 
 *						contents through it's "Da" signal.
 *			    oeB: This is the signal required for the register to show its 
 *						contents through it's "Db" signal.
 *
 *				   Outputs-
 *				  DA: These are the wires the register will send its contents 
 *						data through if the "oeA" signal of the register is
 *                asserted
 *				  DB: These are the wires the register will send its contents
 *						data through if the "oeB" signal of the register is
 *                asserted
 *							  
 *					In this module we will create a 16 bit register that is able 
 *					to have data written into its contents through the Din ports
 *					if the ld signal is asserted. In this module we have the 
 *					option of sending the contents of the module through DA or 
 *					through DB by asserting the respective oeA or oeB signal. 
 *
 *					When reset is requested, the register will have its contents 
 *					set all to zero "resetting" the module.
 *
 ****************************************************************************/
module reg_16bit(clk, reset, ld, Din, DA, DB, oeA, oeB);
	//Inputs
	input  clk, reset, ld, oeA, oeB;
	input  [15:0] Din;
	//Outputs
	output [15:0] DA, DB;
	
	//Register to hold memory
	reg    [15:0] Dout;
	
	// behavioral section for writing to the register
	always @(posedge clk or posedge reset)
		if (reset)
			Dout <= 16'b0;
		else
			if(ld)
				Dout <= Din;
			else Dout <= Dout;
	
	// conditional continuous assignments for reading the register
	assign DA = oeA ? Dout : 16'hz;
	assign DB = oeB ? Dout : 16'hz;
	
endmodule

