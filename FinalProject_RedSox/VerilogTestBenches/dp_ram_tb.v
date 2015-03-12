`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:35 03/04/2014
// Design Name:   dp_ram
// Module Name:   D:/Documents/Documents/XilinxProjects/EC551/VGA_buffer_testing/dp_ram_tb.v
// Project Name:  VGA_buffer_testing
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dp_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dp_ram_tb;

	// Inputs
	reg i_a_clk;
	reg i_a_wr;
	reg [3:0] i_a_addr;
	reg [6:0] i_a_data;
	reg i_b_clk;
	reg i_b_wr;
	reg [3:0] i_b_addr;
	reg [6:0] i_b_data;

	// Outputs
	wire [6:0] o_a_data;
	wire [6:0] o_b_data;

	// Instantiate the Unit Under Test (UUT)
	dp_ram #(.P_DATA_W(7), .P_LOG2_RAM_DEPTH(4)) uut (
		.i_a_clk(i_a_clk), 
		.i_a_wr(i_a_wr), 
		.i_a_addr(i_a_addr), 
		.i_a_data(i_a_data), 
		.o_a_data(o_a_data), 
		.i_b_clk(i_b_clk), 
		.i_b_wr(i_b_wr), 
		.i_b_addr(i_b_addr), 
		.i_b_data(i_b_data), 
		.o_b_data(o_b_data)
	);

   initial begin
		i_a_clk=0;
		forever #5 i_a_clk=~i_a_clk;
	end

   initial begin
		i_b_clk=0;
		forever #5 i_b_clk=~i_b_clk;
	end

	initial begin
		// Initialize Inputs
		//i_a_clk = 0;
		i_a_wr = 0;
		i_a_addr = 0;
		i_a_data = 0;
		//i_b_clk = 0;
		i_b_wr = 0;
		i_b_addr = 0;
		i_b_data = 0;
        
		// Add stimulus here
      #10 i_a_data = 5;
      #10 i_a_wr = 1;
      #10 i_a_wr = 0;
      

	end
      
endmodule

