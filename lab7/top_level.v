`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  top_level.v
 * Project:    lab7
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
 *             CPU_EU: cpu execution unit
 *
 *					When reset is requested, the reset function in each module
 *					will occur.
 *
 ****************************************************************************/
module top_level(
	 clk, reset, W_En, step, S_Sel, S_Sel, pc_ld,
	 pc_inc, ir_ld, adr_sel, C, N, Z, cathode, anode
    );
	 
	 input         clk, reset, W_En, step, S_Sel,
						pc_ld, pc_inc, ir_ld, adr_sel;
					// clock, reset, write enable, address step, S selector,
					// pc load, pc increment, ir load, address selector
	 
	 output        N, Z, C; // negative flag, zero flag, carry flag
	 output	[7:0] anode, cathode; // anode, cathode
	 
	 wire				d_we, addr_clk; // write enable wire
	 wire   [15:0] addr, Alu_Out, D_out, addr;
					// address, ALU output, memory data, memory address
	 
	 assign cathode[7] = 1'b1; // deassert decimal point
	 
	 // instantiate modules
	 
	 one_shot				os_we ( clk, reset, W_En, d_we ),
	                     os_addr ( clk, reset, step, step_clk );
	 
	 display_controller	disp_c ( clk, reset, addr, 
											Alu_Out, anode, cathode[6:0] );
	 
	 // RAM module
	 // ram1 ram( clk_100MHz, d_we, addr[7:0], d_in[15:0], dout[15:0] );
	 
	 CPU_EU              cpueu ( clk, reset, D_out, step_clk, S_Sel, 
										  pc_ld, pc_inc, ir_ld, adr_sel,
										  C, N, Z , addr, Alu_Out );

endmodule
