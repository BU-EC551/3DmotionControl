`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:35:31 04/08/2014
// Design Name:   CF
// Module Name:   /ad/eng/users/t/y/tyyang/EC551/Project/CompFilter/TB_CF.v
// Project Name:  CompFilter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_CF;

	// Inputs
	reg [15:0] gyroData;
	reg [15:0] y_accel_data;
	reg [15:0] z_accel_data;
	reg clk;

	// Outputs
	wire [15:0] x_temp;
	wire [15:0] x_final;

	// Instantiate the Unit Under Test (UUT)
	CF uut (
		.gyroData(gyroData), 
		.y_accel_data(y_accel_data), 
		.z_accel_data(z_accel_data), 
		.clk(clk), 
		.x_temp(x_temp), 
		.x_final(x_final)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		#100 gyroData = 16'h0001;y_accel_data = 16'h2800;z_accel_data = 16'h2000;
		#100 gyroData = 16'h0004;y_accel_data = 16'h2800;z_accel_data = 16'h2000;
		#100 gyroData = 16'h0008;y_accel_data = 16'h2800;z_accel_data = 16'h2000;
		#100 gyroData = 16'h0010;y_accel_data = 16'h2800;z_accel_data = 16'h2000;
	

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
	always begin
	#20000 clk = ~clk;
	end
		
		
endmodule

