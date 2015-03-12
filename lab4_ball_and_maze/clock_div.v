`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:51 02/21/2014 
// Design Name: 
// Module Name:    clock_div 
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
module clock_div(clk, new_clk
    );
	 input clk;
	 
	 output new_clk;
	 reg new_clk = 1'b0;
	 
	 
	 reg [1:0] counter = 2'b0;
	 always@(posedge clk)
	 counter <= counter + 1'b1;
	 
    always @(posedge clk)
	 if(counter[1] == 1'b1) new_clk <= 1'b1;
	 else new_clk <= 1'b0;

endmodule
