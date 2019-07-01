`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  hex_to_7_segment_decoder.v
 * Project:    lab7
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  02/28/2017
 *
 * Purpose:	   Provides the led bars of the 7 segment display with the 
 *			      proper binary information to display the data in hex it  
 * 	  	      gained from global input state[3:0]
 *         
 * Notes:      In this verilog module we are receiving a global input 
 * 		      signal [3:0]state which needs to be translated into binary  
 * 		      information for the seven segment display to display our hex 
 * 		      signal as the formal and  user readable hex symbol.
 * 
 * 		      The module creates a case statement that will handle the  
 * 		      16 cases that are receivable by [3:0]state, translating each  
 * 		      case to the appropriate binary signal that our seven segment 
 *			      display needs to use to activate or turn off each of it's 
 * 	         seven cathodes. Once a case is presented to the case statement 
 * 		      the appropriate 7 bit signal is sent through to the global 
 *             output display[6:0].
 * 		      
 ****************************************************************************/
module hex_to_7_segment_decoder(
    input      [3:0]  state, // 3 bit state_number
    output reg [6:0] display // 7 segment cathode display
    );

    always@(*)
	 begin
	 
		   case(state)
			
			    4'b0000: display <= {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_000, display 0
				 4'b0001: display <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1}; 
				 // state = 0_001, display 1
				 4'b0010: display <= {1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0}; 
				 // state = 0_010, display 2
				 4'b0011: display <= {1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_011, display 3
				 4'b0100: display <= {1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1}; 
				 // state = 0_100, display 4
				 4'b0101: display <= {1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0}; 
				 // state = 0_101, display 5
				 4'b0110: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; 
				 // state = 0_110, display 6
				 4'b0111: display <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display 7
				 4'b1000: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display 8
				 4'b1001: display <= {1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display 9
				 4'b1010: display <= {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display A
				 4'b1011: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}; 
				 // state = 0_110, display b
				 4'b1100: display <= {1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}; 
				 // state = 0_110, display C
				 4'b1101: display <= {1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1}; 
				 // state = 0_110, display d
				 4'b1110: display <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}; 
				 // state = 0_110, display E
				 4'b1111: display <= {1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0}; 
				 // state = 0_110, display F
				 default: display <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}; 
				 // default, display nothing
				 
			endcase
			
	end // always
	
endmodule
