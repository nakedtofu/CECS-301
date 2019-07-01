`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Author:         Naoaki Takatsu
// E-mail:         naoakitakatsu@student.csulb.edu
// Create Date:    04:42:42 02/20/2017 
// Version:        1.0 
// File Name:      sequence_detetor.v
// Description:    This is a sequence detecting module which detects input values
//                 sequentially. The data is loaded to X sequentially. By switching 
//                 M to 0, you can detect for a moore signal and by switching M to
//                 1 you can detect for a mealy signal. The Q represents the state
//                 and Z represents the output of the state machine.
//                 
//
//////////////////////////////////////////////////////////////////////////////////
module sequence_detector(
    input clk, //clock
    input reset, //reset
    input X, //input data
    input M, //moore/mealy switch
    output Z, //output data
    output [2:0] Q //state
    );

wire moore_Z, mealy_Z;
//wire for mealy and moore output

wire [2:0] moore_d, moore_Q, mealy_d, mealy_Q;
//wire for mealy and moore present/next state

//******************************************************
// Moore Sequence Detector for a serial input sequence
//******************************************************

//***** Next State Combinational Logic ********
assign moore_d[0] = ((~moore_Q[2] & ~moore_Q[1] &  X) | 
                     (~moore_Q[2] & ~moore_Q[0] &  X) | 
						   ( moore_Q[2] & ~moore_Q[1] & ~moore_Q[0]));
//***** SOP expressions based upon mooreQ[2:0] and X (p.s. and inputs)

assign moore_d[1] = ((~moore_Q[2] &  moore_Q[1] & ~moore_Q[0] &  X) |
                     (~moore_Q[2] &  moore_Q[0] & ~X) | 
						   ( moore_Q[2] &  moore_Q[0] &  X) |
							( moore_Q[2] &  moore_Q[1] & ~X));
//***** SOP expressions based upon mooreQ[2:0] and X

assign moore_d[2] = (( moore_Q[2] &  moore_Q[0] &  X) | 
                     ( moore_Q[2] & ~moore_Q[1] & ~Q[0] & ~X) |
                     ( moore_Q[1] &  moore_Q[0] &  X) |
							( moore_Q[2] &  moore_Q[1] &  X));
//***** SOP expressions based upon mooreQ[2:0] and X

//***** State Register Using D-FF instances ******
register_module moore_q0 (clk, reset, moore_d[0], moore_Q[0]),
//register_module mooreQ[0]

moore_q1 (clk, reset, moore_d[1], moore_Q[1]),
//mooreQ[1]

moore_q2 (clk, reset, moore_d[2], moore_Q[2]);
//mooreQ[2]

//***** Output Combinational Logic ********
assign moore_Z = (moore_Q[2] & moore_Q[1]);
//***** SOP expressions based upon mooreQ[2:0] only

//******************************************************
// Mealy Sequence Detector for a serial input sequence
//******************************************************

//***** Next State Combinational Logic ********
assign mealy_d[0] = ((~mealy_Q[2] & ~mealy_Q[1] &  X) |
                     (~mealy_Q[0] &  X) |
						   ( mealy_Q[2] & ~mealy_Q[0]) |
							( mealy_Q[2] & X));
//***** SOP expressions based upon mealyQ[2:0] and X (p.s. and inputs)

assign mealy_d[1] = (( mealy_Q[1] & ~mealy_Q[0] &  X) | 
                     ( mealy_Q[2] &  mealy_Q[0] &  X) |
							(~mealy_Q[2] &  mealy_Q[0] & ~X));
//***** SOP expressions based upon mealyQ[2:0] and X

assign mealy_d[2] = (( mealy_Q[2] & ~mealy_Q[0] & ~X) |
                     ( mealy_Q[1] &  mealy_Q[0] &  X));
//***** SOP expressions based upon mealyQ[2:0] and X

//***** State Register Using D-FF instances ******
register_module mealy_q0 (clk, reset, mealy_d[0], mealy_Q[0]),
//mealyQ[0]

mealy_q1 (clk, reset, mealy_d[1], mealy_Q[1]),
//mealyQ[1]

mealy_q2 (clk, reset, mealy_d[2], mealy_Q[2]);
//mealyQ[2]

//***** Output Combinational Logic ********
assign mealy_Z = (mealy_Q[2] & mealy_Q[0] & X);
//***** SOP expressions based upon mealyQ[2:0] and X (p.s. and inputs)

//*****************************************************************************
// 2-to-1 mux to choose Moore/Mealy Q's and Moore/Mealy Z for global outputs
// if M==0 then {Q, Z} = {mooreQ, moore_Z} else {Q, Z} = {mealyQ, mealy_Z}
//*****************************************************************************
assign {Q, Z} = (~M) ? {moore_Q, moore_Z} : {mealy_Q, mealy_Z};

endmodule
