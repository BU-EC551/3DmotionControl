`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:26 03/28/2014 
// Design Name: 
// Module Name:    maze_and_ball 
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
module maze_and_ball(
   input         clk,
   input  [10:0] hcounter,
   input  [10:0] vcounter,
   input         up,
   input         down,
   input         left, 
   input         right,
   output reg    ball_en,
   output  [7:0] ball_rgb,
   output        maze_en
    );
   
   localparam BALL_WIDTH = 16;
   
   wire [2:0] maze_en_portions, stop_right_portions, stop_left_portions, stop_up_portions, stop_down_portions;
   wire stop_right, stop_left, stop_up, stop_down;
   reg [10:0] x_ball, y_ball;

   // Maze logic
   portion_1 portion1(hcounter, vcounter, maze_en_portions[0], 
                        x_ball, y_ball, BALL_WIDTH, 
                        stop_right_portions[0], stop_left_portions[0], 
                        stop_up_portions[0], stop_down_portions[0]);
   portion_2 portion2(hcounter, vcounter, maze_en_portions[1], 
                        x_ball, y_ball, BALL_WIDTH, 
                        stop_right_portions[1], stop_left_portions[1], 
                        stop_up_portions[1], stop_down_portions[1]);
	portion_3 portion3(hcounter, vcounter, maze_en_portions[2], 
                        x_ball, y_ball, BALL_WIDTH, 
                        stop_right_portions[2], stop_left_portions[2], 
                        stop_up_portions[2], stop_down_portions[2]);
   
   assign maze_en = (maze_en_portions)       ? 1'b1 : 1'b0;
   assign stop_right = (stop_right_portions) ? 1'b1 : 1'b0;
   assign stop_left  = (stop_left_portions)  ? 1'b1 : 1'b0;
   assign stop_up    = (stop_up_portions)    ? 1'b1 : 1'b0;
   assign stop_down  = (stop_down_portions)  ? 1'b1 : 1'b0;

   // Ball logic
   always @(posedge clk)
   begin
      x_ball <= x_ball;
      y_ball <= y_ball;
      
      
      if (up && ~down) begin
         if ((y_ball > 0) && (~stop_up))
            y_ball <= y_ball-1;
      end else if (~up && down) begin
         if ((y_ball < 480-20) && (~stop_down))
            y_ball <= y_ball+1;
      end
            
      if (left && ~right) begin
         if ((x_ball > 0) && (~stop_left))
            x_ball <= x_ball-1;
      end else if (~left && right) begin
         if ((x_ball < 640-20) && (~stop_right))
            x_ball <= x_ball+1;
      end
   end
   
   
   reg [7:0] ball_addr;
   always @(x_ball, y_ball, hcounter, vcounter)
   begin
      if ( hcounter > x_ball && hcounter <= x_ball+BALL_WIDTH &&
           vcounter > y_ball && vcounter <= y_ball+BALL_WIDTH ) begin
         ball_en = 1;
         ball_addr = BALL_WIDTH*(vcounter-y_ball-1)+(hcounter-x_ball-1);
      end else begin
         ball_en = 0;
         ball_addr = 0;
      end
   end

   baseball_rom baseball (
      .a(ball_addr), // input [7 : 0] a
      .spo(ball_rgb) // output [7 : 0] spo
   );

endmodule
