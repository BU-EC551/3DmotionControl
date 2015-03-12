`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:07 03/25/2014 
// Design Name: 
// Module Name:    portion_3 
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

module portion_3(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down);
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;

     // Display logic
     assign n1  = (hcounter >510 && hcounter <535  && vcounter >20  && vcounter<350);
	  assign n2  = (hcounter >30 && hcounter <535  && vcounter >20  && vcounter<45);
	  assign enable = n1||n2;
     
     // Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 510) && (y_ball >20-ball_width  && y_ball<350-1)) ||
            ((x_ball+ball_width == 30)  && (y_ball >20-ball_width  && y_ball<45-1))) begin
           stop_right = 1;
        end
        if (((x_ball == 535-1) && (y_ball >20-ball_width  && y_ball<350-1)) ||
            ((x_ball == 535-1) && (y_ball >20-ball_width  && y_ball<45-1))) begin
           stop_left  = 1;
        end
        if (((y_ball+ball_width == 20) && (x_ball >510-ball_width  && x_ball<535-1)) ||
            ((y_ball+ball_width == 20) && (x_ball >30-ball_width   && x_ball<535-1))) begin
           stop_down = 1;
        end
        if (((y_ball == 350-1) && (x_ball >510-ball_width  && x_ball<535-1)) ||
            ((y_ball == 45-1)) && (x_ball >30-ball_width   && x_ball<535-1)) begin
           stop_up   = 1;
        end
     end
     
endmodule
