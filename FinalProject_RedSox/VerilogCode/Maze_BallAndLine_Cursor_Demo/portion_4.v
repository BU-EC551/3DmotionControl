`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:27 04/13/2014 
// Design Name: 
// Module Name:    portion_4 
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
module portion_4(hcounter, vcounter, enable, x_ball, y_ball, ball_width, stop_right, stop_left, stop_up, stop_down
    );
	 
    input  [10:0] hcounter, vcounter;
	 output        enable;
    input  [10:0] x_ball, y_ball;
    input   [4:0] ball_width;
    output reg    stop_right, stop_left, stop_up, stop_down;
    
	 wire n23,n24 , n25 , n26 , n27 , n28 , n29 , n30 , n31, n32 ,n33 ,n34 ,n35 , n36 , n37 , n38 , n39 ,n40 , n41, n42 , n43 , n44, n45, n46 , n47 , n48;
	 
    assign n23=  (hcounter >482   && hcounter <492   &&  vcounter >46   && vcounter<82);
	 assign n24=  (hcounter >449   && hcounter <459   &&  vcounter >20   && vcounter<46);
	 assign n25=  (hcounter >350   && hcounter <426   &&  vcounter >98   && vcounter<108);
	 assign n26=  (hcounter >350   && hcounter <360   &&  vcounter >98   && vcounter<176);
    assign n27 = (hcounter >317   && hcounter <360   &&  vcounter >150  && vcounter<160);
	 assign n28 = (hcounter >317   && hcounter <327   &&  vcounter >150  && vcounter<264);
	 assign n29 = (hcounter >185   && hcounter <340   &&  vcounter >254  && vcounter<264);
	 assign n30 = (hcounter >185   && hcounter <195   &&  vcounter >176  && vcounter<290);
	 assign n31=  (hcounter >53    && hcounter <195   &&  vcounter >228  && vcounter<238);
	 assign n32=  (hcounter >53    && hcounter <63    &&  vcounter >176  && vcounter<254);
	 assign n33 = (hcounter >119   && hcounter <164   &&  vcounter >254  && vcounter<264);
	 assign n34 = (hcounter >119   && hcounter <129   &&  vcounter >228  && vcounter<264);
	 assign n35 = (hcounter >383   && hcounter <393   &&  vcounter >124  && vcounter<212);
	 assign n36 = (hcounter>317    && hcounter <393   &&  vcounter >192  && vcounter<202);
	 assign n37 = (hcounter>416    && hcounter <426   &&  vcounter >98   && vcounter<238);
	 assign n38 = (hcounter>370    && hcounter <416   &&  vcounter >228  && vcounter<238);
    assign n39 = (hcounter>218    && hcounter <228   &&  vcounter >46   && vcounter<98);
	 assign n40 = (hcounter>185    && hcounter <261   &&  vcounter >124  && vcounter<134);
	 assign n41 = (hcounter>185    && hcounter <195   &&  vcounter >56   && vcounter<134); // new
	 assign n42 = (hcounter>86     && hcounter <228   &&  vcounter >46   && vcounter<56);
	 assign n43 = (hcounter>20     && hcounter <195   &&  vcounter >280  && vcounter<290);
	 assign n44 = (hcounter>86     && hcounter <96    &&  vcounter >254  && vcounter<322);
	 assign n45 = (hcounter>251    && hcounter <261   &&  vcounter >264  && vcounter<280);
	 assign n46 = (hcounter>350    && hcounter <360   &&  vcounter >254  && vcounter<280);
    assign n47 = (hcounter >383   && hcounter <393   &&  vcounter >238  && vcounter<298);
	 assign n48 = (hcounter >284   && hcounter <393   &&  vcounter >288  && vcounter<298);
    assign enable = n23||n24 ||n25 || n26 || n27 || n28 || n29 || n30|| n31||n32 ||n33||n34 ||n35 ||n36 ||n37 ||n38 || n39||n40|| n41||n42 || n43 ||n44||n45 || n46 || n47 || n48;
    
	 
	 // Collision detection
     reg collision;
     always @(x_ball, y_ball, ball_width)
     begin
        stop_right = 0;
        stop_left  = 0;
        stop_up    = 0;
        stop_down  = 0;
        
        if (((x_ball+ball_width == 482)  && (y_ball >46-ball_width  && y_ball<82-1))  || //n23
            ((x_ball+ball_width == 449)  && (y_ball >20-ball_width  && y_ball<46-1))  || //n24
            ((x_ball+ball_width == 350)  && (y_ball >98-ball_width  && y_ball<108-1)) || //n25
            ((x_ball+ball_width == 350)  && (y_ball >98-ball_width  && y_ball<176-1)) || //n26
            ((x_ball+ball_width == 317)  && (y_ball >150-ball_width && y_ball<160-1)) || //n27
            ((x_ball+ball_width == 317)  && (y_ball >150-ball_width && y_ball<264-1)) || //n28
            ((x_ball+ball_width == 185)  && (y_ball >254-ball_width && y_ball<264-1)) || //n29
            ((x_ball+ball_width == 185)  && (y_ball >176-ball_width && y_ball<290-1)) || //n30
            ((x_ball+ball_width == 53)   && (y_ball >228-ball_width && y_ball<238-1)) || //n31
            ((x_ball+ball_width == 53)   && (y_ball >176-ball_width && y_ball<254-1)) || //n32
            ((x_ball+ball_width == 119)  && (y_ball >254-ball_width && y_ball<264-1)) || //n33
	         ((x_ball+ball_width == 119)  && (y_ball >228-ball_width && y_ball<264-1)) || //n34
            ((x_ball+ball_width == 383)  && (y_ball >124-ball_width && y_ball<212-1)) || //n35
            ((x_ball+ball_width == 317)  && (y_ball >192-ball_width && y_ball<202-1)) || //n36
            ((x_ball+ball_width == 416)  && (y_ball >98-ball_width  && y_ball<238-1)) || //n37
            ((x_ball+ball_width == 370)  && (y_ball >228-ball_width && y_ball<238-1)) || //n38
            ((x_ball+ball_width == 218)  && (y_ball >46-ball_width  && y_ball<98-1))  || //n39
            ((x_ball+ball_width == 185)  && (y_ball >124-ball_width && y_ball<134-1)) || //n40
            ((x_ball+ball_width == 185)  && (y_ball >56-ball_width  && y_ball<134-1)) || //n41
            ((x_ball+ball_width == 86)   && (y_ball >46-ball_width  && y_ball<56-1))  || //n42
	         ((x_ball+ball_width == 20)   && (y_ball >280-ball_width && y_ball<290-1)) || //n43
            ((x_ball+ball_width == 86)   && (y_ball >254-ball_width && y_ball<322-1)) || //n44
            ((x_ball+ball_width == 251)  && (y_ball >264-ball_width && y_ball<280-1)) || //n45
            ((x_ball+ball_width == 350)  && (y_ball >254-ball_width && y_ball<280-1)) || //n46
            ((x_ball+ball_width == 383)  && (y_ball >238-ball_width && y_ball<298-1)) || //n47
            ((x_ball+ball_width == 284)  && (y_ball >288-ball_width && y_ball<298-1)))   //n48
				begin
					stop_right = 1;
				end
        if (((x_ball == 492-1) && (y_ball >46-ball_width  && y_ball<82-1))  || //n1
            ((x_ball == 459-1) && (y_ball >20-ball_width  && y_ball<46-1))  || //n2
            ((x_ball == 426-1) && (y_ball >98-ball_width  && y_ball<108-1)) || //n3
            ((x_ball == 360-1) && (y_ball >98-ball_width  && y_ball<176-1)) || //n4
				((x_ball == 360-1) && (y_ball >150-ball_width && y_ball<160-1)) || //n4
            ((x_ball == 327-1) && (y_ball >150-ball_width && y_ball<264-1)) || //n5
            ((x_ball == 340-1) && (y_ball >254-ball_width && y_ball<264-1)) || //n6
            ((x_ball == 195-1) && (y_ball >176-ball_width && y_ball<290-1)) || //n7
            ((x_ball == 195-1) && (y_ball >228-ball_width && y_ball<238-1)) || //n8
            ((x_ball == 63-1)  && (y_ball >176-ball_width && y_ball<254-1)) || //n9
            ((x_ball == 164-1) && (y_ball >254-ball_width && y_ball<264-1)) || //n10
            ((x_ball == 129-1) && (y_ball >228-ball_width && y_ball<264-1)) || //n11
            ((x_ball == 393-1) && (y_ball >124-ball_width && y_ball<212-1)) || //n12
            ((x_ball == 393-1) && (y_ball >192-ball_width && y_ball<202-1)) || //n13
            ((x_ball == 426-1) && (y_ball >98-ball_width  && y_ball<238-1)) || //n14
            ((x_ball == 416-1) && (y_ball >228-ball_width && y_ball<238-1)) || //n15
            ((x_ball == 228-1) && (y_ball >46-ball_width  && y_ball<98-1))  || //n16
            ((x_ball == 261-1) && (y_ball >124-ball_width && y_ball<134-1)) || //n17
            ((x_ball == 195-1) && (y_ball >56-ball_width  && y_ball<134-1)) || //n18
            ((x_ball == 228-1) && (y_ball >46-ball_width  && y_ball<56-1))  || //n19
            ((x_ball == 195-1) && (y_ball >280-ball_width && y_ball<290-1)) || //n20
				((x_ball == 96-1)  && (y_ball >254-ball_width && y_ball<322-1)) || //n17
            ((x_ball == 261-1) && (y_ball >264-ball_width && y_ball<280-1)) || //n18
            ((x_ball == 360-1) && (y_ball >254-ball_width && y_ball<280-1)) || //n19            ((x_ball == 393-1) && (y_ball >238-ball_width && y_ball<298-1)) || //n17
            ((x_ball == 393-1) && (y_ball >288-ball_width && y_ball<298-1))) //n21
				begin
					stop_left  = 1;
				end
				
        if (((y_ball+ball_width == 46)  && (x_ball >482-ball_width   && x_ball<492-1)) || //n1
            ((y_ball+ball_width == 20)  && (x_ball >449-ball_width   && x_ball<459-1)) || //n2
            ((y_ball+ball_width == 98)  && (x_ball >350-ball_width   && x_ball<426-1)) || //n3
            ((y_ball+ball_width == 98)  && (x_ball >350-ball_width   && x_ball<360-1)) || //n4
            ((y_ball+ball_width == 150) && (x_ball >317-ball_width   && x_ball<360-1)) || //n5
            ((y_ball+ball_width == 150) && (x_ball >317-ball_width   && x_ball<327-1)) || //n6
            ((y_ball+ball_width == 254) && (x_ball >185-ball_width   && x_ball<340-1)) || //n7
            ((y_ball+ball_width == 176) && (x_ball >185-ball_width   && x_ball<195-1)) || //n8
            ((y_ball+ball_width == 228) && (x_ball >53-ball_width    && x_ball<195-1)) || //n9
            ((y_ball+ball_width == 176) && (x_ball >53-ball_width    && x_ball<63-1))  || //n10
            ((y_ball+ball_width == 254) && (x_ball >119-ball_width   && x_ball<164-1)) || //n11
            ((y_ball+ball_width == 228) && (x_ball >119-ball_width   && x_ball<129-1)) || //n12
            ((y_ball+ball_width == 124) && (x_ball >383-ball_width   && x_ball<393-1)) || //n13
            ((y_ball+ball_width == 192) && (x_ball >317-ball_width   && x_ball<393-1)) || //n14
            ((y_ball+ball_width == 98)  && (x_ball >416-ball_width   && x_ball<426-1)) || //n15
            ((y_ball+ball_width == 228) && (x_ball >370-ball_width   && x_ball<416-1)) || //n16
				((y_ball+ball_width == 46)  && (x_ball >218-ball_width   && x_ball<228-1)) || //n12
            ((y_ball+ball_width == 124) && (x_ball >185-ball_width   && x_ball<261-1)) || //n13
            ((y_ball+ball_width == 56)  && (x_ball >185-ball_width   && x_ball<195-1)) || //n14
            ((y_ball+ball_width == 46)  && (x_ball >86-ball_width    && x_ball<228-1)) || //n15
            ((y_ball+ball_width == 280) && (x_ball >20-ball_width    && x_ball<195-1)) || //n16
            ((y_ball+ball_width == 254) && (x_ball >86-ball_width    && x_ball<96-1))  || //n17
            ((y_ball+ball_width == 264) && (x_ball >251-ball_width   && x_ball<261-1)) || //n18
            ((y_ball+ball_width == 254) && (x_ball >350-ball_width   && x_ball<360-1)) || //n19
            ((y_ball+ball_width == 238) && (x_ball >383-ball_width   && x_ball<393-1)) || //n20
				((y_ball+ball_width == 288) && (x_ball >284-ball_width   && x_ball<393-1)))   //n21 
				begin 
					stop_down = 1;
				end
				
        if (
		      ((y_ball == 82-1)  && (x_ball >482-ball_width  && x_ball<492-1)) || //n1
            ((y_ball == 46-1)  && (x_ball >449-ball_width  && x_ball<459-1)) || //n2
            ((y_ball == 108-1) && (x_ball >350-ball_width  && x_ball<426-1)) || //n3
            ((y_ball == 176-1) && (x_ball >350-ball_width  && x_ball<360-1)) || //n4
            ((y_ball == 160-1) && (x_ball >317-ball_width  && x_ball<360-1)) || //n5
            ((y_ball == 264-1) && (x_ball >317-ball_width  && x_ball<327-1)) || //n6
            ((y_ball == 264-1) && (x_ball >185-ball_width  && x_ball<340-1)) || //n7
            ((y_ball == 290-1) && (x_ball >185-ball_width  && x_ball<195-1)) || //n8
            ((y_ball == 238-1) && (x_ball >53-ball_width   && x_ball<195-1)) || //n9
            ((y_ball == 254-1) && (x_ball >53-ball_width   && x_ball<63-1)) || //n10
            ((y_ball == 264-1) && (x_ball >119-ball_width  && x_ball<164-1)) || //n11
            ((y_ball == 264-1) && (x_ball >119-ball_width  && x_ball<129-1)) || //n12
            ((y_ball == 212-1) && (x_ball >383-ball_width  && x_ball<393-1)) || //n13
            ((y_ball == 202-1) && (x_ball >317-ball_width  && x_ball<393-1)) || //n14
            ((y_ball == 238-1) && (x_ball >416-ball_width  && x_ball<426-1)) || //n15
            ((y_ball == 238-1) && (x_ball >370-ball_width  && x_ball<416-1)) || //n16
            ((y_ball == 98-1)  && (x_ball >218-ball_width  && x_ball<228-1)) || //n17
            ((y_ball == 134-1) && (x_ball >185-ball_width  && x_ball<261-1)) || //n18
            ((y_ball == 134-1) && (x_ball >185-ball_width  && x_ball<195-1)) || //n19
            ((y_ball == 56-1)  && (x_ball >86-ball_width   && x_ball<228-1)) || //n20
				((y_ball == 290-1) && (x_ball >20-ball_width   && x_ball<195-1)) || 
            ((y_ball == 322-1) && (x_ball >86-ball_width   && x_ball<96-1))  || //n10
            ((y_ball == 280-1) && (x_ball >251-ball_width  && x_ball<261-1)) || //n11
            ((y_ball == 280-1) && (x_ball >350-ball_width  && x_ball<360-1)) || //n12
            ((y_ball == 298-1) && (x_ball >383-ball_width  && x_ball<393-1)) || //n13
				((y_ball == 298-1) && (x_ball >284-ball_width  && x_ball<393-1))
		     )   //n21 
				begin 
					stop_up = 1;
				end
     end
endmodule
