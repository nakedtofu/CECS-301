`timescale 1ns / 1ps 
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  pixel_controller.v
 * Project:    lab4
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	    		   naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  03/08/2017
 *
 * Purpose:    This module was created to control which "pixel" otherwise 
 *             known as the anode the board is currently enabling with logic
 *             low.
 *
 * Notes:      This is the pixel controller module. This module will enable
 *             1 of the 8 anodes ([7:0]a) from right to left sequentially on
 *             each positive edge of the clock called clk. The 3bit sequence 
 *             selector, [2:0]seq_sel, will then store which anode state the
 *             module is at in binary format.
 *
 ****************************************************************************/
module pixel_controller(
    input            clk,    // 125Hz clock from led_clk.v
    input            reset,  // reset
    output reg [7:0] a,      // 8 bit anodes
    output reg [2:0] seq_sel // 3bit sequence selector
    );
	 
	 integer i = 0; // used for counter
	 
	 always @( posedge clk, posedge reset )
	 begin
	 
		if( reset == 1'b1 ) // if reset
		begin
			
			a[7:0]  <= 8'hFF;
			
			seq_sel <= 3'b000; // set seq_sel to 000
				
			i <= 0; // reset i

		end // if
			
		else	
		begin	
			
			// create case statement with 8 cases + default
			case( i % 8 )
				
				1'd0    :
            begin	
				
					// enable anode 0, disable else
					a[0]    <= 1'b0;
					a[7:1]  <= 7'b1111111; 
					
					// set seq_sel to 000
					seq_sel <= 3'b000;
					
					// prevent int size overflow
					i <= 0;
					
				end // 1'd0
					
				1    : 
				begin
				
					// enable anode 1, disable else
					a[1]    <= 1'b0;
					a[0]    <= 1'b1;
					a[7:2]  <= 6'b111111; 
					
					// set seq_sel to 001
					seq_sel <= 3'b001;

				end // 1'd1
					
				2    :
				begin	

					// enable anode 2, disable else
					a[2]    <= 1'b0;
					a[1:0]  <= 2'b11;
					a[7:3]  <= 5'b11111; 
					
					// set seq_sel to 010
					seq_sel <= 3'b010;

				end // 1'd2
					
				3    : 
				begin	

					// enable anode 3, disable else
					a[3]    <= 1'b0;
					a[2:0]  <= 3'b111;
					a[7:4]  <= 4'b1111; 
					
					// set seq_sel to 011
					seq_sel <= 3'b011;

				end // 1'd3
					
				4    :
				begin	

					// enable anode 4, disable else
					a[4]    <= 1'b0;
					a[3:0]  <= 4'b1111;
					a[7:5]  <= 3'b111;
					
					// set seq_sel to 100
					seq_sel <= 3'b100;

				end // 1'd4
					
				5    :
				begin	

					// enable anode 5, disable else
					a[5]    <= 1'b0;
					a[4:0]  <= 5'b11111;
					a[7:6]  <= 2'b11; 
					
					// set seq_sel to 101
					seq_sel <= 3'b101;

				end // 1'd5
					
				6    :
				begin	

					// enable anode 6, disable else
					a[6]    <= 1'b0;
					a[5:0]  <= 6'b111111;
					a[7]    <= 1'b1; 
					
					// set seq_sel to 110
					seq_sel <= 3'b110;

				end // 1'd6
					
				7    :
				begin

					// enable anode 7, disable else
					a[7]    <= 1'b0;
					a[6:0]  <= 7'b1111111; 
						
					// set seq_sel to 111
					seq_sel <= 3'b111;

				end // 1'd7
					
				default :
				begin

					// enable anode 0, disable else
					a[0]    <= 1'b0;
					a[7:1]  <= 7'b1111111; 
					
					// set seq_sel to 000
					seq_sel <= 3'b000;

				end // default
				
			endcase // case
			
			i <= i + 1; // increment i
			
		end // else

	end // always

endmodule
