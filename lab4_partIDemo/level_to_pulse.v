`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:18 02/21/2014 
// Design Name: 
// Module Name:    level_to_pulse 
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
module level_to_pulse(
    input  i_clk,
    input  i_data,
    output o_pulse
    );
   
   reg  data;
   reg  data_d;
   
   always @(posedge i_clk)
   begin
      data   <= i_data;
      data_d <= ~data;
   end

   assign o_pulse = data_d & data;

endmodule