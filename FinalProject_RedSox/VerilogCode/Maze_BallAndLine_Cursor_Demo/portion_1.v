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
	 
	 wire n1, n2, n3, n4, n5, n6, n7 , n8 , n9 , n10 , n11, n12 , n13 , n14 , n15 , n16 , n17 , n18, n19 , n20 , n21 , n22 , n23 , n24 , n25, n26;
	 
	 assign n1 =  (hcounter >20   && hcounter <30    &&  vcounter >20   && vcounter<460);
	 assign n2 =  (hcounter >20   && hcounter <60    &&  vcounter >102  && vcounter<112);
	 assign n3 =  (hcounter >20   && hcounter <65    &&  vcounter >148  && vcounter<158);
	 assign n4 =  (hcounter >20   && hcounter <114   &&  vcounter >368  && vcounter<378);
	 assign n5 =  (hcounter >104  && hcounter <114   &&  vcounter >358  && vcounter<398);
	 assign n6 =  (hcounter >20   && hcounter <570   &&  vcounter >450  && vcounter<460);
	 assign n7 =  (hcounter >150  && hcounter <160   &&  vcounter >440  && vcounter<460);
	 assign n9 =  (hcounter >361  && hcounter <371   &&  vcounter >430  && vcounter<460);
	 assign n10 = (hcounter>361   && hcounter <401   &&  vcounter >430  && vcounter<440);
	 assign n11 = (hcounter>391   && hcounter <401   &&  vcounter >400  && vcounter<440);
	 assign n12 = (hcounter>391   && hcounter <490   &&  vcounter >400  && vcounter<410);
	 assign n13 = (hcounter>470   && hcounter <480   &&  vcounter >380  && vcounter<410);
	 assign n14 = (hcounter>430   && hcounter <440   &&  vcounter >400  && vcounter<430);
	 assign n15 = (hcounter>490   && hcounter <500   &&  vcounter >430  && vcounter<460); 
	 assign n16 = (hcounter>470   && hcounter <530   &&  vcounter >430  && vcounter<440);
	 assign n17 = (hcounter>520   && hcounter <530   &&  vcounter >409  && vcounter<435);
	 assign n18 = (hcounter>520   && hcounter <553   &&  vcounter >409  && vcounter<419);
	 assign n19 = (hcounter>543   && hcounter <553   &&  vcounter >393  && vcounter<419);
	 assign n20 = (hcounter>520   && hcounter <553   &&  vcounter >383  && vcounter<393);
    assign n21 = (hcounter >520  && hcounter <530   &&  vcounter >353  && vcounter<393);
	 assign n22=  (hcounter >53   && hcounter <63    &&  vcounter >316  && vcounter<352);
	 assign n24 = (hcounter >53   && hcounter <63    &&  vcounter >404  && vcounter<430);
	 assign n25=  (hcounter >53   && hcounter <119   &&  vcounter >420  && vcounter<430);
	 assign n26 = (hcounter >570  && hcounter <580    &&  vcounter >450 && vcounter<490);
	 
    assign enable = n1||n2||n3||n4||n5||n6|| n7||n8||n9||n10||n11||n12||n13||n14||n15||n16||n17||n18||n19||n20||n21 || n22||n23||n24||n25|| n26;
    
	 // Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 20)  && (y_ball >20-ball_width  && y_ball<460-1)) || //n1
            ((x_ball+ball_width == 20)  && (y_ball >102-ball_width && y_ball<112-1)) || //n2
            ((x_ball+ball_width == 20)  && (y_ball >148-ball_width && y_ball<158-1)) || //n3
            ((x_ball+ball_width == 20)  && (y_ball >368-ball_width && y_ball<378-1)) || //n4
            ((x_ball+ball_width == 104) && (y_ball >358-ball_width && y_ball<398-1)) || //n5
            ((x_ball+ball_width == 20)  && (y_ball >450-ball_width && y_ball<460-1)) || //n6
            ((x_ball+ball_width == 150) && (y_ball >440-ball_width && y_ball<460-1)) || //n7
            ((x_ball+ball_width == 361) && (y_ball >430-ball_width && y_ball<460-1)) || //n8
            ((x_ball+ball_width == 361) && (y_ball >430-ball_width && y_ball<440-1)) || //n9
            ((x_ball+ball_width == 391) && (y_ball >400-ball_width && y_ball<440-1)) || //n10
            ((x_ball+ball_width == 391) && (y_ball >400-ball_width && y_ball<410-1)) || //n11
				((x_ball+ball_width == 470) && (y_ball >380-ball_width && y_ball<410-1)) || //n12
            ((x_ball+ball_width == 430) && (y_ball >400-ball_width && y_ball<430-1)) || //n13
            ((x_ball+ball_width == 490) && (y_ball >430-ball_width && y_ball<460-1)) || //n14
            ((x_ball+ball_width == 470) && (y_ball >430-ball_width && y_ball<440-1)) || //n15
            ((x_ball+ball_width == 520) && (y_ball >409-ball_width && y_ball<435-1)) || //n16
            ((x_ball+ball_width == 520) && (y_ball >409-ball_width && y_ball<419-1)) || //n17
            ((x_ball+ball_width == 543) && (y_ball >393-ball_width && y_ball<419-1)) || //n18
            ((x_ball+ball_width == 520) && (y_ball >383-ball_width && y_ball<393-1)) || //n19
            ((x_ball+ball_width == 520) && (y_ball >353-ball_width && y_ball<393-1)) || //n20
				((x_ball+ball_width == 53)  && (y_ball >316-ball_width && y_ball<352-1)) || //n5
            ((x_ball+ball_width == 53)  && (y_ball >404-ball_width && y_ball<430-1)) || //n6
				((x_ball+ball_width == 570)  && (y_ball >450-ball_width && y_ball<490-1)) ||
            ((x_ball+ball_width == 53)  && (y_ball >420-ball_width && y_ball<430-1)))   //n21
				begin
					stop_right = 1;
				end
        if (((x_ball == 30-1)  && (y_ball >20-ball_width  && y_ball<460-1)) || //n1
            ((x_ball == 60-1)  && (y_ball >102-ball_width && y_ball<112-1)) || //n2
            ((x_ball == 65-1)  && (y_ball >148-ball_width && y_ball<158-1)) || //n3
            ((x_ball == 114-1) && (y_ball >368-ball_width && y_ball<378-1)) || //n4
            ((x_ball == 114-1) && (y_ball >358-ball_width && y_ball<398-1)) || //n5
            ((x_ball == 570-1) && (y_ball >450-ball_width && y_ball<460-1)) || //n6
            ((x_ball == 160-1) && (y_ball >440-ball_width && y_ball<460-1)) || //n7
            ((x_ball == 371-1) && (y_ball >430-ball_width && y_ball<460-1)) || //n8
            ((x_ball == 401-1) && (y_ball >430-ball_width && y_ball<440-1)) || //n9
            ((x_ball == 401-1) && (y_ball >400-ball_width && y_ball<440-1)) || //n10
            ((x_ball == 490-1) && (y_ball >400-ball_width && y_ball<410-1)) || //n11
            ((x_ball == 480-1) && (y_ball >380-ball_width && y_ball<410-1)) || //n12
            ((x_ball == 440-1) && (y_ball >400-ball_width && y_ball<430-1)) || //n13
            ((x_ball == 500-1) && (y_ball >430-ball_width && y_ball<460-1)) || //n14
            ((x_ball == 530-1) && (y_ball >430-ball_width && y_ball<440-1)) || //n15
            ((x_ball == 530-1) && (y_ball >409-ball_width && y_ball<435-1)) || //n16
            ((x_ball == 553-1) && (y_ball >409-ball_width && y_ball<419-1)) || //n17
            ((x_ball == 553-1) && (y_ball >393-ball_width && y_ball<419-1)) || //n18
            ((x_ball == 553-1) && (y_ball >383-ball_width && y_ball<393-1)) || //n19
            ((x_ball == 530-1) && (y_ball >353-ball_width && y_ball<393-1)) || //n20
				((x_ball == 63-1)  && (y_ball >316-ball_width && y_ball<352-1)) || //n18
            ((x_ball == 63-1)  && (y_ball >404-ball_width && y_ball<430-1)) || //n19
				((x_ball == 580-1)  && (y_ball >450-ball_width && y_ball<490-1)) ||
            ((x_ball == 119-1) && (y_ball >420-ball_width && y_ball<430-1))) //n21
				begin
					stop_left  = 1;
				end
				
        if (((y_ball+ball_width == 20)  && (x_ball >20-ball_width   && x_ball<30-1))  || //n1
            ((y_ball+ball_width == 102) && (x_ball >20-ball_width   && x_ball<60-1))  || //n2
            ((y_ball+ball_width == 148) && (x_ball>20-ball_width    && x_ball<65-1))  || //n3
            ((y_ball+ball_width == 368) && (x_ball >20-ball_width   && x_ball<114-1)) || //n4
            ((y_ball+ball_width == 358) && (x_ball >104-ball_width  && x_ball<114-1)) || //n5
            ((y_ball+ball_width == 450) && (x_ball >20-ball_width   && x_ball<570-1)) || //n6
            ((y_ball+ball_width == 440) && (x_ball >150-ball_width  && x_ball<160-1)) || //n7
            ((y_ball+ball_width == 430) && (x_ball >361-ball_width  && x_ball<371-1)) || //n8
            ((y_ball+ball_width == 430) && (x_ball >361-ball_width  && x_ball<401-1)) || //n9
            ((y_ball+ball_width == 400) && (x_ball >391-ball_width  && x_ball<401-1)) || //n10
            ((y_ball+ball_width == 400) && (x_ball >391-ball_width  && x_ball<490-1)) || //n11
            ((y_ball+ball_width == 380) && (x_ball >470-ball_width  && x_ball<480-1)) || //n12
            ((y_ball+ball_width == 400) && (x_ball >430-ball_width  && x_ball<440-1)) || //n13
            ((y_ball+ball_width == 430) && (x_ball >490-ball_width  && x_ball<500-1)) || //n14
            ((y_ball+ball_width == 430) && (x_ball >470-ball_width  && x_ball<530-1)) || //n15
            ((y_ball+ball_width == 409) && (x_ball >520-ball_width  && x_ball<530-1)) || //n16
            ((y_ball+ball_width == 409) && (x_ball >520-ball_width  && x_ball<553-1)) || //n17
            ((y_ball+ball_width == 393) && (x_ball >543-ball_width  && x_ball<553-1)) || //n18
            ((y_ball+ball_width == 383) && (x_ball >520-ball_width  && x_ball<553-1)) || //n19
            ((y_ball+ball_width == 353) && (x_ball >520-ball_width  && x_ball<530-1)) || //n20
				((y_ball+ball_width == 316) && (x_ball >53-ball_width   && x_ball<63-1))  || //n5
            ((y_ball+ball_width == 404) && (x_ball >53-ball_width   && x_ball<63-1))  || //n6
				((y_ball+ball_width == 450) && (x_ball >570-ball_width   && x_ball<580-1))  ||
            ((y_ball+ball_width == 420) && (x_ball >53-ball_width   && x_ball<119-1)))   //n21 
				begin 
					stop_down = 1;
				end
				
        if (((y_ball == 460-1) && (x_ball >20-ball_width   && x_ball<30-1))  || //n1
            ((y_ball == 112-1) && (x_ball >20-ball_width   && x_ball<60-1)) || //n2
            ((y_ball == 158-1) && (x_ball >20-ball_width   && x_ball<65-1)) || //n3
            ((y_ball == 378-1) && (x_ball >20-ball_width   && x_ball<114-1)) || //n4
            ((y_ball == 398-1) && (x_ball >104-ball_width  && x_ball<114-1)) || //n5
            ((y_ball == 460-1) && (x_ball >20-ball_width   && x_ball<570-1)) || //n6
            ((y_ball == 460-1) && (x_ball >150-ball_width  && x_ball<160-1)) || //n7
            ((y_ball == 460-1) && (x_ball >361-ball_width  && x_ball<371-1)) || //n8
            ((y_ball == 440-1) && (x_ball >361-ball_width  && x_ball<401-1)) || //n9
            ((y_ball == 440-1) && (x_ball >391-ball_width  && x_ball<401-1)) || //n10
            ((y_ball == 410-1) && (x_ball >391-ball_width  && x_ball<490-1)) || //n11
            ((y_ball == 410-1) && (x_ball >470-ball_width  && x_ball<480-1)) || //n12
            ((y_ball == 430-1) && (x_ball >430-ball_width  && x_ball<440-1)) || //n13
            ((y_ball == 460-1) && (x_ball >490-ball_width  && x_ball<500-1)) || //n14
            ((y_ball == 440-1) && (x_ball >470-ball_width  && x_ball<530-1)) || //n15
            ((y_ball == 435-1) && (x_ball >520-ball_width  && x_ball<530-1)) || //n16
            ((y_ball == 419-1) && (x_ball >520-ball_width  && x_ball<553-1)) || //n17
            ((y_ball == 419-1) && (x_ball >543-ball_width  && x_ball<553-1)) || //n18
            ((y_ball == 393-1) && (x_ball >520-ball_width  && x_ball<553-1)) || //n19
            ((y_ball == 393-1) && (x_ball >520-ball_width  && x_ball<530-1)) || //n20
				((y_ball == 352-1) && (x_ball >53-ball_width   && x_ball<63-1)) || //n17
            ((y_ball == 430-1) && (x_ball >53-ball_width   && x_ball<63-1)) || //n18
				((y_ball == 430-1) && (x_ball >53-ball_width   && x_ball<63-1)) ||
            ((y_ball == 490-1) && (x_ball >570-ball_width   && x_ball<580-1)))   //n21 
				begin 
					stop_up = 1;
				end
     end
endmodule
