`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:42:46 02/23/2014
// Design Name:   clk_divider
// Module Name:   D:/Documents/Documents/XilinxProjects/EC551/lab2/clk_divider_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_divider_tb;

	// Inputs
	reg i_clk;

	// Outputs
	wire o_clk;

	// Instantiate the Unit Under Test (UUT)
	clk_divider uut (
		.i_clk(i_clk), 
		.o_clk(o_clk)
	);

   initial 
      i_clk = 0;
      always #5 i_clk = ~i_clk;

	initial begin
		// Initialize Inputs
		i_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

