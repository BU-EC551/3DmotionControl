`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Andrew Skreen
// 
// Create Date:    08/16/2011
// Module Name:    display_controller
// Project Name: 	 PmodGYRO_Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description: This module formats all data received from the PmodGYRO and
//					 displays it on the seven segment display (SSD).
//
// Revision History: 
// 						Revision 0.01 - File Created (Andrew Skreen)
//							Revision 1.00 - Added Comments and Converted to Verilog (Josh Sackos)
///////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================
// 										  Define Module
// ==============================================================================
module display_controller(
		clk,
		rst,
		sel,
		x_axis,
		y_axis,
		z_axis,
		an,
		seg
);

// ==============================================================================
// 										Port Declarations
// ==============================================================================
   input        clk;
   input        rst;
   input [1:0]  sel;
   input [15:0] x_axis;
   input [15:0] y_axis;
   input [15:0] z_axis;
   output [3:0] an;
   output [6:0] seg;
   

// ==============================================================================
// 							Parameters, Registers, and Wires
// ==============================================================================   
   wire [1:0]   control;
   wire         dclk;
   wire [3:0]   D1;
   wire [3:0]   D2;
   wire [3:0]   D3;
   wire [3:0]   D4;
   wire [3:0]   digit;
   wire [15:0]  data;
	wire [3:0]	 anodes;
	wire [3:0]	 an;

// ==============================================================================
// 										Implementation
// ==============================================================================

			//---------------------------------------------------
			// 		Formats data received from PmodGYRO
			//---------------------------------------------------
			data_controller C0(
						.clk(clk),
						.rst(rst),
						.data(data),
						.D1(D1),
						.D2(D2),
						.D3(D3),
						.D4(D4)
			);
			
			
			//---------------------------------------------------
			// 		  Clock for display components
			//---------------------------------------------------
			display_clk C1(
						.clk(clk),
						.RST(rst),
						.dclk(dclk)
			);
			
			
			//---------------------------------------------------
			// Produces anode pattern to illuminate digit on SSD
			//---------------------------------------------------
			anode_decoder C2(
						.anode(anodes),
						.control(control)
			);
			
			
			//---------------------------------------------------
			// Produces cathode pattern to dipslay digits on SSD
			//---------------------------------------------------
			seven_seg_decoder C3(
						.num_in(digit),
						.control(control),
						.seg_out(seg)
			);
			
			
			//---------------------------------------------------
			//			    Provides select/control signal
			//---------------------------------------------------
			two_bit_counter C4(
						.dclk(dclk),
						.rst(rst),
						.control(control)
			);
			
			
			//---------------------------------------------------
			// 			         Digit data mux
			//---------------------------------------------------
			digit_select C5(
						.d1(D1),
						.d2(D2),
						.d3(D3),
						.d4(D4),
						.control(control),
						.digit(digit)
			);
			
			

			//---------------------------------------------------
			//    Select temperature or axis data to display
			//---------------------------------------------------
			data_select C7(
						.x_axis(x_axis),
						.y_axis(y_axis),
						.z_axis(z_axis),
						.sel(sel),
						.data(data)
			);

			assign an = (rst == 1'b1) ? 4'b1111 : anodes;

endmodule
