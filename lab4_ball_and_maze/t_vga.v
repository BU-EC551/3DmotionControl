`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:42 03/25/2014
// Design Name:   vga_display
// Module Name:   X:/EC551/vga_proj_qihui/t_vga.v
// Project Name:  vga_proj_qihui
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_vga;

	// Inputs
	reg clk;

	// Outputs
	wire HS;
	wire VS;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;

	// Instantiate the Unit Under Test (UUT)
	vga_display uut (
		.clk(clk), 
		.HS(HS), 
		.VS(VS), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #1 clk = ~clk;
      
endmodule

