`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:21 03/01/2014
// Design Name:   bresenham
// Module Name:   D:/Documents/Documents/XilinxProjects/EC551/line_drawing/bresenham_tb.v
// Project Name:  line_drawing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bresenham
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bresenham_tb;

   function integer log2;
      input [31:0] value;
      begin
	 value = value-1;
	 for (log2=0; value>0; log2=log2+1)
	   value = value>>1;
      end
   endfunction

   localparam P_PERIOD = 10;
   localparam P_MAX_LINE_LENGTH = 10;
   localparam P_X_COORD_W = 11;
   localparam P_Y_COORD_W = 11;

	// Inputs
	reg i_clk;
	reg i_reset;
	reg [P_X_COORD_W-1:0] i_x0;
	reg [P_X_COORD_W-1:0] i_x1;
	reg [P_Y_COORD_W-1:0] i_y0;
	reg [P_Y_COORD_W-1:0] i_y1;
	reg i_load_vals;

	// Outputs
	wire [P_X_COORD_W-1:0] o_x_val;//[P_MAX_LINE_LENGTH*P_X_COORD_W-1:0] o_x_vals;
	wire [P_Y_COORD_W-1:0] o_y_val;//[P_MAX_LINE_LENGTH*P_Y_COORD_W-1:0] o_y_vals;
	wire [P_MAX_LINE_LENGTH-1:0] o_vals_valid;
   wire [log2(P_MAX_LINE_LENGTH)-1:0] o_vals_counter;
	wire o_vals_rdy;
   wire o_waiting;

	// Instantiate the Unit Under Test (UUT)
	bresenham uut (
		.i_clk(i_clk), 
		.i_reset(i_reset), 
		.i_x0(i_x0), 
		.i_x1(i_x1), 
		.i_y0(i_y0), 
		.i_y1(i_y1), 
		.i_load_vals(i_load_vals), 
		//.o_x_vals(o_x_vals), 
		//.o_y_vals(o_y_vals), 
      .o_x_val(o_x_val),
      .o_y_val(o_y_val),
		.o_vals_valid(o_vals_valid), 
      .o_vals_counter(o_vals_counter),
		.o_vals_rdy(o_vals_rdy),
      .o_waiting(o_waiting)
	);

   initial begin
		i_clk=0;
		forever #(P_PERIOD/2) i_clk=~i_clk;
	end


	initial begin
		// Initialize Inputs
		//i_clk = 0;
		i_reset = 0;
		i_x0 = 0;
		i_x1 = 0;
		i_y0 = 0;
		i_y1 = 0;
		i_load_vals = 0;

        
		// Add stimulus here
      #10 i_reset = 1;
      #10 i_reset = 0;
      
      #10 i_x0=5; i_y0=5;
      #10 i_x1=0; i_y1=0;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=10; i_y1=0;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=0; i_y1=10;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=10; i_y1=10;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=3; i_y1=0;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=8; i_y1=0;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=10; i_y1=3;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=10; i_y1=8;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=8; i_y1=10;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      #100 i_x1=3; i_y1=10;

      #20 i_load_vals = 1;
      #10 i_load_vals = 0;

      
      
      /*
      #10 i_x1=5; i_y1=5;
      
      #20 i_load_vals = 1;
      #10 i_load_vals = 0;
      
      #100 i_x1=7; i_y1=2;
      #20 i_load_vals = 1;
      #10 i_load_vals = 0;
      
      #100 i_x1=3; i_y1=8;
      #20 i_load_vals = 1;
      #10 i_load_vals = 0;
      
      #100 i_x0=2; i_y0=6; i_x1=9; i_y1=1;
      #20 i_load_vals = 1;
      #10 i_load_vals = 0;
      
      #100 i_x0=2; i_y0=6; i_x1=4; i_y1=1;
      #20 i_load_vals = 1;
      #10 i_load_vals = 0;
      */

	end
      
endmodule

