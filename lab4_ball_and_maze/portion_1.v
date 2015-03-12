`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:30 03/25/2014 
// Design Name: 
// Module Name:    portion_1 
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
module portion_1(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down
    );
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;
	 
	 wire n1, n2, n3, n4, n5, n6, n7;
	 
	 assign n1 = (hcounter >30  && hcounter <55   && vcounter >20  && vcounter<215);
	 assign n2 = (hcounter >30  && hcounter <465  && vcounter >85  && vcounter<110);
	 assign n3 = (hcounter >440 && hcounter <465  && vcounter >85  && vcounter<295);
	 assign n4 = (hcounter >365 && hcounter <465  && vcounter >270 && vcounter<295);
	 assign n5 = (hcounter >365 && hcounter <390  && vcounter >160 && vcounter<295);
	 assign n6 = (hcounter >115 && hcounter <390  && vcounter >160 && vcounter<185);
	 assign n7 = (hcounter >240 && hcounter <265  && vcounter >160 && vcounter<295);
	 assign enable = n1||n2||n3||n4||n5||n6||n7;

     // Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 30)  && (y_ball >20-ball_width  && y_ball<215-1)) || //n1
            ((x_ball+ball_width == 30)  && (y_ball >85-ball_width  && y_ball<110-1)) || //n2
            ((x_ball+ball_width == 440) && (y_ball >85-ball_width  && y_ball<295-1)) || //n3
            ((x_ball+ball_width == 365) && (y_ball >270-ball_width && y_ball<295-1)) || //n4
            ((x_ball+ball_width == 365) && (y_ball >160-ball_width && y_ball<295-1)) || //n5
            ((x_ball+ball_width == 115) && (y_ball >160-ball_width && y_ball<185-1)) || //n6
            ((x_ball+ball_width == 240) && (y_ball >160-ball_width && y_ball<295-1))) begin //n7
           stop_right = 1;
        end
        if (((x_ball == 55-1)  && (y_ball >20-ball_width  && y_ball<215-1)) || //n1
            ((x_ball == 465-1) && (y_ball >85-ball_width  && y_ball<110-1)) || //n2
            ((x_ball == 465-1) && (y_ball >85-ball_width  && y_ball<295-1)) || //n3
            ((x_ball == 465-1) && (y_ball >270-ball_width && y_ball<295-1)) || //n4
            ((x_ball == 390-1) && (y_ball >160-ball_width && y_ball<295-1)) || //n5
            ((x_ball == 390-1) && (y_ball >160-ball_width && y_ball<185-1)) || //n6
            ((x_ball == 265-1) && (y_ball >160-ball_width && y_ball<295-1))) begin //n7
           stop_left  = 1;
        end
        if (((y_ball+ball_width == 20)  && (x_ball >30-ball_width   && x_ball<55-1))  || //n1
            ((y_ball+ball_width == 85)  && (x_ball >30-ball_width   && x_ball<465-1)) || //n2
            ((y_ball+ball_width == 85)  && (x_ball >440-ball_width  && x_ball<465-1)) || //n3
            ((y_ball+ball_width == 270) && (x_ball >365-ball_width  && x_ball<465-1)) || //n4
            ((y_ball+ball_width == 160) && (x_ball >365-ball_width  && x_ball<390-1)) || //n5
            ((y_ball+ball_width == 160) && (x_ball >115-ball_width  && x_ball<390-1)) || //n6
            ((y_ball+ball_width == 160) && (x_ball >240-ball_width  && x_ball<265-1))) begin //n7
           stop_down = 1;
        end
        if (((y_ball == 215-1) && (x_ball >30-ball_width   && x_ball<55-1))  || //n1
            ((y_ball == 110-1) && (x_ball >30-ball_width   && x_ball<465-1)) || //n2
            ((y_ball == 295-1) && (x_ball >440-ball_width  && x_ball<465-1)) || //n3
            ((y_ball == 295-1) && (x_ball >365-ball_width  && x_ball<465-1)) || //n4
            ((y_ball == 295-1) && (x_ball >365-ball_width  && x_ball<390-1)) || //n5
            ((y_ball == 185-1) && (x_ball >115-ball_width  && x_ball<390-1)) || //n6
            ((y_ball == 295-1) && (x_ball >240-ball_width  && x_ball<265-1))) begin //n7
           stop_up   = 1;
        end
     end

endmodule
