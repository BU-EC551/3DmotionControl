`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:50 02/15/2014 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input                  i_clk,
    input                  i_reset,
    output [P_COUNT_W-1:0] o_count
    );
   parameter P_COUNT_W = 16;
   
   reg [P_COUNT_W-1:0] count = 0;
   
   always @(posedge i_clk)
   begin
      if (i_reset) begin
         count <= 0;
      end else begin
         count <= count + 1;
      end
   end

   assign o_count = count;

endmodule