`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:33:06 02/21/2014
// Design Name:   level_to_pulse
// Module Name:   D:/Documents/Documents/XilinxProjects/EC551/lab2/level_to_pulse_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: level_to_pulse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module level_to_pulse_tb;

	// Inputs
	reg i_clk;
	reg i_data;
	wire o_pulse;

	// Instantiate the Unit Under Test (UUT)
	level_to_pulse uut (
		.i_clk(i_clk), 
		.i_data(i_data), 
		.o_pulse(o_pulse)
	);

   initial 
      i_clk = 0;
      always #10 i_clk = ~i_clk;
   
	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
      i_data = 1;
      #70 i_data = 0;
	end
      
endmodule

