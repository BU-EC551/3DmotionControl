`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:54:23 02/27/2014 
// Design Name: 
// Module Name:    bcd_decoder 
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
module bcd_decoder(
    input  [15:0] i_hex,
    output [19:0] o_bcd
    );

   reg  [16-1:0] bin; 
   reg  [16+3:0] bcd; 
   reg  [16+3:0] result; 
 
   always@( i_hex ) 
   begin 
      bin = i_hex; 
      result = 0; 
 
      repeat ( 16-1 ) 
      begin 
         result[0] = bin[16-1]; 
 
         if ( result[3:0] > 4 ) 
            result[3:0] = result[3:0] + 4'd3; 
         if ( result[7:4] > 4 ) 
            result[7:4] = result[7:4] + 4'd3; 
         if ( result[11:8] > 4 ) 
            result[11:8] = result[11:8] + 4'd3; 
         if ( result[15:12] > 4 ) 
            result[15:12] = result[15:12] + 4'd3; 
         if ( result[19:16] > 4 ) 
            result[19:16] = result[19:16] + 4'd3; 
 
         result = result << 1; 
         bin = bin << 1; 
 
      end 
 
      result[0] = bin[16-1]; 
      bcd <= result; 
 
   end 
 
   assign o_bcd = bcd;
 
endmodule
