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
	 
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;
	 
	 wire n1, n2, n3, n4, n5, n6, n7 , n8 , n9 , n10 ,n11 , n12 , n13 , n14 , n15 , n16 ,n17 , n18 ,n19, n20,n21,n22;


    assign n1 =  (hcounter >53    && hcounter <620   &&  vcounter >20   && vcounter<30);
	 assign n2 =  (hcounter >251   && hcounter <261   &&  vcounter >20   && vcounter<202);
	 assign n3 =  (hcounter >261   && hcounter <294   &&  vcounter >98   && vcounter<108);
	 assign n4 =  (hcounter >284   && hcounter <294   &&  vcounter >20   && vcounter<82);
	 assign n5 =  (hcounter >284   && hcounter <492   &&  vcounter >72   && vcounter<82);
	 assign n6 =  (hcounter >317   && hcounter <327   &&  vcounter >72   && vcounter<134);
	 assign n7 =  (hcounter >284   && hcounter <327   &&  vcounter >124  && vcounter<134);
	 assign n8 =  (hcounter >284   && hcounter <294   &&  vcounter >124  && vcounter<238);
	 assign n9 =  (hcounter >218   && hcounter <294   &&  vcounter >228  && vcounter<238);
	 assign n10 = (hcounter>218    && hcounter <228   &&  vcounter >150  && vcounter<238);
	 assign n11 = (hcounter>152    && hcounter <228   &&  vcounter >150  && vcounter<160);
	 assign n12 = (hcounter>152    && hcounter <162   &&  vcounter >150  && vcounter<212);
    assign n14 = (hcounter>86     && hcounter <96    &&  vcounter >124  && vcounter<212);
	 assign n15 = (hcounter>86     && hcounter <162   &&  vcounter >124  && vcounter<134); 
	 assign n16 = (hcounter>152    && hcounter <162   &&  vcounter >72   && vcounter<134);
	 assign n17 = (hcounter>119    && hcounter <129   &&  vcounter >72   && vcounter<176);
	 assign n18 = (hcounter>53     && hcounter <129   &&  vcounter >72   && vcounter<82);
	 assign n19 = (hcounter>53     && hcounter <63    &&  vcounter >46   && vcounter<82);
	 assign n20 = (hcounter>317    && hcounter <327   &&  vcounter >20   && vcounter<46);
	 assign n21 = (hcounter >350   && hcounter <426   &&  vcounter >46   && vcounter<56);
	 assign n22 = (hcounter >416   && hcounter <426   &&  vcounter >46   && vcounter<82);
    assign enable = n1||n2||n3||n4||n5||n6|| n7||n8||n9||n10||n11||n12||n13||n14||n15||n16||n17||n18||n19|n20||n21||n22;
   
	 
	 // Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 53)   && (y_ball >20-ball_width  && y_ball<30-1))  || //n1
            ((x_ball+ball_width == 251)  && (y_ball >20-ball_width  && y_ball<202-1)) || //n2
            ((x_ball+ball_width == 261)  && (y_ball >98-ball_width  && y_ball<108-1)) || //n3
            ((x_ball+ball_width == 284)  && (y_ball >20-ball_width  && y_ball<82-1))  || //n4
            ((x_ball+ball_width == 284)  && (y_ball >72-ball_width  && y_ball<82-1))  || //n5
            ((x_ball+ball_width == 317)  && (y_ball >72-ball_width  && y_ball<134-1)) || //n6
            ((x_ball+ball_width == 284)  && (y_ball >124-ball_width && y_ball<134-1)) || //n7
            ((x_ball+ball_width == 284)  && (y_ball >124-ball_width && y_ball<238-1)) || //n8
            ((x_ball+ball_width == 218)  && (y_ball >228-ball_width && y_ball<238-1)) || //n9
            ((x_ball+ball_width == 218)  && (y_ball >150-ball_width && y_ball<238-1)) || //n10
            ((x_ball+ball_width == 152)  && (y_ball >150-ball_width && y_ball<160-1)) || //n11
            ((x_ball+ball_width == 152)  && (y_ball >150-ball_width && y_ball<212-1)) || //n12
            ((x_ball+ball_width == 86)   && (y_ball >124-ball_width && y_ball<212-1)) || //n13
            ((x_ball+ball_width == 86)   && (y_ball >124-ball_width && y_ball<134-1)) || //n14
            ((x_ball+ball_width == 152)  && (y_ball >72-ball_width  && y_ball<134-1)) || //n16
            ((x_ball+ball_width == 119)  && (y_ball >72-ball_width  && y_ball<176-1)) || //n17
            ((x_ball+ball_width == 53)   && (y_ball >72-ball_width  && y_ball<82-1))  || //n18
            ((x_ball+ball_width == 53)   && (y_ball >46-ball_width  && y_ball<82-1))  || //n19
            ((x_ball+ball_width == 317)  && (y_ball >20-ball_width  && y_ball<46-1))  || //n20
            ((x_ball+ball_width == 350)  && (y_ball >46-ball_width  && y_ball<56-1))  || //n21
            ((x_ball+ball_width == 416)  && (y_ball >46-ball_width  && y_ball<82-1)))   //n22
				begin
	           stop_right = 1;
            end
				
        if (((x_ball == 620-1)  && (y_ball >20-ball_width  && y_ball<30-1))  || //n1
            ((x_ball == 261-1)  && (y_ball >20-ball_width  && y_ball<202-1)) || //n2
            ((x_ball == 294-1)  && (y_ball >98-ball_width  && y_ball<108-1)) || //n3
            ((x_ball == 294-1)  && (y_ball >20-ball_width  && y_ball<82-1))  || //n4
            ((x_ball == 492-1)  && (y_ball >72-ball_width  && y_ball<82-1))  || //n5
            ((x_ball == 327-1)  && (y_ball >72-ball_width  && y_ball<134-1)) || //n6
            ((x_ball == 327-1)  && (y_ball >124-ball_width && y_ball<134-1)) || //n7
            ((x_ball == 294-1)  && (y_ball >124-ball_width && y_ball<238-1)) || //n8
            ((x_ball == 294-1)  && (y_ball >228-ball_width && y_ball<238-1)) || //n9
            ((x_ball == 228-1)  && (y_ball >150-ball_width && y_ball<238-1)) || //n10
            ((x_ball == 228-1)  && (y_ball >150-ball_width && y_ball<160-1)) || //n11
            ((x_ball == 162-1)  && (y_ball >150-ball_width && y_ball<212-1)) || //n12
            ((x_ball == 96-1)   && (y_ball >124-ball_width && y_ball<212-1)) || //n14
            ((x_ball == 162-1)  && (y_ball >124-ball_width && y_ball<134-1)) || //n15
            ((x_ball == 162-1)  && (y_ball >72-ball_width  && y_ball<134-1)) || //n16
            ((x_ball == 129-1)  && (y_ball >72-ball_width  && y_ball<176-1)) || //n17
            ((x_ball == 129-1)  && (y_ball >72-ball_width  && y_ball<82-1))  || //n18
            ((x_ball == 63-1)   && (y_ball >46-ball_width  && y_ball<82-1))  || //n19
            ((x_ball == 327-1)  && (y_ball >20-ball_width  && y_ball<46-1))  || //n20
            ((x_ball == 426-1)  && (y_ball >46-ball_width  && y_ball<56-1))  || //n21
            ((x_ball == 426-1)  && (y_ball >46-ball_width  && y_ball<82-1)))   //n22
				begin
	           stop_left = 1;
            end
				
        if (((y_ball+ball_width == 20)  && (x_ball >53-ball_width    && x_ball<620-1))  || //n1
            ((y_ball+ball_width == 20)  && (x_ball >251-ball_width   && x_ball<261-1))  || //n2
            ((y_ball+ball_width == 98)  && (x_ball >261-ball_width   && x_ball<294-1))  || //n3
            ((y_ball+ball_width == 20)  && (x_ball >284-ball_width   && x_ball<294-1))  || //n4
            ((y_ball+ball_width == 72)  && (x_ball >284-ball_width   && x_ball<492-1))  || //n5
            ((y_ball+ball_width == 72)  && (x_ball >317-ball_width   && x_ball<327-1))  || //n6
            ((y_ball+ball_width == 124) && (x_ball >284-ball_width   && x_ball<327-1))  || //n7
            ((y_ball+ball_width == 124) && (x_ball >284-ball_width   && x_ball<294-1))  || //n8
            ((y_ball+ball_width == 228) && (x_ball >218-ball_width   && x_ball<294-1))  || //n9
            ((y_ball+ball_width == 150) && (x_ball >218-ball_width   && x_ball<228-1))  || //n10
            ((y_ball+ball_width == 150) && (x_ball >152-ball_width   && x_ball<228-1))  || //n11
            ((y_ball+ball_width == 150) && (x_ball >152-ball_width   && x_ball<162-1))  || //n12
            ((y_ball+ball_width == 124) && (x_ball >86-ball_width    && x_ball<96-1))   || //n14
            ((y_ball+ball_width == 124) && (x_ball >86-ball_width    && x_ball<162-1))  || //n15
            ((y_ball+ball_width == 72)  && (x_ball >152-ball_width   && x_ball<162-1))  || //n16
            ((y_ball+ball_width == 72)  && (x_ball >119-ball_width   && x_ball<129-1))  || //n17
            ((y_ball+ball_width == 72)  && (x_ball >53-ball_width    && x_ball<129-1))  || //n18
            ((y_ball+ball_width == 46)  && (x_ball >53-ball_width    && x_ball<63-1))   || //n19
            ((y_ball+ball_width == 20)  && (x_ball >317-ball_width   && x_ball<327-1))  || //n20
            ((y_ball+ball_width == 46)  && (x_ball >350-ball_width   && x_ball<426-1))  || //n21
            ((y_ball+ball_width == 46)  && (x_ball >416-ball_width   && x_ball<426-1)))   //n22
				begin
					stop_down = 1;
				end
		  
        if (((y_ball == 30-1)  && (x_ball >53-ball_width    && x_ball<620-1))  || //n1
            ((y_ball == 202-1) && (x_ball >251-ball_width   && x_ball<261-1))  || //n2
            ((y_ball == 108-1) && (x_ball >261-ball_width   && x_ball<294-1))  || //n3
            ((y_ball == 82-1)  && (x_ball >284-ball_width   && x_ball<294-1))  || //n4
            ((y_ball == 82-1)  && (x_ball >284-ball_width   && x_ball<492-1))  || //n5
            ((y_ball == 134-1) && (x_ball >317-ball_width   && x_ball<327-1))  || //n6
            ((y_ball == 134-1) && (x_ball >284-ball_width   && x_ball<327-1))  || //n7
            ((y_ball == 238-1) && (x_ball >284-ball_width   && x_ball<294-1))  || //n8
            ((y_ball == 238-1) && (x_ball >218-ball_width   && x_ball<294-1))  || //n9
            ((y_ball == 238-1) && (x_ball >218-ball_width   && x_ball<228-1))  || //n10
            ((y_ball == 160-1) && (x_ball >152-ball_width   && x_ball<228-1))  || //n11
            ((y_ball == 212-1) && (x_ball >152-ball_width   && x_ball<162-1))  || //n12
            ((y_ball == 212-1) && (x_ball >86-ball_width    && x_ball<96-1))   || //n13
            ((y_ball == 134-1) && (x_ball >86-ball_width    && x_ball<162-1))  || //n15
            ((y_ball == 134-1) && (x_ball >152-ball_width   && x_ball<162-1))  || //n16
            ((y_ball == 176-1) && (x_ball >119-ball_width   && x_ball<129-1))  || //n17
            ((y_ball == 82-1)  && (x_ball >53-ball_width    && x_ball<129-1))  || //n18
            ((y_ball == 82-1)  && (x_ball >53-ball_width    && x_ball<63-1))   || //n19
            ((y_ball == 46-1)  && (x_ball >317-ball_width   && x_ball<327-1))  || //n20
            ((y_ball == 56-1)  && (x_ball >350-ball_width   && x_ball<426-1))  || //n21
            ((y_ball == 82-1)  && (x_ball >416-ball_width   && x_ball<426-1)))   //n22
				begin
					stop_up = 1;
				end
     end
endmodule

