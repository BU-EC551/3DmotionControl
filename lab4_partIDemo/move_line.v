`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:00 03/13/2014 
// Design Name: 
// Module Name:    taskOne 
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
module move_line(
    input clk,
	 input switchShape, 
	 input	signed [15:0]	x_axis_in,
    input 				rst,
    output 	[2:0] 	vgaRed,
    output 	[2:0] 	vgaGreen,
    output 	[1:0] 	vgaBlue,
    output 				Hsync,
    output 				Vsync
    );
	 
   // VGA
   wire        vga_clk;
   reg   [2:0] vga_red;
   reg   [2:0] vga_grn;
   reg   [1:0] vga_blu;
   wire [10:0] vga_hcounter;
   wire [10:0] vga_vcounter;
   wire        vga_blank;
	
	// Line drawing
   wire        pixel_on;
	
	wire slowClk; 
	wire signed [15:0] incY; 
	getCoords gc(
		.clk_in(clk),
		.rst_in(rst), 
		.x_axis_in(x_axis_in), ////test here
		.incY(incY),
		.slowClk(slowClk)
   );
	
   // Line drawing module
	draw_lines#( 
      .P_X_COORD_W(16),
      .P_Y_COORD_W(16),
      .P_SCREEN_W(640),
      .P_SCREEN_H(480),
      .P_DATA_W(1),
      .P_LOG2_RAM_DEPTH(19)
      ) lines (
		.i_clk(clk), 
		.i_reset(rst), 
		.i_switchShape(switchShape), 
		.incY(incY), 
		.i_x0(250), 
		.i_x1(400), 
		.i_y0(200+incY), //need 200 +/- incY
		.i_y1(200-incY),//
		.i_clear_buffer(slowClk), 
      .o_waiting(),
		.i_hcounter(vga_hcounter), 
		.i_vcounter(vga_vcounter), 
		.o_pixel_on(pixel_on)
	);
	
  // VGA controller
  clk_divider #(4) vga_clk_div(
      .i_clk(clk),
      .o_clk(vga_clk)
    );

   vga_controller_640_60 vga_controller(
      .pixel_clk(vga_clk),
      .HS(Hsync),
      .VS(Vsync),
      .blank(vga_blank),
      .hcounter(vga_hcounter),
      .vcounter(vga_vcounter)
      );

    always @(vga_blank, pixel_on)
    begin
      if (vga_blank == 0) begin
         if (pixel_on == 1) begin
            vga_red = 3'b000;
            vga_grn = 3'b111;
            vga_blu = 2'b00;
         end else begin
            vga_red = 3'b000;
            vga_grn = 3'b000;
            vga_blu = 2'b00;
         end
      end else begin
         vga_red = 3'b000;
         vga_grn = 3'b000;
         vga_blu = 2'b00;
      end
    end
	
   assign vgaRed   = vga_red;
   assign vgaGreen = vga_grn;
   assign vgaBlue  = vga_blu;



endmodule