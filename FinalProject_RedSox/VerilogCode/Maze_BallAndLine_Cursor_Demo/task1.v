`timescale 1ns / 1ps
module task1(
	input					clk,
	input					rst,
	input					switchShape, 
	input					sel, 			// Switch- 0 = circle drawing; 1 = ball on line drawing; 
   input 	[15:0]  	xAxis_gyro,	// x-axis data from PmodGyro
   input 	[15:0] 	yAxis_gyro,	// y-axis data from PmodGyro
   input 	[15:0]	zAxis_gyro,	// z-axis data from PmodGyro
	input 	[9:0] 	xAxis_acl,		// x-axis data from PmodACL
   input 	[9:0] 	yAxis_acl,		// y-axis data from PmodACL
   input 	[9:0] 	zAxis_acl,		// z-axis data from PmodACL
	output 	[2:0] 	red,
	output 	[2:0] 	green,
   output 	[1:0] 	blue,
   output 				hsync,
   output 				vsync
	);
	
	wire        vga_clk;
	wire [10:0] vga_hcounter;
   wire [10:0] vga_vcounter;
   wire        vga_blank;

	// VGA controller
	clk_divider #(4) vga_clk_div(
		.i_clk(clk),
		.o_clk(vga_clk)
	);

	vga_controller_640_60 vga_controller(
		.pixel_clk(vga_clk),
		.HS(hsync),
		.VS(vsync),
		.blank(vga_blank),
		.hcounter(vga_hcounter),
		.vcounter(vga_vcounter)
	);
	 
	wire [2:0] 	lineVgaRed, lineVgaGreen;
	wire [1:0] 	lineVgaBlue;
	wire 			lineHsync, lineVsync; 
		move_line moveLine(
		.clk(clk), 
		.x_axis_in(xAxis_gyro), 
		.rst(rst), 
		.vga_blank(vga_blank),
		.vga_hcounter(vga_hcounter),
		.vga_vcounter(vga_vcounter),
		.switchShape(switchShape), 
		.vgaRed(lineVgaRed), 
		.vgaGreen(lineVgaGreen),
		.vgaBlue(lineVgaBlue), 
		.Hsync(lineHsync), 
		.Vsync(lineVsync)
	); 

	wire [2:0] 	circleVgaRed, circleVgaGreen;
	wire [1:0] 	circleVgaBlue;
	wire 			circleHsync, circleVsync;	
	move_circle moveCircle(
				.CLK(clk), 
				.RST(rst), 
				.xAxisG(xAxis_acl), 
				.yAxisG(yAxis_acl), 
				.vga_blank(vga_blank),
				.vga_hcounter(vga_hcounter),
				.vga_vcounter(vga_vcounter),
				.vgaRed(circleVgaRed),
				.vgaGreen(circleVgaGreen),
				.vgaBlue(circleVgaBlue),
				.Hsync(circleHsync),
				.Vsync(circleVsync)
	);
	
	assign red = sel == 1'b0 ? circleVgaRed : lineVgaRed;
	assign green = sel == 1'b0 ? circleVgaGreen : lineVgaGreen;
	assign blue = sel == 1'b0 ? circleVgaBlue : lineVgaBlue;
	//assign hsync = sel == 1'b0 ? circleHsync : lineHsync;
	//assign vsync = sel == 1'b0 ? circleVsync : lineVsync;

endmodule