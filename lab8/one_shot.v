`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:    one_shot.v
 * Project:      Lab8
 * Designer:     Blas Arras
 * Email:        blas.arras@yahoo.com
 * Rev. No.:     Version 3
 * Rev. Date:    Feb 21, 2017
 *
 * Purpose:      Will observe a signal and send out high logic whenever the
 * 			     observed signal is stabilized.  
 *         
 * 			     Notes: This module will have an input signal from D_in that  
 * 			     is oscillating between 1 and 0. The signal will be sent to  
 * 			     10 registers that will observe the oscillating signal and 
 * 			     will send out high logic through D_out if the signal  
 * 			     stabilizes high for the last 9 register signals.  Once we  
 * 			     receive a signal that has those properties the module's 
 *               output assign statement will fire logic high, signaling 
 *               that we have a stabilized signal.
 *
 * 			     If reset is requested all the registers will be set to
 *               zero, allowing a "reset".
 *
 * Dependencies: Because our module is hooked up to a clock pulse of 500hz,
 * 			     we get 1/500 = 0.002 seconds, which is 2 milliseconds, but
 * 			     because we wait for 10 registers to be filled with the
 * 			     appropriate signals, we will be waiting for a signal that 
 * 			     has been stable for 20 milliseconds.
 *
 ****************************************************************************/
module one_shot(clk, reset, D_in, D_out );
	input	clk, reset, D_in;
	output D_out;
	wire D_out;
	
	reg q9, q8, q7, q6, q5, q4, q3, q2, q1, q0; //10 registers to capture 
															  //signal is created
	always @ (posedge clk or posedge reset)
		if (reset == 1'b1)
	
       	//If reset is active, all registers
			//are cleared and set to bit signal 0
			{q9,q8,q7,q6,q5,q4,q3,q2,q1,q0} <= 10'b0;  
												
		else begin
			//shift in the new sample that's on the D_input
			
			//The input signal is sent to D and then sent to the next
			//register to allow the assignment statement to determine
			//if the signal is stablized.
			q9 <= q8; q8 <= q7; q7 <= q6; q6 <= q5; q5 <= q4;
			q4 <= q3; q3 <= q2; q2 <= q1; q1 <= q0; q0 <= D_in;
		end
	
	//create the debounced, one-shot output pulse
	//The assignment statement to D_out will be active high whenever 
	//the registers observe that the D_in signal has been high for 20
	//milliseconds allowing this module to show the signal of has been
   //stabilized.	
	assign D_out = !q9 & q8 & q7 & q6 & q5 &
						 q4 & q3 & q2 & q1 & q0;
	
endmodule