`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    22:42:53 02/28/2017 
// Version:        1.0 
// File Name:      hex_to_7_segment_decoder.v
// Description:    This is the hex to 7 segment decoder module. On negedge clk, 
//                 the 4bit state({1'b0, state_number}) is converted into 7 
//                 segment cathode display by using a case statement. 
//
//
//////////////////////////////////////////////////////////////////////////////////
module hex_to_7_segment_decoder(
    input clk, //clock
	 input reset, //reset
    input [3:0] state, //3 bit state_number
    output reg [6:0] display //7 segment cathode display
    );

    always@(negedge clk, negedge reset)
	   if(reset==1'b1)
		   display <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1};
			//set 7 segment display nothing if reset
		else
		   case(state)
			    4'b0_000: display <= {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}; 
				 //state = 0_000, display 0
				 4'b0_001: display <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1}; 
				 //state = 0_001, display 1
				 4'b0_010: display <= {1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0}; 
				 //state = 0_010, display 2
				 4'b0_011: display <= {1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}; 
				 //state = 0_011, display 3
				 4'b0_100: display <= {1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1}; 
				 //state = 0_100, display 4
				 4'b0_101: display <= {1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0}; 
				 //state = 0_101, display 5
				 4'b0_110: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; 
				 //state = 0_110, display 6
				 default:  display <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}; 
				 //default, display nothing
			endcase

endmodule
