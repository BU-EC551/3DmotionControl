`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:13 04/13/2014 
// Design Name: 
// Module Name:    portion_6 
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
module portion_6(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down
    );
	 
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;
    
	 wire n23,n24 , n25 , n26 , n27 , n28 , n29 , n30 , n31, n32 ,n33 ,n34 ,n35 , n36 , n37 , n38 , n39 ,n40 , n41, n42 , n43 , n44, n45, n46 , n47 , n48,n22;
	 
	 
    assign n23=  (hcounter >610  && hcounter <620   &&  vcounter >20  && vcounter<490);
	 assign n24=  (hcounter >548  && hcounter <620   &&  vcounter >150 && vcounter<160);
	 assign n25=  (hcounter >515  && hcounter <591   &&  vcounter >228 && vcounter<238);
	 assign n26=  (hcounter >581  && hcounter <591   &&  vcounter >228 && vcounter<290);
    assign n27 = (hcounter >581  && hcounter <620   &&  vcounter >270 && vcounter<280);
    assign n28 = (hcounter >550  && hcounter <560   &&  vcounter >260 && vcounter<335);
    assign n29 = (hcounter >550  && hcounter <585   &&  vcounter >325 && vcounter<335);
	 assign n30 = (hcounter >575  && hcounter <585   &&  vcounter >325 && vcounter<435);
	// assign n22=  (hcounter >560  && hcounter <610   &&  vcounter >440 && vcounter<475);
    assign enable = n23||n24 ||n25 || n26 || n27 || n28 || n29 || n30|| n31||n32 ||n33||n34 ||n35 ||n36 ||n37 ||n38 || n39||n40|| n41||n42 || n43 ||n44||n45 || n46 || n47 || n48||n22;
   
	// Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 610)  && (y_ball >20-ball_width  && y_ball<460-1)) || //n23
            ((x_ball+ball_width == 548)  && (y_ball >150-ball_width && y_ball<160-1)) || //n24
            ((x_ball+ball_width == 515)  && (y_ball >228-ball_width && y_ball<238-1)) || //n25
            ((x_ball+ball_width == 581)  && (y_ball >228-ball_width && y_ball<290-1)) || //n26
            ((x_ball+ball_width == 581)  && (y_ball >270-ball_width && y_ball<280-1)) || //n31
            ((x_ball+ball_width == 550)  && (y_ball >260-ball_width && y_ball<335-1)) || //n32
            ((x_ball+ball_width == 550)  && (y_ball >325-ball_width && y_ball<335-1)) || //n33
	         ((x_ball+ball_width == 575)  && (y_ball >325-ball_width && y_ball<435-1)))   //n48
				begin
					stop_right = 1;
				end
        if (((x_ball == 620-1) && (y_ball >20-ball_width  && y_ball<460-1))  || //n1
            ((x_ball == 620-1) && (y_ball >150-ball_width && y_ball<160-1))  || //n2
            ((x_ball == 591-1) && (y_ball >228-ball_width && y_ball<238-1))  || //n3
            ((x_ball == 591-1) && (y_ball >228-ball_width && y_ball<290-1))  || //n4
				((x_ball == 620-1) && (y_ball >270-ball_width && y_ball<280-1))  || //n4
            ((x_ball == 560-1) && (y_ball >260-ball_width && y_ball<335-1))  || //n5
            ((x_ball == 585-1) && (y_ball >325-ball_width && y_ball<335-1))  || //n6
            ((x_ball == 585-1) && (y_ball >325-ball_width && y_ball<435-1)))  //n21
				begin
					stop_left  = 1;
				end
				
        if (((y_ball+ball_width == 20)   && (x_ball >610-ball_width   && x_ball<620-1)) || //n1
            ((y_ball+ball_width == 150)  && (x_ball >548-ball_width   && x_ball<620-1)) || //n2
            ((y_ball+ball_width == 228)  && (x_ball >515-ball_width   && x_ball<591-1)) || //n3
            ((y_ball+ball_width == 228)  && (x_ball >581-ball_width   && x_ball<591-1)) || //n8
            ((y_ball+ball_width == 270)  && (x_ball >581-ball_width   && x_ball<620-1)) || //n9
            ((y_ball+ball_width == 260)  && (x_ball >550-ball_width   && x_ball<560-1)) || //n10
            ((y_ball+ball_width == 325)  && (x_ball >550-ball_width   && x_ball<585-1)) || //n11
            ((y_ball+ball_width == 325)  && (x_ball >575-ball_width   && x_ball<585-1)))   //n21 
				begin 
					stop_down = 1;
				end
				
        if (
		      ((y_ball == 460-1) &&(x_ball >610-ball_width   && x_ball<620-1)) || //n1
            ((y_ball == 160-1) &&(x_ball >548-ball_width   && x_ball<620-1)) || //n2
            ((y_ball == 238-1) &&(x_ball >515-ball_width   && x_ball<591-1)) || //n3
            ((y_ball == 290-1) &&(x_ball >581-ball_width   && x_ball<591-1)) || //n4
            ((y_ball == 280-1) &&(x_ball >581-ball_width   && x_ball<620-1)) || //n5
            ((y_ball == 335-1) &&(x_ball >550-ball_width   && x_ball<560-1)) || //n6
            ((y_ball == 335-1) &&(x_ball >550-ball_width   && x_ball<585-1)) || //n7
            ((y_ball == 435-1) &&(x_ball >575-ball_width   && x_ball<585-1))
		     )   //n21 
				begin 
					stop_up = 1;
				end
     end
endmodule
