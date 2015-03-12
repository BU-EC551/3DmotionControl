`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:50:28 04/02/2014
// Design Name:   arctan
// Module Name:   /ad/eng/users/t/y/tyyang/EC551/Project/arctan2/TB_arctan.v
// Project Name:  arctan2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arctan
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_arctan;


	//Inputs
	reg [15:0] x;
	reg [15:0] y;
	reg clk;

	// Outputs
	wire [15:0] z;

	// Instantiate the Unit Under Test (UUT)
	arctan uut (
		.clk(clk),
		.x(x),
		.y(y),
		.z(z)
	);

	initial begin
		// Initialize Inputs
		clk =0;
		
		// Wait 100 ns for global reset to finish
		#200 x=16'b0010100000000000;y=16'b0010000000000000; 
		#200 x=16'b0010000000000000;y=16'b0010100000000000; 
		#200 x=16'b0011000000000000;y=16'b0010000000000000; 
		#200 x=16'b0011100000000000;y=16'b0010000000000000; 
		#200 x=16'b0011000000000000;y=16'b0011100000000000; 
		
		// Add stimulus here
	end
	
	always begin
	#10 clk = ~clk;
   end   
endmodule

