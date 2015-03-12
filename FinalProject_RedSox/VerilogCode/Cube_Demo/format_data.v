`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Josh Sackos
// 
// Create Date:    07/26/2012
// Module Name:    Format_Data 
// Project Name: 	 PmodACL_Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description: The purpose of this module is to calculate the "g" value of the
//					 the input data.  In this demo the accelerometer is configured for
//					 +/- 2g, this means that the input data must be divided by the LSB
//					 to get the "g" value of the current reading.
//
//					 The calculated/measured "g" value will range from 0.00 to 2.0X. The
//					 calculated "g" value is sent into a binary to BCD converter, and
//					 the BCD data is output for display on the SSD.
//
// Revision History: 
// 						Revision 0.01 - File Created (Josh Sackos)
///////////////////////////////////////////////////////////////////////////////////

//  ===================================================================================
//  								Define Module, Inputs and Outputs
//  ===================================================================================
module Format_Data(
		CLK,
		RST,
		DIN,
		acc_out
);


// ====================================================================================
// 										Port Declarations
// ====================================================================================
   input           CLK;
   input           RST;
   input [9:0]     DIN; //10th bit=sign, rest is magnitude
	output [9:0]	 acc_out;//need sign bit afterall!  //keep it 9-bit, lose the 10th sign bit here.
   
// ====================================================================================
// 								Parameters, Register, and Wires
// ====================================================================================
   
   // Scaled up divisor and scaling factor for "g" calculation to get hundredths place accuracy
   parameter [7:0] DIVISOR = 8'b10100011;//163
   parameter [6:0] SCALING = 7'b1000000;//64
   
   // Signals for scaled division to determine "g" number
   wire [15:0]     tmpDIVIDEND;
   wire [14:0]     quo;
   wire [7:0]      rmd;
   wire            rfd;

//  ===================================================================================
// 							  				Implementation
//  ===================================================================================
   
   // Calculate scaled up dividend 
   assign tmpDIVIDEND = DIN[8:0] * SCALING; //9-bit * 7-bit =16-bit
   
   // Assign input data to binary to BCD converter
   assign acc_out = (DIN[9]==1) ? {1'b1, quo[8:0]}:{1'b0, quo[8:0]};//"g" value, pure magnitude, no sign here
   //MSB=sign, rest is magnitude
	
	
   //------------------------------
   //		 	LSB Division
   //------------------------------
   Div Division(
				.clk(CLK),
				.dividend(tmpDIVIDEND[14:0]), //15-bit
				.divisor(DIVISOR), //8-bit
				.rfd(rfd), 
				.quotient(quo),  //15-bit
				.fractional(rmd) //8-bit
	);
   
endmodule
