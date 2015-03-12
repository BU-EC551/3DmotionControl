`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:49 03/25/2014 
// Design Name: 
// Module Name:    portion_2 
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
module portion_2(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down
   );

 
    input [10:0] hcounter, vcounter;
	 output enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;
	 
	 wire n1, n2, n3, n4, n5, n6, n7 , n8 , n9 , n10;
	 
	 assign n1  = (hcounter >585 && hcounter <610  && vcounter >20   && vcounter<420);
	 assign n2  = (hcounter >30  && hcounter <610  && vcounter >395  && vcounter<420);
	 assign n3  = (hcounter >30  && hcounter <55   && vcounter >280  && vcounter<420);
	 assign n4  = (hcounter >260 && hcounter <285  && vcounter >325  && vcounter<420);
	 assign n5  = (hcounter >300 && hcounter <465  && vcounter >325  && vcounter<350);
	 assign n6  = (hcounter >300 && hcounter <325  && vcounter >230  && vcounter<350);
	 assign n7  = (hcounter >180 && hcounter <325  && vcounter >325  && vcounter<350);
	 assign n8  = (hcounter >180 && hcounter <205  && vcounter >230  && vcounter<350);
	 assign n9  = (hcounter >115 && hcounter <205  && vcounter >230  && vcounter<255);
	 assign n10 = (hcounter >115 && hcounter <140  && vcounter >230  && vcounter<350);
	 assign enable = n1||n2||n3||n4||n5||n6||n7||n8||n9||n10;

     // Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 585) && (y_ball >20-ball_width  && y_ball<420-1)) || //n1
            ((x_ball+ball_width == 30)  && (y_ball >395-ball_width && y_ball<420-1)) || //n2
            ((x_ball+ball_width == 30)  && (y_ball >280-ball_width && y_ball<420-1)) || //n3
            ((x_ball+ball_width == 260) && (y_ball >325-ball_width && y_ball<420-1)) || //n4
            ((x_ball+ball_width == 300) && (y_ball >325-ball_width && y_ball<350-1)) || //n5
            ((x_ball+ball_width == 300) && (y_ball >230-ball_width && y_ball<350-1)) || //n6
            ((x_ball+ball_width == 180) && (y_ball >325-ball_width && y_ball<350-1)) || //n7
            ((x_ball+ball_width == 180) && (y_ball >230-ball_width && y_ball<350-1)) || //n8
            ((x_ball+ball_width == 115) && (y_ball >230-ball_width && y_ball<255-1)) || //n9
            ((x_ball+ball_width == 115) && (y_ball >230-ball_width && y_ball<350-1))) begin //n10
           stop_right = 1;
        end
        if (((x_ball == 610-1) && (y_ball >20-ball_width  && y_ball<420-1)) || //n1
            ((x_ball == 610-1) && (y_ball >395-ball_width && y_ball<420-1)) || //n2
            ((x_ball == 55-1)  && (y_ball >280-ball_width && y_ball<420-1)) || //n3
            ((x_ball == 285-1) && (y_ball >325-ball_width && y_ball<420-1)) || //n4
            ((x_ball == 465-1) && (y_ball >325-ball_width && y_ball<350-1)) || //n5
            ((x_ball == 325-1) && (y_ball >230-ball_width && y_ball<350-1)) || //n6
            ((x_ball == 325-1) && (y_ball >325-ball_width && y_ball<350-1)) || //n7
            ((x_ball == 205-1) && (y_ball >230-ball_width && y_ball<350-1)) || //n8
            ((x_ball == 205-1) && (y_ball >230-ball_width && y_ball<255-1)) || //n9
            ((x_ball == 140-1) && (y_ball >230-ball_width && y_ball<350-1))) begin //n10
           stop_left  = 1;
        end
        if (((y_ball+ball_width == 20)  && (x_ball >585-ball_width  && x_ball<610-1)) || //n1
            ((y_ball+ball_width == 395) && (x_ball >30-ball_width   && x_ball<610-1)) || //n2
            ((y_ball+ball_width == 280) && (x_ball >30-ball_width   && x_ball<55-1))  || //n3
            ((y_ball+ball_width == 325) && (x_ball >260-ball_width  && x_ball<285-1)) || //n4
            ((y_ball+ball_width == 325) && (x_ball >300-ball_width  && x_ball<465-1)) || //n5
            ((y_ball+ball_width == 230) && (x_ball >300-ball_width  && x_ball<325-1)) || //n6
            ((y_ball+ball_width == 325) && (x_ball >180-ball_width  && x_ball<325-1)) || //n7
            ((y_ball+ball_width == 230) && (x_ball >180-ball_width  && x_ball<205-1)) || //n8
            ((y_ball+ball_width == 230) && (x_ball >115-ball_width  && x_ball<205-1)) || //n9
            ((y_ball+ball_width == 230) && (x_ball >115-ball_width  && x_ball<140-1))) begin //n10
           stop_down = 1;
        end
        if (((y_ball == 420-1) && (x_ball >585-ball_width  && x_ball<610-1)) || //n1
            ((y_ball == 420-1) && (x_ball >30-ball_width   && x_ball<610-1)) || //n2
            ((y_ball == 420-1) && (x_ball >30-ball_width   && x_ball<55-1))  || //n3
            ((y_ball == 420-1) && (x_ball >260-ball_width  && x_ball<285-1)) || //n4
            ((y_ball == 350-1) && (x_ball >300-ball_width  && x_ball<465-1)) || //n5
            ((y_ball == 350-1) && (x_ball >300-ball_width  && x_ball<325-1)) || //n6
            ((y_ball == 350-1) && (x_ball >180-ball_width  && x_ball<325-1)) || //n7
            ((y_ball == 350-1) && (x_ball >180-ball_width  && x_ball<205-1)) || //n8
            ((y_ball == 255-1) && (x_ball >115-ball_width  && x_ball<205-1)) || //n9
            ((y_ball == 350-1) && (x_ball >115-ball_width  && x_ball<140-1))) begin //n10
           stop_up   = 1;
        end
     end

endmodule

