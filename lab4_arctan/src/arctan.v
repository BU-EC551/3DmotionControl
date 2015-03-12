`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:32 04/01/2014 
// Design Name: 
// Module Name:    arctan 
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
//This arctan module takes in two 16-bit fractional number in the form of XX.XXXXXXXXXXXXXX
//and output a 16-bit fractional number in the form of XXX.XXXXXXXXXXXXX
//MUST be used with CORDIC IP core
//////////////////////////////////////////////////////////////////////////////////
module arctan(x,y,z,clk);
	parameter LENGTH=16;

	input [LENGTH-1:0] x,y;
	output [LENGTH-1:0]z;
	input clk;

  cordic arctan (
  .x_in(x), // input [15 : 0] x_in
  .y_in(y), // input [15 : 0] y_in
  .phase_out(z), // output [15 : 0] phase_out
  .clk(clk) // input clk
);


//----------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------	
////divide core instance begin
//	divcore div1 (
//  .aclk(clk), // input aclk
//  .s_axis_divisor_tvalid(s_axis_divisor_tvalid), // input s_axis_divisor_tvalid
//  .s_axis_divisor_tdata(x), // input [7 : 0] s_axis_divisor_tdata
//  .s_axis_dividend_tvalid(s_axis_dividend_tvalid), // input s_axis_dividend_tvalid
//  .s_axis_dividend_tdata(y), // input [7 : 0] s_axis_dividend_tdata
//  .m_axis_dout_tvalid(m_axis_dout_tvalid), // output m_axis_dout_tvalid
//  .m_axis_dout_tdata(z) // output [15 : 0] m_axis_dout_tdata
//);
////divide core instance end
//----------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------
//float core instance begin
//float float1 (
//  .a(y), // input [31 : 0] a
//  .b(x), // input [31 : 0] b
//  .clk(clk), // input clk
//  .result(z) // output [31 : 0] result
//);
////float core instance end
////----------------------------------------------------------------------------------------------------
////----------------------------------------------------------------------------------------------------
////fixed to float instance begin
//	fix2float fix2float1 (
//  .a(lower), // input [31 : 0] a
//  .clk(clk), // input clk
//  .result(q1) // output [31 : 0] result
//);
//
////fixed to float instance end
////----------------------------------------------------------------------------------------------------
////----------------------------------------------------------------------------------------------------
////fixed to float instance begin
//fix2float fix2float1 (
//  .a(lower), // input [31 : 0] a
//  .clk(clk), // input clk
//  .result(q1) // output [31 : 0] result
//);
////fixed to float instance end
////----------------------------------------------------------------------------------------------------
////----------------------------------------------------------------------------------------------------
//function reg range (input [LENGTH-1:0] lower,val,upper);
//	begin
//		range = val >=lower && val <= upper;
//	end
//	endfunction
////----------------------------------------------------------------------------------------------------
////----------------------------------------------------------------------------------------------------
////	function reg arctan(input [LENGTH-1:0] z, output [LENGTH-1:0] degree);
//always @ (posedge clk)
//	begin
//		case (1)
//		range(0,z,10): degree = 84;	
//		endcase
//	end
////----------------------------------------------------------------------------------------------------
////----------------------------------------------------------------------------------------------------
endmodule
