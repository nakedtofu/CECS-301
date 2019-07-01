`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  ALUTB.v
 * Project:    lab6
 * Designer:   Blas Arras and Naoaki Takatsu
 * Email:      blas.arras@yahoo.com
 *	            naoakitatkatsu@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  04/09/2017
 *
 * Purpose:    This is the ALU test bench to exhaustively test the module
 *					with various non zero inputs.
 *         
 * Notes:      This module will place the ALU module under test with various
 *					non zero numbers. The module will first create the module, 
 *					then it will process various functions by inputting various
 *				   4 bit symbols through the Alu_Op. It will run each process 
 *					twice with different 16 bit signals running through the
 *					R and S inputs. It will then pass 38 ns. The default case
 *					will take care of any other case.
 *
 ****************************************************************************/
module ALUTB;

	// Inputs
	reg [15:0] R;
	reg [15:0] S;
	reg [3:0] Alu_Op;

	// Outputs
	wire [15:0] Y;
	wire N;
	wire Z;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	alu16 uut (
		.R(R), 
		.S(S), 
		.Alu_Op(Alu_Op), 
		.Y(Y), 
		.N(N), 
		.Z(Z), 
		.C(C)
	);
		
	initial begin
		//Function: 0 (PASS S) 
		R = 16'h1234;  S = 16'h5555; //Output: 5555
		Alu_Op = 4'b0000; //Z= 0, N= 0, C=0
		#38;
		R = 16'hAAAA;  S = 16'h5678; //Output: 5678
		Alu_Op = 4'b0000;	//Z= 0, N= 0, C=0
		#38;
		
		//Function: 1 (PASS R)
		R = 16'h9645;  S = 16'hBCAF; //Output: 9645
		Alu_Op = 4'b0001; //Z= 0, N= 1, C=0
		#38;
		R = 16'h9ABC;  S = 16'h6342; //Output: 9ABC
		Alu_Op = 4'b0001; //Z= 0, N= 1, C=0
		#38;
		
		//Function: 2 (INCREMENT S)
		R = 16'hAF23;  S = 16'h32FC; //Output: 32FD
		Alu_Op = 4'b0010; //Z= 0, N= 0, C=0
		#38;
		R = 16'h924B;  S = 16'h6C43; //Output: 6C44
		Alu_Op = 4'b0010; //Z= 0, N= 0, C=0
		#38;
		
		//Function: 3 (DECREMENT S)
		R = 16'hADC2;  S = 16'hF235; //Output: F234
		Alu_Op = 4'b0011; //Z= 0, N= 1, C=0
		#38;
		R = 16'h62DC;  S = 16'h5DC2; //Output: 5DC1
		Alu_Op = 4'b0011; //Z= 0, N= 0, C=0
		#38;
		
		//Function: 4 (ADD)
		R = 16'h53DC;  S = 16'h23CA; //Output: 77A6
		Alu_Op = 4'b0100; //Z= 0, N= 0, C=0
		#38;
		R = 16'hBC45;  S = 16'h86AB; //Output: 42F0 
		Alu_Op = 4'b0100; //Z= 0, N= 0, C=1
		#38;
		
		//Function: 5 (SUBTRACT)
		R = 16'h7E23;  S = 16'h3FCA; //Output: 3E59
		Alu_Op = 4'b0101; //Z= 0, N= 0, C=0
		#38;
		R = 16'hBD53;  S = 16'h5555; //Output: 67FE
		Alu_Op = 4'b0101; //Z= 0, N= 0, C=0
		#38;
		
		//Function: 6 (RIGHT SHIFT S)
		R = 16'h5353;  S = 16'hDCCE; //Output: 6E67
		Alu_Op = 4'b0110; //Z= 0, N= 0, C=0
		#38;
		R = 16'hBBBB;  S = 16'h1111; //Output: 0888
		Alu_Op = 4'b0110; //Z= 0, N= 0, C=1
		#38;
		
		//Function: 7 (LEFT SHIFT S)
		R = 16'hBA85;  S = 16'h3D52; //Output: 7AA4
		Alu_Op = 4'b0111; //Z= 0, N= 0, C=0
		#38;
		R = 16'hEF23;  S = 16'h8B72; //Output: 16E4
		Alu_Op = 4'b0111; //Z= 0, N= 0, C=1
		#38; 
		
		//Function: 8 (LOGIC AND)
		R = 16'hC314;  S = 16'hD031; //Output: C010
		Alu_Op = 4'b1000; //Z= 0, N= 1, C=0
		#38;
		R = 16'hDDDD;  S = 16'h6666; //Output: 4444
		Alu_Op = 4'b1000; //Z= 0, N= 0, C=0
		#38;
		
		//Function: 9 (LOGIC OR)
		R = 16'h7777;  S = 16'hEABD; //Output: FFFF
		Alu_Op = 4'b1001; //Z= 0, N= 1, C=0
		#38;
		R = 16'hBDC9;  S = 16'h5555; //Output: FDDD
		Alu_Op = 4'b1001; //Z= 0, N= 1, C=0
		#38; 
		
		//Function: 10 (LOGIC XOR)
		R = 16'h0000;  S = 16'hBDCA; //Output: BDCA
		Alu_Op = 4'b1010; //Z= 0, N= 1, C=0
		#38;
		R = 16'h7171;  S = 16'h6363; //Output: 1212
		Alu_Op = 4'b1010; //Z= 0, N= 0, C=0
		#38;
		
		//Function: 11 (LOGIC NOT S (1'S COMP))
		R = 16'hEFEF;  S = 16'h43DA; //Output: BC25
		Alu_Op = 4'b1011; //Z= 0, N= 1, C=0
		#38;
		R = 16'h65AD;  S = 16'h9999; //Output: 6666
		Alu_Op = 4'b1011; //Z= 0, N= 0, C=0
		#38;
		
		//Function: 12 (NEGATE S (2'S COMP))
		R = 16'h642D;  S = 16'hDF52; //Output: 20AE
		Alu_Op = 4'b1100; //Z= 0, N= 0, C=1
		#38;
		R = 16'hF3DA;  S = 16'h3210; //Output: CDF0
		Alu_Op = 4'b1100; //Z= 0, N= 1, C=1
	end
      
endmodule

