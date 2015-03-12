`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Andrew Skreen
// 
// Create Date:    07/11/2012
// Module Name:    data_controller
// Project Name: 	 PmodGYRO_Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description: Converts data from binary to either HEX or BCD format.
//
// Revision History: 
// 						Revision 0.01 - File Created (Andrew Skreen)
//							Revision 1.00 - Added Comments and Converted to Verilog (Josh Sackos)
//////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================
// 										  Define Module
// ==============================================================================
module data_controller(
		clk,// In
		rst,// In
		data,// In
		D1,// Output digit here
		D2,// Out
		D3,// Out
		D4// Out
);

// ==============================================================================
// 									   Port Declarations
// ==============================================================================
			input			 clk;
			input			 rst;
			input [15:0] data;//x/y/z_final //when test acc: six 0, one sign, nine magnitude bits. 
			
			output [3:0] D1;
			output [3:0] D2;
			output [3:0] D3;
			output [3:0] D4;
   
// ==============================================================================
// 						     Parameters, Registers, and Wires
// ==============================================================================
			wire [19:0]  bcd_buf;

// ==============================================================================
// 										Implementation
// ==============================================================================

			
			bcd_decoder binary2bcd(
					.i_hex(data[15:0]),// x/y/z_Final output of degree in binary, 360 maximum
					.o_bcd(bcd_buf)// 
			);
			
			assign D1 =  bcd_buf[15:12];
			
			assign D2 =  bcd_buf[11:8];//
			
			assign D3 =  bcd_buf[7:4];//  
			
			assign D4 =  bcd_buf[3:0];//   
			

   
endmodule
