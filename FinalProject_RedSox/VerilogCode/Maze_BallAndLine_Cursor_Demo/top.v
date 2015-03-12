`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Andrew Skreen
// 
// Create Date:    08/16/2011
// Module Name:    PmodGYRO_Demo
// Project Name: 	 PmodGYRO_Demo
// Target Devices: Nexys3
// Tool versions:  ISE 14.1
// Description: This demo configures the PmodGYRO to output data at a rate of 100 Hz
// 				 with 8.75 mdps/digit at 250 dps maximum.  SPI mode 3 is used for data
//					 communication with the PmodGYRO.
//
//					 Switches SW3 and SW2 are used to select temperature or axis data that is 
//					 to be displayed on the seven segment display (SSD).  For details about
//					 selecting data see below.
//
//						SW3  |  SW2  |  Display Data
//						----------------------------
//						 0   |   0   |  X axis data
//						 0	  |   1   |  Y axis data
//						 1   |   0   |  Z axis data
//						 1   |   1   |  Temperature
//
//  Inputs:
//		clk 						Base system clock of 100 MHz
//		sw[0]						Reset signal
//		sw[1] 					start tied to external user input
//		sw[2]						Data select bit 0
//		sw[3]						Data select bit 1
//		sw[4]						Select hex display or decimal display
//		JA[2] 					Master in slave out (MISO)
//		
//  Outputs:
//		JA[0]						Slave select (SS)
//		JA[1]						Master out slave in (MOSI)
//		JA[3]						Serial clock (SCLK)
//		seg						Cathodes on SSD
//		dp							Decimal on SSD
//		an							Anodes on SSD
//
// Revision History: 
// 						Revision 0.01 - File Created (Andrew Skreen)
//							Revision 1.00 - Added Comments and Converted to Verilog (Josh Sackos)
//////////////////////////////////////////////////////////////////////////////////////////

// ==============================================================================
// 										  Define Module
// ==============================================================================
module top(
		sw,
		chooseDemo,
		choosePart1Mode,
		clk,
		switchShape, 
		mazeMode,
		an,
		seg,
		dp,
		JA,
		JB, 
		hsync, 
		vsync, 
		red, 
		green, 
		blue
);

// ==============================================================================
// 										Port Declarations
// ==============================================================================
   input [4:0]  sw;
   input        clk;
   output [3:0] an;
   output [6:0] seg;
   output       dp;
   inout [3:0]  JA;
	inout [3:0]  JB;
	input 	    choosePart1Mode; // To switch between Part 1 Modes (Ball on line vs moving cursor) 	
	input 		 switchShape; // To switch shapes of object on line 
	input			 mazeMode; // To switch maze mode of 2D Maze 
	input 		 chooseDemo; 
	
	// VGA outputs 
	output wire hsync;		//horizontal sync out
	output wire vsync;		//vertical sync out
	output wire [2:0] red;	//red vga output
	output wire [2:0] green; //green vga output
	output wire [1:0] blue;	//blue vga output
   
// ==============================================================================
// 							  Parameters, Registers, and Wires
// ==============================================================================   
	wire [15:0]  xAxis_gyro;	// x-axis data from PmodGyro
   wire [15:0]  yAxis_gyro;	// y-axis data from PmodGyro
   wire [15:0]  zAxis_gyro;	// z-axis data from PmodGyro
	wire [9:0]   xAxis_acl;		// x-axis data from PmodACL
   wire [9:0]   yAxis_acl;		// y-axis data from PmodACL
   wire [9:0]   zAxis_acl;		// z-axis data from PmodACL
	
	wire slaveSelect;
   
// ==============================================================================
// 							  		   Implementation
// ==============================================================================      
			
			GYRO_Interface gyro_interface(
						.clk(clk),
						.rst(sw[0]),
						.start(sw[1]),
						.x_axis_data(xAxis_gyro),
						.y_axis_data(yAxis_gyro),
						.z_axis_data(zAxis_gyro),
						.miso(JA[2]),
						.mosi(JA[1]),
						.sclk(JA[3]),
						.slaveSelect(slaveSelect)
			);
			
			ACL_Interface acl_interface(
					.CLK(clk),
					.RST(sw[0]),
					.SDI(JB[2]),
					.SDO(JB[1]),
					.SCLK(JB[3]),
					.SS(JB[0]),
					.xAxis(xAxis_acl),
					.yAxis(yAxis_acl),
					.zAxis(zAxis_acl)
			);

			//--------------------------------------
			//		      Display Controller
			//--------------------------------------
			display_controller disp(
						.clk(clk),
						.rst(sw[0]),
						.sel(sw[3:2]),
						.temp_data(),
						//.x_axis(xAxis_gyro[15:0]),
						.x_axis({6'b000000, xAxis_acl}),
						//.y_axis(yAxis_gyro[15:0]),
						.y_axis({6'b000000, yAxis_acl}),
						//.z_axis(zAxis_gyro[15:0]),
						.z_axis({6'b000000, zAxis_acl}),
						.dp(dp),
						.an(an),
						.seg(seg),
						.display_sel(sw[4])
			);
			
			//--------------------------------------
			//		      Task 1: Line drawing corresponding to gyro output 
			//--------------------------------------		
			wire hsync_t1; 
			wire vsync_t1; 
			wire [2:0] red_t1;
			wire [2:0] green_t1;
			wire [1:0] blue_t1; 
			task1 t1 (
						.clk(clk),
						.rst(sw[0]),
						.switchShape(switchShape), 
						.sel(choosePart1Mode), 
						.xAxis_gyro(xAxis_gyro),
						.yAxis_gyro(yAxis_gyro),
						.zAxis_gyro(zAxis_gyro),
						.xAxis_acl(xAxis_acl),
						.yAxis_acl(yAxis_acl),
						.zAxis_acl(zAxis_acl),
						.red(red_t1),
						.green(green_t1),
						.blue(blue_t1),
						.hsync(hsync_t1),
						.vsync(vsync_t1)
			);
			
			wire hsync_t3; 
			wire vsync_t3; 
			wire [2:0] red_t3;
			wire [2:0] green_t3;
			wire [1:0] blue_t3; 
			task3 t3(
					.clk(clk),
					.rst(sw[0]), 
					.HS(hsync_t3),
					.VS(vsync_t3),
					.red(red_t3),
					.green(green_t3),
					.blue(blue_t3),
					.btns(),
					.btnu(),
					.btnl(),
					.btnr(),
					.btnd(),
					.mode(mazeMode), 
					.xAxis(xAxis_acl),
					.yAxis(yAxis_acl),
					.zAxis(zAxis_acl)
			);
			
			assign hsync = chooseDemo ? hsync_t3 : hsync_t1; 
			assign vsync = chooseDemo ? vsync_t3 : vsync_t1; 
			assign red = chooseDemo ? red_t3 : red_t1; 
			assign green = chooseDemo ? green_t3 : green_t1; 
			assign blue = chooseDemo ? blue_t3 : blue_t1; 

			//  Assign slave select output
			assign JA[0] = slaveSelect;
   
endmodule
