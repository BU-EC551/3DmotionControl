`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:20 04/24/2014 
// Design Name: 
// Module Name:    CF_slowclk 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CF_slowclk(
					clk,
					RST,
					slow_clk
    );

input clk, RST;
output slow_clk;

reg [25:0] count=26'b0;
reg slow_clk;


always @ (posedge clk or posedge RST)

	if (RST==1'b1) begin
	slow_clk <= 1'b0;
	count <= 26'b0;
	end else begin
		if (count==26'd10000000) begin
			slow_clk <= (~slow_clk);
			count <= 26'b0;
		end else begin
		count <= count +1'b1;
		end
	end

endmodule
