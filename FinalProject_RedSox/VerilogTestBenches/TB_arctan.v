`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:55 04/27/2014
// Design Name:   arctan
// Module Name:   X:/EC551/Project/arctan2/TB_arctan.v
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

	// Inputs
	reg [15:0] y_accel_data;
	reg [15:0] z_accel_data;
	reg clk;

	// Outputs
	wire [15:0] pitch_acc;
 
	// Instantiate the Unit Under Test (UUT)
	arctan uut (
		.y_accel_data(y_accel_data), 
		.z_accel_data(z_accel_data), 
		.pitch_acc(pitch_acc), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk =0;
		#200 y_accel_data = 16'b0010000000000000; z_accel_data = 16'b0011011101101100;
		#200 y_accel_data = 16'b0011011101101100; z_accel_data = 16'b0010000000000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
	always begin
	#10 clk = ~clk;
	end
		
endmodule

