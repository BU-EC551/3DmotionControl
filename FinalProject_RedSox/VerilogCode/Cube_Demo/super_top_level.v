`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:22 04/28/2014 
// Design Name: 
// Module Name:    super_top_level 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module super_top_level(
		input clk,
    input btns,
    input btnu,
    input btnl,
    input btnd,
    input btnr,
	  input rst,
	 input [3:0] sw,
	 input SDI,
    output [7:0] Led,
    output [2:0] vgaRed,
    output [2:0] vgaGreen,
    output [2:1] vgaBlue,
    output Hsync,
    output Vsync,
	  output SDO,SS,SCLK,
    output [15:0] x_final, y_final, z_final,
    output [3:0] an,
    output [6:0] seg,	 
    inout [3:0] JA, 
	 output [7:0] toLEDs
    );
	 
	 
	 wire [9:0] w_feed_x, w_feed_y, w_feed_z;
	 
 top_level degreeFeed(
			.JA(JA),
			.SDI(SDI),
			.SDO(SDO),
			.SS(SS),
			.SCLK(SCLK),
			.x_final(x_final),
			.y_final(y_final),
			.z_final(z_final),
			.clk(clk),
			.rst(rst),
			.sw(sw),
			.an(an),
			.seg(seg)
	 );



	draw_lines_top drawLine ( 
	 .clk(clk),
    .btns(btns),
    .btnu(btnu),
    .btnl(btnl),
    .btnd(btnd),
    .btnr(btnr),
	 .x_feed(x_final),
	 .y_feed(y_final),
	 .z_feed(z_final),
    .Led(Led),
    .vgaRed(vgaRed),
    .vgaGreen(vgaGreen),
    .vgaBlue(vgaBlue),
    .Hsync(Hsync),
    .Vsync(Vsync),
	 .toLEDs(toLEDs)
	 );
		
		
		
		
	 


endmodule
