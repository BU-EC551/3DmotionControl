`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:08:36 04/13/2014 
// Design Name: 
// Module Name:    portion_5 
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
module portion_5(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down
    );
	 
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;
    
	 wire n23,n24 , n25 , n26 , n27 , n28 , n29 , n30 , n31, n32 ,n33 ,n34 ,n35 , n36 , n37 , n38 , n39 ,n40 , n41, n42 , n43 , n44, n45, n46 , n47 , n48;
	 
	 
    assign n23=  (hcounter >581   && hcounter <591   &&  vcounter >46   && vcounter<134);
	 assign n24=  (hcounter >515   && hcounter <591   &&  vcounter >124  && vcounter<134);
	 assign n25=  (hcounter >515   && hcounter <525   &&  vcounter >124  && vcounter<326);
	 assign n26=  (hcounter >490   && hcounter <525   &&  vcounter >316  && vcounter<326); //482
    assign n27 = (hcounter >490   && hcounter <500   &&  vcounter >316  && vcounter<378); //358 hc 482-492
	 assign n28 = (hcounter >317   && hcounter <327   &&  vcounter >150  && vcounter<264);
	 assign n29 = (hcounter >360   && hcounter <492   &&  vcounter >358  && vcounter<368); //48 to58
	 assign n30 = (hcounter >185   && hcounter <195   &&  vcounter >176  && vcounter<290);
	 assign n31=  (hcounter >449   && hcounter <581   &&  vcounter >176  && vcounter<186);
    assign n32=  (hcounter >482   && hcounter <492   &&  vcounter >202  && vcounter<290);
	 assign n33 = (hcounter >360   && hcounter <370   &&  vcounter >358  && vcounter<404);
	 assign n34 = (hcounter >340   && hcounter <370   &&  vcounter >394  && vcounter<404);
    assign enable = n23||n24 ||n25 || n26 || n27 || n28 || n29 || n30|| n31||n32 ||n33||n34 ||n35 ||n36 ||n37 ||n38 || n39||n40|| n41||n42 || n43 ||n44||n45 || n46 || n47 || n48;

// Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 581)  && (y_ball >46-ball_width  && y_ball<134-1)) || //n23
            ((x_ball+ball_width == 515)  && (y_ball >124-ball_width && y_ball<134-1)) || //n24
            ((x_ball+ball_width == 515)  && (y_ball >124-ball_width && y_ball<326-1)) || //n25
            ((x_ball+ball_width == 490)  && (y_ball >316-ball_width && y_ball<326-1)) || //n26
            ((x_ball+ball_width == 490)  && (y_ball >316-ball_width && y_ball<378-1)) || //n27
            ((x_ball+ball_width == 317)  && (y_ball >150-ball_width && y_ball<264-1)) || //n28
            ((x_ball+ball_width == 360)  && (y_ball >358-ball_width && y_ball<368-1)) || //n29
            ((x_ball+ball_width == 185)  && (y_ball >176-ball_width && y_ball<290-1)) || //n30
            ((x_ball+ball_width == 449)  && (y_ball >176-ball_width && y_ball<186-1)) || //n31
            ((x_ball+ball_width == 482)  && (y_ball >202-ball_width && y_ball<190-1)) || //n32
            ((x_ball+ball_width == 360)  && (y_ball >358-ball_width && y_ball<404-1)) || //n33
			   ((x_ball+ball_width == 340)  && (y_ball >394-ball_width && y_ball<404-1)))   //n48
				begin
					stop_right = 1;
				end
				
        if (((x_ball == 591-1) && (y_ball >46-ball_width  && y_ball<134-1))  || //n1
            ((x_ball == 591-1) && (y_ball >124-ball_width && y_ball<134-1))   || //n2
            ((x_ball == 525-1) && (y_ball >124-ball_width && y_ball<326-1)) || //n3
            ((x_ball == 525-1) && (y_ball >316-ball_width && y_ball<326-1))|| //n4
			   ((x_ball == 500-1) && (y_ball >316-ball_width && y_ball<378-1)) || //n4
            ((x_ball == 327-1) && (y_ball >150-ball_width && y_ball<264-1)) || //n5
            ((x_ball == 492-1) && (y_ball >358-ball_width && y_ball<368-1))|| //n6
            ((x_ball == 195-1) && (y_ball >176-ball_width && y_ball<290-1))|| //n7
            ((x_ball == 581-1) && (y_ball >176-ball_width && y_ball<186-1))  || //n8
            ((x_ball == 492-1) && (y_ball >202-ball_width && y_ball<290-1))  || //n9
            ((x_ball == 370-1) && (y_ball >358-ball_width && y_ball<404-1))  || //n10
            ((x_ball == 370-1) && (y_ball >394-ball_width && y_ball<404-1)))  //n21
				begin
					stop_left  = 1;
				end
				
        if (((y_ball+ball_width == 46)   && (x_ball >581-ball_width   && x_ball<591-1)) || //n1
            ((y_ball+ball_width == 124)  && (x_ball >515-ball_width   && x_ball<591-1)) || //n2
            ((y_ball+ball_width == 124)  && (x_ball >515-ball_width   && x_ball<525-1)) || //n3
            ((y_ball+ball_width == 316)  && (x_ball >490-ball_width   && x_ball<525-1)) || //n4
            ((y_ball+ball_width == 316)  && (x_ball >490-ball_width   && x_ball<500-1)) || //n5
            ((y_ball+ball_width == 150)  && (x_ball >317-ball_width   && x_ball<327-1)) || //n6
            ((y_ball+ball_width == 358)  && (x_ball >360-ball_width   && x_ball<492-1)) || //n7
            ((y_ball+ball_width == 176)  && (x_ball >185-ball_width   && x_ball<195-1)) || //n8
            ((y_ball+ball_width == 176)  && (x_ball >449-ball_width   && x_ball<581-1)) || //n9
            ((y_ball+ball_width == 202)  && (x_ball >482-ball_width   && x_ball<492-1))  || //n10
            ((y_ball+ball_width == 358)  && (x_ball >360-ball_width   && x_ball<370-1)) || //n11
            ((y_ball+ball_width == 394)  && (x_ball >340-ball_width   && x_ball<370-1)))   //n21 
				begin 
					stop_down = 1;
				end
				
        if (
	    ((y_ball == 134-1) &&(x_ball >581-ball_width   && x_ball<591-1)) || //n1
            ((y_ball == 134-1) &&(x_ball >515-ball_width   && x_ball<591-1)) || //n2
            ((y_ball == 326-1) &&(x_ball >515-ball_width   && x_ball<525-1)) || //n3
            ((y_ball == 326-1) &&(x_ball >490-ball_width   && x_ball<525-1)) || //n4
            ((y_ball == 378-1) &&(x_ball >490-ball_width   && x_ball<500-1)) || //n5
            ((y_ball == 264-1) &&(x_ball >317-ball_width   && x_ball<327-1)) || //n6
            ((y_ball == 368-1) &&(x_ball >360-ball_width   && x_ball<492-1))  || //n7
            ((y_ball == 290-1) &&(x_ball >185-ball_width   && x_ball<195-1)) || //n8
            ((y_ball == 186-1) &&(x_ball >449-ball_width   && x_ball<581-1)) || //n9
            ((y_ball == 290-1) &&(x_ball >482-ball_width   && x_ball<492-1))  || //n10
            ((y_ball == 404-1) &&(x_ball >360-ball_width   && x_ball<370-1)) || //n11
            ((y_ball == 404-1) &&(x_ball >340-ball_width   && x_ball<370-1))
		     )   //n21 
				begin 
					stop_up = 1;
				end
     end
endmodule
