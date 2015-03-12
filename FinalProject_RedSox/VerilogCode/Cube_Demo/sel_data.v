`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Josh Sackos
// 
// Create Date:    07/26/2012
// Module Name:    selData
// Project Name: 	 PmodACL_Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description: This module converts axis data from 2's compliment to its magnitude
//					 representation.  Based upon the input switches SW(1) and SW(0) either
//					 the x-axis, y-axis, or z-axis data will be output on the DOUT output.
//
// Revision History: 
// 						Revision 0.01 - File Created (Josh Sackos)
///////////////////////////////////////////////////////////////////////////////////////////

// ====================================================================================
// 										  Define Module
// ====================================================================================
module sel_Data(
		CLK,
		RST,
//		SW,
		xAxis,
		yAxis,
		zAxis,
		DOUT_x,
		DOUT_y,
		DOUT_z
);

// ====================================================================================
// 										Port Declarations
// ====================================================================================
   input        CLK;
   input        RST;
   input [9:0]  xAxis;
   input [9:0]  yAxis;
   input [9:0]  zAxis;
   output [9:0] DOUT_x;
	output [9:0] DOUT_y;
	output [9:0] DOUT_z;
   
	
// ====================================================================================
// 								Parameters, Register, and Wires
// ====================================================================================
   reg [9:0]    DOUT_x;
	reg [9:0]    DOUT_y;
	reg [9:0]    DOUT_z;
   
//  ===================================================================================
// 							  				Implementation
//  ===================================================================================

		//-----------------------------------------------
		//	Select Display Data and Convert to Magnitude
		//-----------------------------------------------
		always @(posedge CLK )
			begin
						DOUT_x <= (xAxis[9]==1'b1)?({xAxis[9], ((~xAxis[8:0])+1'b1)}):xAxis;
						DOUT_y <= (yAxis[9]==1'b1)?({yAxis[9], ((~yAxis[8:0])+1'b1)}):yAxis;
						DOUT_z <= (zAxis[9]==1'b1)?({zAxis[9], ((~zAxis[8:0])+1'b1)}):zAxis;
			end
		
endmodule

