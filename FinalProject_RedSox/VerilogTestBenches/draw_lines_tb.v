`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:45:19 03/10/2014
// Design Name:   draw_lines
// Module Name:   D:/Documents/Documents/XilinxProjects/EC551/line_drawing_with_buffer/draw_lines_tb.v
// Project Name:  line_drawing_with_buffer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: draw_lines
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module draw_lines_tb;

	// Inputs
	reg i_clk;
	reg i_reset;
	reg [10:0] i_x0;
	reg [10:0] i_x1;
	reg [10:0] i_y0;
	reg [10:0] i_y1;
	reg i_load_vals;
	reg i_clear_buffer;
	reg [10:0] i_hcounter;
	reg [10:0] i_vcounter;

	// Outputs
	wire o_pixel_on;
   wire o_waiting;

	// Instantiate the Unit Under Test (UUT)
	draw_lines uut (
		.i_clk(i_clk), 
		.i_reset(i_reset), 
		.i_x0(i_x0), 
		.i_x1(i_x1), 
		.i_y0(i_y0), 
		.i_y1(i_y1), 
		//.i_load_vals(i_load_vals), 
		.i_clear_buffer(i_clear_buffer), 
      .o_waiting(o_waiting),
		.i_hcounter(i_hcounter), 
		.i_vcounter(i_vcounter), 
		.o_pixel_on(o_pixel_on)
	);

   initial begin
		i_clk=0;
		forever #5 i_clk=~i_clk;
	end

	initial begin
		// Initialize Inputs
		i_reset = 0;
		i_x0 = 0;
		i_x1 = 0;
		i_y0 = 0;
		i_y1 = 0;
		i_load_vals = 0;
		i_clear_buffer = 0;
		i_hcounter = 0;
		i_vcounter = 0;
        
		// Add stimulus here
      #10 i_reset = 1;
      #10 i_reset = 0;
      #10 i_x0=0; i_x1=3; i_y0=0; i_y1=3;
      #50;
      #10 i_clear_buffer = 1;
      #10 i_clear_buffer = 0;
      #600;
      #10 i_hcounter=0; i_vcounter=0;
      #10 i_hcounter=1; i_vcounter=0;
      #10 i_hcounter=2; i_vcounter=0;
      #10 i_hcounter=3; i_vcounter=0;
      #10 i_hcounter=4; i_vcounter=0;
      #10 i_hcounter=5; i_vcounter=0;
      #10 i_hcounter=0; i_vcounter=1;
      #10 i_hcounter=1; i_vcounter=1;
      #10 i_hcounter=2; i_vcounter=1;
      #10 i_hcounter=3; i_vcounter=1;
      #10 i_hcounter=4; i_vcounter=1;
      #10 i_hcounter=5; i_vcounter=1;
	end
      
endmodule

