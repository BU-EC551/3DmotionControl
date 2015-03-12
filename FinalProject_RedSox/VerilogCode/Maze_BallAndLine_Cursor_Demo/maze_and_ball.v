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
	input			  rst, 
   input  [10:0] hcounter,
   input  [10:0] vcounter,
   input         up,
   input         down,
   input         left, 
   input         right,
   output reg    ball_en,
   output  [7:0] ball_rgb,
   output        maze_en,
	output [5:0]  maze_en_portions, 
	input [9:0]   xAxis,		// x-axis data from PmodACL
   input [9:0]   yAxis,		// y-axis data from PmodACL
   input [9:0]   zAxis		// z-axis data from PmodACL
    );
   
   localparam BALL_WIDTH = 8;
   
   wire [5:0] stop_right_portions, stop_left_portions, stop_up_portions, stop_down_portions;
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
	portion_4 portion4(hcounter, vcounter, maze_en_portions[3],
                        x_ball, y_ball, BALL_WIDTH, 
                        stop_right_portions[3], stop_left_portions[3], 
                        stop_up_portions[3], stop_down_portions[3]);
	portion_5 portion5(hcounter, vcounter, maze_en_portions[4],
                        x_ball, y_ball, BALL_WIDTH, 
                        stop_right_portions[4], stop_left_portions[4], 
                        stop_up_portions[4], stop_down_portions[4]);
	portion_6 portion6(hcounter, vcounter, maze_en_portions[5],
                        x_ball, y_ball, BALL_WIDTH, 
                        stop_right_portions[5], stop_left_portions[5], 
                        stop_up_portions[5], stop_down_portions[5]);
   
   assign maze_en = (maze_en_portions)       ? 1'b1 : 1'b0;
   assign stop_right = (stop_right_portions) ? 1'b1 : 1'b0;
   assign stop_left  = (stop_left_portions)  ? 1'b1 : 1'b0;
   assign stop_up    = (stop_up_portions)    ? 1'b1 : 1'b0;
   assign stop_down  = (stop_down_portions)  ? 1'b1 : 1'b0;

   // Ball logic
	
	//reg [9:0] xCoord = 400; 
	//reg [9:0] yCoord = 400; 
	reg [9:0] tempXMag; 
	reg [9:0] tempYMag; 
	// Circle movement clock divider 
	clk_divider #(10) circle_clk_div(
		.i_clk(clk),
		.o_clk(circle_clk)
	);
	
	// Every time raw G value comes in, update xcoord, ycoord 
	always @ (posedge clk) begin
		if (rst) begin
			x_ball = 40; 
			y_ball = 0; 
		end
		if (x_ball > 575 && x_ball < 590 && y_ball > 450 && y_ball < 500) begin
			x_ball = 100; 
			y_ball = 0; 
		end
		
		if (xAxis[9])begin
			if ((x_ball > 0) && (~stop_left)) begin
				x_ball = x_ball - (xAxis[5] | xAxis[4] | xAxis[3] | xAxis[2] | xAxis[1] | xAxis[0]);
				end
		end
		else begin
			if ((x_ball < 640-20) && (~stop_right)) begin
				x_ball = x_ball + (xAxis[5] | xAxis[4] | xAxis[3] | xAxis[2] | xAxis[1] | xAxis[0]);
			end
		end
		
		if (yAxis[9])begin
			if ((y_ball > 0) && (~stop_up)) begin
				y_ball = y_ball - (yAxis[5] | yAxis[4] | yAxis[3] | yAxis[2] | yAxis[1] | yAxis[0]);
			end
		end
		else begin
			if ((y_ball < 480-20) && (~stop_down)) begin
				y_ball = y_ball + (yAxis[5] | yAxis[4] | yAxis[3] | yAxis[2] | yAxis[1] | yAxis[0]);
			end
		end 
		
	end
   
   reg [5:0] ball_addr;
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

   baseball2 baseball (
      .a(ball_addr), // input [7 : 0] a
      .spo(ball_rgb) // output [7 : 0] spo
   );

endmodule
