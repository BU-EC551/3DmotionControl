`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:43:58 03/16/2014
// Design Name:   fifo
// Module Name:   D:/Documents/Documents/XilinxProjects/EC551/line_drawing_with_buffer/fifo_tb.v
// Project Name:  line_drawing_with_buffer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fifo_tb;

	// Inputs
	reg i_clk;
	reg i_reset;
	reg [10:0] i_data;
	reg i_read;
	reg i_write;

	// Outputs
	wire [10:0] o_data;
	wire o_empty;
	wire o_full;

	// Instantiate the Unit Under Test (UUT)
	fifo uut (
		.i_clk(i_clk), 
		.i_reset(i_reset), 
		.i_data(i_data), 
		.i_read(i_read), 
		.i_write(i_write), 
		.o_data(o_data), 
		.o_empty(o_empty), 
		.o_full(o_full)
	);

   initial begin
		i_clk=0;
		forever #5 i_clk=~i_clk;
	end

	initial begin
		// Initialize Inputs
		i_reset = 0;
		i_data = 0;
		i_read = 0;
		i_write = 0;
      
      #10 i_reset=1;
      #10 i_reset=0;
      
		// Add stimulus here
      #10 i_data = 1;
      #10 i_write = 1;
      //#10 i_write = 0;
      #10 i_data = 2;
      //#10 i_write = 1;
      //#10 i_write = 0;      
      #10 i_data = 3;
      //#10 i_write = 1;
      //#10 i_write = 0;
      #10 i_data = 4;
      //#10 i_write = 1;
      #10 i_write = 0;      
      
      #10 i_read = 1;
      #40 i_read = 0;
	end
      
endmodule

