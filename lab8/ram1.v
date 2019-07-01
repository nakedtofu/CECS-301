`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:    ram1.v
 * Project:      Lab8
 * Designer:     Blas Arras and Naoaki Takatsu
 * Email:        blas.arras@yahoo.com
 *	              naoakitatkatsu@student.csulb.edu
 * Rev. No.:     Version 1
 * Rev. Date:    Apr 24, 2017
 *
 * Purpose:      This is the random-access-memory(RAM) module. By enabling 
 *               write-enable(we), This module can store 16 bit data(din) which
 *               comes from the 16 slide switches to a specific address(addr)
 *               of size 8 bit. It can also read and output data(dout) from an
 *               address since it's a RAM type data storage.
 *
 ****************************************************************************/

module ram1(
    input clk,
    input we,
    input [7:0] addr,
    input [15:0] din,
    input [15:0] dout
    );
//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
ram1 your_instance_name (
  .clka(clka), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [7 : 0] addra
  .dina(dina), // input [15 : 0] dina
  .douta(douta) // output [15 : 0] douta
);
// INST_TAG_END ------ End INSTANTIATION Template ---------


endmodule
